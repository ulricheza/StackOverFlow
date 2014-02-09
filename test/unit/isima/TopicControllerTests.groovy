package isima

import org.junit.*
import grails.test.mixin.*

@TestFor(TopicController)
@Mock(Topic)
class TopicControllerTests {

    void testIndex() {
        controller.index()
        assert "/topic/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.topicInstanceList.size() == 0
        assert model.topicInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.topicInstance != null
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/topic/list'
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/topic/list'
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/topic/list'
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/topic/list'
    }
}