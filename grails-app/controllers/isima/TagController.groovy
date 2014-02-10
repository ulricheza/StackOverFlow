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
            ["tagName": tag.tagName, "id":tag.id] 
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
        params.max = 10

        def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        def topicsList = tagInstance.taggedTopics
        [topicInstanceList:topicsList, topicInstanceTotal: topicsList.size(),tagInstance:tagInstance]    
    }
}