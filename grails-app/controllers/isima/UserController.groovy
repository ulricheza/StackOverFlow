package isima

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import grails.converters.JSON

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def userService
    def springSecurityService

    def afterInterceptor = { model ->
        model.selectedTab = 'users'
    }


    //  Used in user/list
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def findUsersAjax () {
        def users = User.findAllByUsernameLike("%${params.term}%")

        def toRender = users.collect { user->
            ["username": user.username, "location":(user.location==null)?"":user.location, "id":user.id, "img":user.profileImage.encodeBase64().toString()] 
        }

        def result = ["users" : toRender]
        render result as JSON
    }



    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def create() {
        if (springSecurityService.isLoggedIn()) {
            flash.message = 'logout first'
            redirect(action: "list")            
        }

        [userInstance: new User(params)]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def save() {

        params.reputation = ReputationService.INITIAL_REPUTATION
        def userInstance = new User(params)  
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        userInstance.enabled = true
        if(!userInstance.profileImage.size()) userInstance.profileImage = userService.loadDefaultProfileImage()       

        // defining roles
        def userRole = Role.findByAuthority('ROLE_USER')
        UserRole.create userInstance, userRole, true

        // authentificate the user right away
        springSecurityService.reauthenticate userInstance.username

        redirect(action: "show", id: userInstance.id)
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }


        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        def user = springSecurityService.currentUser 
        if (user != userInstance){
            flash.message = message(code:'default.not.allowed.message')
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}