package isima

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

class MessageController {

    static allowedMethods = [create: "POST", save: "POST", update: "POST", delete: "POST"]

    def springSecurityService
    def privilegeService
    def badgeService
    def reputationService
    
    def afterInterceptor = { model ->
        model.selectedTab = "questions"
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def create() {
        [messageInstance: new Message(params),topicInstance:Topic.get(params.topic_id)]
    }

    def save() {

        // logged user
        def user = springSecurityService.currentUser 

        // topic associated
        def topic = Topic.findById(params.topic_id)
       
        params.author = user
        params.topic = topic
        params.replyDate = new Date()
        
        def messageInstance = new Message(params)

        topic.addToReplies(messageInstance)

        if (!messageInstance.save(flush: true)) {
            topic.removeFromReplies(messageInstance)
            user.removeFromAnswers(messageInstance)
            render(view: "create", model: [messageInstance:messageInstance,topicInstance:topic])
            return
        }
        
        // computing in order to redirect to the last page of the topic.show() page
        int max = 10
        int offset = Math.floor((topic.replies.size()-2)/max)*max
        
        redirect(controller:"topic", action: "show", id: topic.id, params:[offset:offset])
    }

    def addComment (Long id) {

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

        def user = springSecurityService.currentUser
        def messageInstance = Message.get(id)

        if (!request.xhr) {
            redirect(controller:"topic", action:"show", id:messageInstance.topic.id)
            return
        }  
        if (!messageInstance) {
            render(text:"<script>location.reload('true')</script>", contentType: "js", encoding: "UTF-8")
            return
        }          

        def model = privilegeService.canComment(user,messageInstance)
        if (model.result=='false'){
            String errorMsg = message(code:model.code, default:model.errorMsg, args:[model.args])
            render(template:'/shared/errorMessage', model:[msg_id:id,errorMsg:errorMsg,suffix:'addCom'], layout:'ajax')
            return
        }

        render(template:'/shared/submitComment',model:[messageInstance:messageInstance], layout:'ajax')
    }

    def voteUp (Long id) {

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

        def user = springSecurityService.currentUser
        def messageInstance = Message.get(id)

        if (!request.xhr) {
            redirect(controller:"topic", action:"list")
            return
        } 
        if (!messageInstance) {
            render(text:"<script>location.reload('true')</script>", contentType: "js", encoding: "UTF-8")
            return
        }  

        def model = privilegeService.canVoteUp(user,messageInstance)
        if (model.result=='false'){           
            String errorMsg = message(code:model.code, default:model.errorMsg, args:[model.args])
            render(template:'/shared/errorMessage', model:[msg_id:id,errorMsg:errorMsg,suffix:'voteUp'], layout:'ajax')
            return
        }

        messageInstance.score +=1

        badgeService.addModerationBadge(user,BadgeService.SUPPORTER)
        if (messageInstance.isQuestion()) {
            badgeService.updateQuestionBadges(messageInstance)
            reputationService.voteUpQuestion(messageInstance.author)
        }
        else {
            badgeService.updateAnswerBadges(messageInstance)
            reputationService.voteUpAnswer(messageInstance.author)
        }
        
        render(template:'/shared/newMsgScore', model:[msg_id:id,score:messageInstance.score], layout:'ajax')
    }

    def voteDown (Long id) {

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

        def voter = springSecurityService.currentUser
        def messageInstance = Message.get(id)

        if (!request.xhr) {
            redirect(controller:"topic", action:"show", id:messageInstance.topic.id)
            return
        } 
        if (!messageInstance) {
            render(text:"<script>location.reload('true')</script>", contentType: "js", encoding: "UTF-8")
            return
        } 
        
        def model = privilegeService.canVoteDown(voter,messageInstance)
        if (model.result=='false'){
            String errorMsg = message(code:model.code, default:model.errorMsg, args:[model.args])
            render(template:'/shared/errorMessage', model:[msg_id:id,errorMsg:errorMsg,suffix:'voteDown'], layout:'ajax')
            return
        }

        messageInstance.score -=1

        badgeService.addModerationBadge(voter,BadgeService.CRITIC)
        if (messageInstance.isQuestion()) {
            badgeService.updateQuestionBadges(messageInstance)
            reputationService.voteDownQuestion(messageInstance.author)
        }
        else {
            badgeService.updateAnswerBadges(messageInstance)
            reputationService.voteDownAnswer(voter,messageInstance.author)
        }

        render(template:'/shared/newMsgScore', model:[msg_id:id,score:messageInstance.score], layout:'ajax')
    }

    def edit(Long id) {

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

        def user = springSecurityService.currentUser
        def messageInstance = Message.get(id)

        if (!messageInstance) {
            if(request.xhr) {
                render(text:"<script>location.reload('true')</script>", contentType: "js", encoding: "UTF-8")
                return
            }
            else {
                flash.message = message(code:'default.not.found.message', args:[message(code: 'message.label', default:'Message')])
                redirect(controller:"topic", action:"list")
                return
            }
        }

        def model = privilegeService.canEdit(user,messageInstance)
        if (model.result=='false'){
            if(request.xhr) { 
                String errorMsg = message(code:model.code, default:model.errorMsg, args:[model.args])
                render(template:'/shared/errorMessage', model:[msg_id:id,errorMsg:errorMsg,suffix:'edit'], layout:'ajax')
                return
            }
            else {
                flash.message = model.errorMsg
                redirect(controller:"topic", action:"list")
                return
            }
        }
        
        if(request.xhr) { 
            render(template:'goToEdit', model:[msg_id:id], layout:'ajax')
            return
        }

        [messageInstance:messageInstance]
    }

    def canDelete(Long id) {

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

        def user = springSecurityService.currentUser
        def messageInstance = Message.get(id)

        // probably a bug of the grails version : each param of a remoteLink
        // got transformed into a list with the value duplicated
        def list = params.offset as List
        params.offset = list? list.get(0) : 0
        
        if (!request.xhr) {
            redirect(controller:"topic", action:"list")
            return
        } 
        if (!messageInstance) {
            render(text:"<script>location.reload('true')</script>", contentType: "js", encoding: "UTF-8")
            return
        } 
        
        def model = privilegeService.canDelete(user,messageInstance)
        if (model.result=='false'){
            String errorMsg = message(code:model.code, default:model.errorMsg, args:[model.args])
            render(template:'/shared/errorMessage', model:[msg_id:id,errorMsg:errorMsg,suffix:'edit'], layout:'ajax')
            return
        }

        render(template:'/shared/confirmation', model:[controller:'message',action:'delete',id:id,offset:params.offset], layout:'ajax')
    }

    def delete(Long id) {

        def user = springSecurityService.currentUser
        def messageInstance = Message.get(id)
        def topic = messageInstance?.topic
        def author = messageInstance?.author

        if (!messageInstance) {
            flash.message = message(code:'default.not.found.message', args:[message(code: 'message.label', default:'Message')])
            redirect(controller:"topic", action:"list")
            return
        }     

        def model = privilegeService.canDelete(user,messageInstance)
        if (model.result=='false'){
            flash.message = message(code:model.code, default:model.errorMsg, args:[model.args])
            redirect(controller:"topic", action:"list")
            return 
        }

        try {
            
            if (messageInstance.isQuestion()) {
                topic.delete(flush:true)
                flash.message = message(code:'default.deleted.topic.message')
                redirect(uri: "/")
                return
            }
            
            if (messageInstance.accepted){
                messageInstance.accepted = false
                topic.resolved = false
                reputationService.acceptAnswer(topic.author,messageInstance,messageInstance)    
            }

            author.removeFromAnswers(messageInstance)
            topic.removeFromReplies(messageInstance)
            messageInstance.delete(flush:true)

            redirect(controller:"topic",action:"show",id:topic.id,params:[offset:params.offset])
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'message.label', default: 'Message')])
            redirect(controller:"topic",action:"show",id:topic.id,params:params)
        }
    }

    def update(Long id, Long version) {
        def messageInstance = Message.get(id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (messageInstance.version > version) {
                messageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'message.label', default: 'Message')] as Object[],
                          "Another user has updated this Message while you were editing")
                render(view: "edit", model: [messageInstance: messageInstance])
                return
            }
        }

        messageInstance.properties = params

        if (!messageInstance.save(flush: true)) {
            render(view: "edit", model: [messageInstance: messageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'message.label', default: 'Message')])
        redirect(controller:"topic", action:"show", id:messageInstance.topic.id)
    }
}