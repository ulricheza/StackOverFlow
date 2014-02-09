package isima

import org.springframework.dao.DataIntegrityViolationException

class CommentController {

    static allowedMethods = [save: "POST"]

    def save() {
        def messageInstance = Message.get(params.msg_id)

        params.relatedMsg = messageInstance
        params.replyDate = new Date()
        def commentInstance = new Comment(params)

        messageInstance.addToComments(commentInstance)

        if (!commentInstance.save(flush: true)) {
            messageInstance.removeFromComments(commentInstance)
            render(template:'/shared/submitComment', model:[commentInstance:commentInstance, messageInstance:messageInstance, status:'failure'], layout:'ajax')
            return
        }

        render(template:'/shared/submitComment', model:[commentInstance:commentInstance, messageInstance:messageInstance, status:'success'], layout:'ajax')
    }    
}