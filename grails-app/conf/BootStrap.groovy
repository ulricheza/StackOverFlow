class BootStrap {

    def badgeService

    def init = {
        // defining Badges
        badgeService.createBadges()
    }

    def destroy = {
    }
}