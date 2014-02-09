package isima

import org.junit.*
import grails.test.mixin.*

@TestFor(BadgeController)
class BadgeControllerTests {

    void testIndex() {
        controller.index()
        assert "/badge/list" == response.redirectedUrl
    }
}