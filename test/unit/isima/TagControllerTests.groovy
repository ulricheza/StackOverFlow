package isima

import org.junit.*
import grails.test.mixin.*

@TestFor(TagController)
@Mock(Tag)
class TagControllerTests {

    def populateValidParams(params) {
        assert params != null

        params.tagName = "Sample"
        params.description = ""
    }

    void testSearchAJAX() {
        request.method = "POST"
        request.makeAjaxRequest()

        controller.searchAJAX()

        assert '[]' == response.text
    }

    void testFindTagsAjax() {
        request.method = "POST"
        request.makeAjaxRequest()

        controller.findTagsAjax()

        assert '{"tags":[]}' == response.text
        assert [] == response.json.tags
    }

    void testIndex() {
        controller.index()
        assert "/tag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tagInstanceList.size() == 0
        assert model.tagInstanceTotal == 0
    }

    void testSave() {
        controller.save()

        assert model.tagInstance != null
        assert view == '/tag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tag/show/1'
        assert controller.flash.message != null
        assert Tag.count() == 1
    }
}