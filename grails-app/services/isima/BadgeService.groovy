package isima

class BadgeService {

	static final String QUESTION = "Question"
    static final String ANSWER = "Answer"
    static final String MODERATION = "Moderation"

    static final String BRONZE = "Bronze"
    static final String GOLD   = "Gold"
    static final String SILVER = "Silver"

    static final String NICE_QUESTION = "Nice Question";
    static final String GOOD_QUESTION = "Good Question";
    static final String GREAT_QUESTION = "Great Question";

    static final String NICE_ANSWER = "Nice Answer";
    static final String GOOD_ANSWER = "Good Answer";
    static final String GREAT_ANSWER = "Great Answer";

    static final String CRITIC = "Critic";
    static final String EDITOR = "Editor";
    static final String SUPPORTER = "Supporter";

    static final int NICE_SCORE = 10
    static final int GOOD_SCORE = 25
    static final int GREAT_SCORE = 100

    def springSecurityService    

    static void createBadges () {

        // if one exists, we don't have to continue since one cannot be deleted by user
        if (Badge.count() == 0) {

            // Question badges
            new Badge(title:NICE_QUESTION,
                description:"Question score of "+NICE_SCORE+" or more",
                category:QUESTION,
                level:BRONZE
            ).save(failOnError: true)
       
             new Badge(title:GOOD_QUESTION,
                description:"Question score of "+GOOD_SCORE+" or more",
                category:QUESTION,
                level:SILVER
            ).save(failOnError: true)

            new Badge(title:GREAT_QUESTION,
                description:"Question score of "+GREAT_SCORE+" or more",
                category:QUESTION,
                level:GOLD
            ).save(failOnError: true)

            // Answer badges
            new Badge(title:NICE_ANSWER,
                description:"Answer score of "+NICE_SCORE+" or more",
                category:ANSWER,
                level:BRONZE
            ).save(failOnError: true)
       
             new Badge(title:GOOD_ANSWER,
                description:"Answer score of "+GOOD_SCORE+" or more",
                category:ANSWER,
                level:SILVER
            ).save(failOnError: true)

            new Badge(title:GREAT_ANSWER,
                description:"Answer score of "+GREAT_SCORE+" or more",
                category:ANSWER,
                level:GOLD
            ).save(failOnError: true)

            // Moderation badges
            new Badge(title:CRITIC,
                description:"First down vote",
                category:MODERATION,
                level:BRONZE
            ).save(failOnError: true)

            new Badge(title:EDITOR,
                description:"First edit",
                category:MODERATION,
                level:BRONZE
            ).save(failOnError: true)

            new Badge(title:SUPPORTER,
                description:"First up vote",
                category:MODERATION,
                level:BRONZE
            ).save(failOnError: true)
        }

    }

    def findBadgesByFilter(String filter) {

    	switch(filter) {
            case 'all':
            	return fillMaps(Badge.list())            	
            case 'earned':
                if (springSecurityService.isLoggedIn())
                    return fillMaps(springSecurityService.currentUser.badges)
                break;
            case 'unearned':
                if (springSecurityService.isLoggedIn()){
                    def badges = Badge.list()
                    def user = springSecurityService.currentUser
                    user.badges.each {
                        badges.remove(it)                   
                    }
                    return fillMaps(badges)
                }
                break;            	
            case 'gold':
            	return fillMaps(Badge.findAllByLevel(GOLD))
            case 'silver':
            	return fillMaps(Badge.findAllByLevel(SILVER))
            case 'bronze':
            	return fillMaps(Badge.findAllByLevel(BRONZE))    
        }

        [:]        
    }

    def updateQuestionBadges (Message question){

        if (question.score >= NICE_SCORE)  addBadge(question.author,Badge.findByTitle(NICE_QUESTION))
        if (question.score >= GOOD_SCORE)  addBadge(question.author,Badge.findByTitle(GOOD_QUESTION))
        if (question.score >= GREAT_SCORE) addBadge(question.author,Badge.findByTitle(GREAT_QUESTION))
    }

    def updateAnswerBadges (Message answer){

        if (answer.score >= NICE_SCORE)  addBadge(question.author,Badge.findByTitle(NICE_ANSWER))
        if (answer.score >= GOOD_SCORE)  addBadge(question.author,Badge.findByTitle(GOOD_ANSWER))
        if (answer.score >= GREAT_SCORE) addBadge(question.author,Badge.findByTitle(GREAT_ANSWER))
    }

    def addModerationBadge (User user, String badgeTitle){

        addBadge(user,Badge.findByTitle(badgeTitle))        
    }

    private def fillMaps (Collection badges){

    	def questionBadges = []
	    def answerBadges = []
	    def moderationBadges = []

    	badges.each{
    		switch(it.category) {
            	case QUESTION:
            		questionBadges.add(it)
            		break       				
            	case ANSWER:
            		answerBadges.add(it)
            		break
            	case MODERATION:
            		moderationBadges.add(it)
            		break
            	default:
            		break
            }
        }

        [questionBadges:questionBadges,answerBadges:answerBadges,moderationBadges:moderationBadges]
    }

    private def addBadge (User user, Badge badge){

        if (!user.badges.contains(badge)) UserBadge.create user, badge, true
    }
}