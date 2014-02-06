import isima.*

class BootStrap {

    def init = {

        // defining Badges
        BadgeService.createBadges()

        // defining Roles and admin User
        def adminRole = Role.findByAuthority('ROLE_ADMIN')?:new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = Role.findByAuthority('ROLE_USER')?:new Role(authority: 'ROLE_USER').save(flush: true)
        def adminUser = User.findByUsername('admin')?:new User(
            username: 'admin', enabled: true, password: 'admin', email:'admin@gmail.com',
            location:'I live in Clermont-Ferrand, France',birthDate:new Date(),aboutMe:'This is me, this is my life.',realName:'Administrator',profileImage:new byte[0]
        ).save(flush: true)

        if (!adminUser.authorities.contains(adminRole)) 
            UserRole.create adminUser, adminRole, true
        if (!adminUser.authorities.contains(userRole)) 
            UserRole.create adminUser, userRole, true

        def javaTag = Tag.findByTagName('Java')?:new Tag(tagName:'Java', tagCount:0, description:'this is the tag for the c++ gurus').save(flush: true)
        def messageExampleTopic = new Message(content:'This is the message of the example topic. It has to be at least 30 caracters long.', replyDate:new Date())
        def exampleTopic = new Topic(title:'Example topic', author:adminUser, creationDate:new Date(), resolved:false)
        exampleTopic.addToReplies(messageExampleTopic)
        exampleTopic.addToTags(javaTag)
        adminUser.addToAnswers(messageExampleTopic)
        adminUser.addToQuestions(exampleTopic)
        exampleTopic.save()

        def messageExampleTopic2 = new Message(content:'This is the message of the example topic 2. It has to be at least 30 caracters long.', replyDate:new Date())
        def exampleTopic2 = new Topic(title:'Example topic 2', author:adminUser, creationDate:new Date(), resolved:false)
        exampleTopic2.addToReplies(messageExampleTopic2)
        exampleTopic2.addToTags(javaTag)
        adminUser.addToAnswers(messageExampleTopic2)
        adminUser.addToQuestions(exampleTopic2)
        exampleTopic2.save()
    }

    def destroy = {
    }
}