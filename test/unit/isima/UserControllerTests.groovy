package isima

import org.junit.*
import grails.test.mixin.*

@TestFor(UserController)
@Mock(User)
class UserControllerTests {

    void testIndex() {
        controller.index()
        assert "/user/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userInstanceList.size() == 0
        assert model.userInstanceTotal == 0
    }

    void testSave() {
        controller.save()

        assert model.userInstance != null
        assert view == '/user/create'
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/user/list'
    }
}