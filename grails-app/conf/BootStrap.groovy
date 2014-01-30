import isima.Role
import isima.User
import isima.UserRole
import isima.Badge

class BootStrap {

    def init = {

        // defining Badges
        // in one exists, we don't have to continue 
        if (Badge.count() == 0) {
            final String QUESTION = "Question"
            final String ANSWER = "Answer"
            final String PARTICIPATION = "Participation"
            final String TAG = "Tag"
            final String MODERATION = "Moderation"
            final String OTHERS = "Others"
            final String BRONZE = "Bronze"
            final String GOLD = "Gold"
            final String SILVER = "Silver"

            // Questions Badges
            new Badge(title:"Altruist",
                description:"First bounty you manually awarded on another person's question",
                category:QUESTION,
                rank:BRONZE
                ).save(failOnError: true)

            new Badge(title:"Benefactor",
                description:"First bounty you manually awarded on your own question",
                category:QUESTION,
                rank:BRONZE
                ).save(failOnError: true)

            new Badge(title:"Favorite Question",
                description:"Question favorited by 25 users",
                category:QUESTION,
                rank:SILVER
                ).save(failOnError: true)

            new Badge(title:"Stellar Question",
                description:"Question favorited by 100 users",
                category:QUESTION,
                rank:GOLD
                ).save(failOnError: true)

            // Answer Badges
            new Badge(title:"Teacher",
                description:"Answered first question with score of 1 or more",
                category:ANSWER,
                rank:BRONZE
                ).save(failOnError: true)
        }

        // defining Roles and admin User
        def adminRole = Role.findByAuthority('ROLE_ADMIN')?:new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = Role.findByAuthority('ROLE_USER')?:new Role(authority: 'ROLE_USER').save(flush: true)

        def adminUser = User.findByUsername('admin')?:new User(
                username: 'admin', enabled: true, password: 'admin',
                location:'',birthDate:new Date(),aboutMe:'',realName:'',profileImage:new byte[0]
            ).addToBadges(Badge.findByTitle("Teacher")).save(flush: true)

        if (!adminUser.authorities.contains(adminRole)) 
            UserRole.create adminUser, adminRole, true
        if (!adminUser.authorities.contains(userRole)) 
            UserRole.create adminUser, userRole, true
        
    }

    def destroy = {
    }
}
