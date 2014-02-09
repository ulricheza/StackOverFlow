package isima

import org.springframework.dao.DataIntegrityViolationException

class BadgeController {

    def afterInterceptor = { model ->
        model.selectedTab = 'badges'
    }

    def badgeService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        badgeService.findBadgesByFilter(params.filter)
    }
}