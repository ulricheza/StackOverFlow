package isima

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

class TopicController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService
    def tagService
    def topicService
    def privilegeService
    def reputationService

    def afterInterceptor = { model, modelAndView ->
        if ("${modelAndView?.viewName}" == "/topic/create")
            model.selectedTab = "askQuestion"
        else
            model.selectedTab = "questions"
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [topicInstanceList:Topic.list(params) ,topicInstanceTotal: Topic.count()]
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def create() {
        [topicInstance: new Topic(params)]
    }

    def save() {
        // logged user
    	def user = springSecurityService.currentUser 

        // Topic
    	params.author = user
    	params.creationDate = new Date()
    	params.resolved = false
        def topicInstance = new Topic(params)

        // Topic's message
        params.replyDate = new Date()
        params.topic = topicInstance
        def topicInstanceMessage = new Message(params)
        topicInstanceMessage.validate()

        // Topic tags
        topicInstance.tags = tagService.findOrCreateTags(params.tagNames)

        // Relationships requirements. The topic message is always duplicate (one in Topic and one in User)        
        topicInstance.addToReplies(topicInstanceMessage)
        user.addToAnswers(topicInstanceMessage)
        user.addToQuestions(topicInstance)

        // Saving
        if (!topicInstance.save(flush: true)) {
            render(view: "create", model: [topicInstance:topicInstance, 
                                           topicInstanceMessage:topicInstanceMessage,
                                           topicInstanceTags:params.tagNames])
            return
        }

        flash.message = message(code:'default.created.topic.message')
        redirect(action: "show", id: topicInstance.id)
    }
    
    def toggleAnswerStatus (Long id) {

        if (!springSecurityService.isLoggedIn()){
            if (request.xhr) {
                render(text:"<script>showLogin();</script>", contentType: "js", encoding: "UTF-8")
                return
            }
            else{
                redirect(controller:"login")
                return
            }
        }

        def acceptor = springSecurityService.currentUser 
        def newAnswer = Message.get(id)
        def topicInstance = newAnswer?.topic 

        if (!request.xhr) {
            redirect(controller:"topic", action:"list")
            return
        }  
        if (!newAnswer) {
            render(text:"<script>location.reload('true');</script>", contentType: "js", encoding: "UTF-8")
            return
        }         

        def model = privilegeService.canToggleAnswerStatus(acceptor,topicInstance,newAnswer)
        if (model.result=='false'){
            String errorMsg = message(code:'default.cannotAcceptAnswer.message',default:model.errorMsg)
            render(template:'/shared/errorMessage', model:[msg_id:newAnswer.id,errorMsg:errorMsg,suffix:'toggle'], layout:'ajax')
            return
        }

        def prevAnswer = topicInstance.revokeAnswersExcept(newAnswer)
        newAnswer.accepted = !newAnswer.accepted
        topicInstance.resolved = newAnswer.accepted

        reputationService.acceptAnswer(acceptor,prevAnswer,newAnswer)       

        render(template:'updateAcceptedAnswer', model:[msg_id:id,accepted:newAnswer.accepted], layout:'ajax')
        return
    }

    def show(Long id) {
        params.max = 10

        def topicInstance = Topic.get(id)
        if (!topicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), id])
            redirect(action: "list")
            return
        }

        def topicReplies = topicInstance.replies - topicInstance.replies[0]
        int topicInstanceTotal = topicReplies.size()
        if (topicReplies.size() > 0) {
            int offset 

            try {
                offset = params.offset ?Integer.parseInt(params.offset):0                  
            }
            catch(NumberFormatException e) {
                offset = 0
            }            
             
            if (offset >= topicReplies.size()) offset = 0
            params.offset = offset 
            
            int max = offset + params.max - 1               
            if (max >= topicReplies.size()) max = -1

            topicReplies=topicReplies[offset..max]         
        }

        [topicInstance: topicInstance,topicReplies:topicReplies,topicInstanceTotal:topicInstanceTotal]        
    }

    def edit(Long id) {
        def topicInstance = Topic.get(id)
        if (!topicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), id])
            redirect(action: "list")
            return
        }

        def user = springSecurityService.currentUser 
        if (user != topicInstance.author){
            flash.message = message(code:'default.not.allowed.message')
            redirect(action: "list")
            return
        }

        [topicInstance: topicInstance]
    }

    def update(Long id, Long version) {
        def topicInstance = Topic.get(id)
        if (!topicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (topicInstance.version > version) {
                topicInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'topic.label', default: 'Topic')] as Object[],
                          "Another user has updated this Topic while you were editing")
                render(view: "edit", model: [topicInstance: topicInstance])
                return
            }
        }

        topicInstance.properties = params

        if (!topicInstance.save(flush: true)) {
            render(view: "edit", model: [topicInstance: topicInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
        redirect(action: "show", id: topicInstance.id)
    }

    def delete(Long id) {
        def topicInstance = Topic.get(id)
        if (!topicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), id])
            redirect(action: "list")
            return
        }

        try {
            topicInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), id])
            redirect(action: "show", id: id)
        }
    }
}