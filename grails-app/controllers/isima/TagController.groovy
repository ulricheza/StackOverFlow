package isima

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class TagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def afterInterceptor = { model ->
        model.selectedTab = 'tags'
    }

    // Autocompletion used in topic/create
    def searchAJAX () {
        def tags = Tag.findAllByTagNameLike("%${params.term}%")

        def response = []
 
        tags.each{
            response << "${it.tagName}"
        }
 
        render response as JSON
    }

    // Autocompletion used in tag/list
    def findTagsAjax () {
        def tags = Tag.findAllByTagNameLike("%${params.term}%")

        def toRender = tags.collect { tag->
            ["tagName": tag.tagName, "description":tag.description, "id":tag.id] 
        }

        def result = ["tags" : toRender]
        render result as JSON
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 16, 100)
        [tagInstanceList: Tag.list(params), tagInstanceTotal: Tag.count()]
    }

    def create() {
        [tagInstance: new Tag(params)]
    }

    def save() {
        def tagInstance = new Tag(params)
        if (!tagInstance.save(flush: true)) {
            render(view: "create", model: [tagInstance: tagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tag.label', default: 'Tag'), tagInstance.id])
        redirect(action: "show", id: tagInstance.id)
    }

    def show(Long id) {

        def topicsList = Tag.get(id).taggedTopics
        params.max = Math.min(topicsList.size() ?: 16, 100)

        def messageHeaders = []
        topicsList.each {
            messageHeaders.add(it.replies[0].content.take(250) + ' ...')
        }

        [topicInstanceList:topicsList , messageHeaders:messageHeaders, topicInstanceTotal: topicsList.size(), tagName: Tag.get(id).tagName]    



        /*def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        [tagInstance: tagInstance]*/
    }

    def edit(Long id) {
        def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        [tagInstance: tagInstance]
    }

    def update(Long id, Long version) {
        def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tagInstance.version > version) {
                tagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tag.label', default: 'Tag')] as Object[],
                          "Another user has updated this Tag while you were editing")
                render(view: "edit", model: [tagInstance: tagInstance])
                return
            }
        }

        tagInstance.properties = params

        if (!tagInstance.save(flush: true)) {
            render(view: "edit", model: [tagInstance: tagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tag.label', default: 'Tag'), tagInstance.id])
        redirect(action: "show", id: tagInstance.id)
    }

    def delete(Long id) {
        def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        try {
            tagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "show", id: id)
        }
    }
}
