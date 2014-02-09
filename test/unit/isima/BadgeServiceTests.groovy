package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(BadgeService)
@Mock(Badge)
class BadgeServiceTests {

    void testCreateBadges() {

    	service.createBadges()

    	assert Badge.count() == 9

    	assert Badge.countByLevel(BadgeService.BRONZE) == 5
    	assert Badge.countByLevel(BadgeService.SILVER) == 2
    	assert Badge.countByLevel(BadgeService.GOLD) == 2

    	assert Badge.countByCategory(BadgeService.QUESTION) == 3
    	assert Badge.countByCategory(BadgeService.ANSWER) == 3
    	assert Badge.countByCategory(BadgeService.MODERATION) == 3
    }

    void testfindBadgesByFilter() { 

        service.createBadges()

        def model = service.findBadgesByFilter('all')
        assert(model.questionBadges.size() == 3)
        assert(model.answerBadges.size() == 3)
        assert(model.moderationBadges.size() == 3)

        model = service.findBadgesByFilter('gold')
        assert(model.questionBadges.size() == 1)
        assert(model.answerBadges.size() == 1)
        assert(model.moderationBadges.size() == 0)

        model = service.findBadgesByFilter('silver')
        assert(model.questionBadges.size() == 1)
        assert(model.answerBadges.size() == 1)
        assert(model.moderationBadges.size() == 0)

        model = service.findBadgesByFilter('bronze')
        assert(model.questionBadges.size() == 1)
        assert(model.answerBadges.size() == 1)
        assert(model.moderationBadges.size() == 3)
    }
}