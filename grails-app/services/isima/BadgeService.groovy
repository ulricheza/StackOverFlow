package isima

class BadgeService {

	final String QUESTION = "Question"
    final String ANSWER = "Answer"
    final String PARTICIPATION = "Participation"
    final String TAG = "Tag"
    final String MODERATION = "Moderation"
    final String OTHERS = "Others"
    final String BRONZE = "Bronze"
    final String GOLD = "Gold"
    final String SILVER = "Silver"

    def springSecurityService    

    def findBadgesByFilter(String filter) {

    	switch(filter) {
            case 'all':
            	return fillMaps(Badge.list())            	
            case 'earned':
            	def user = springSecurityService.currentUser
            	return fillMaps(user.badges)
            case 'unearned':
            	def badges = Badge.list()
            	def user = springSecurityService.currentUser
            	user.badges.each {
            		badges.remove(it)            		
            	}
            	return fillMaps(badges)
            case 'gold':
            	return fillMaps(Badge.findAllByRank(GOLD))
            case 'silver':
            	return fillMaps(Badge.findAllByRank(SILVER))
            case 'bronze':
            	return fillMaps(Badge.findAllByRank(BRONZE))
            default:
                return [:]       
        }        
    }

    def fillMaps (Collection badges){

    	def questionBadges = []
	    def answerBadges = []
	    def participationBadges = []
	    def tagBadges = []
	    def moderationBadges = []
	    def othersBadges = []

    	badges.each{
    		switch(it.category) {
            	case QUESTION:
            		questionBadges.add(it)
            		break       				
            	case ANSWER:
            		answerBadges.add(it)
            		break
            	case PARTICIPATION:
            		participationBadges.add(it)
            		break
            	case TAG:
            		tagBadges.add(it)
            		break
            	case MODERATION:
            		moderationBadges.add(it)
            		break
            	case OTHERS:
            		othersBadges.add(it)
            		break
            	default:
            		break
            }
        }

        [
        	questionBadges:questionBadges,answerBadges:answerBadges,participationBadges:participationBadges,
        	tagBadges:tagBadges,moderationBadges:moderationBadges,othersBadges:othersBadges
        ]
    }
}