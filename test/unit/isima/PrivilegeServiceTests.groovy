package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(PrivilegeService)
@Mock([User,Topic,Message])
class PrivilegeServiceTests {

    def user1
    def user2
    def topic
    def msg1
	def msg2	

	@Before
	void startup() {		        
        user1 = new User(reputation:1)
        user2 = new User(reputation:1)

        topic = new Topic(author:user2) 

        msg1 = new Message(author:user1,topic:topic) 
        msg2 = new Message(author:user2,topic:topic)

        topic.addToReplies(msg2)  // The question
        topic.addToReplies(msg1)  // An answer                      
	}

	void testCanVoteDown() {

		// one cannot voteDown his own answer
		def model = service.canVoteDown(user1,msg1)
		assert model.result == "false"
		assert model.errorMsg == "You cannot vote down your own message"

		// one cannot voteDown if not enough reputation (25)
		user1.reputation = 24
		model = service.canVoteDown(user1,msg2)
		assert model.result == "false"
		assert model.errorMsg == "You must have at least 25 reputation"

		// one can voteDown if not own answer and enough reputation (>= 25)
		user1.reputation = 25
		model = service.canVoteDown(user1,msg2)
		assert model.result == "true"
	}

	void testCanVoteUp() {

		// one cannot voteUp his own answer
		def model = service.canVoteUp(user1,msg1)
		assert model.result == "false"
		assert model.errorMsg == "You cannot vote up your own message"

		// one cannot voteUp if not enough reputation (75)
		user1.reputation = 74
		model = service.canVoteUp(user1,msg2)
		assert model.result == "false"
		assert model.errorMsg == "You must have at least 75 reputation"

		// one can voteUp if not own answer and enough reputation (>= 75)
		user1.reputation = 75
		model = service.canVoteUp(user1,msg2)
		assert model.result == "true"
	}

	void testCanComment() {

		// one cannot comment if not enough reputation (50)
		user1.reputation  = 49
		def model = service.canComment(user1,msg1)
		assert model.result == "false"
		assert model.errorMsg == "You must have at least 50 reputation"

		// one can comment if enough reputation
		user1.reputation  = 50
		model = service.canComment(user1,msg1)
		assert model.result == "true"

		// the author af a topic can comment all 
		// the messages of this one, even if not 
		// enough reputation
		user2.reputation = 1
		model = service.canComment(user2,msg1)
		assert model.result == "true"
	}

	void testCanEdit() {

		// only the author of a message can edit it
		def model = service.canEdit(user1,msg1)
		assert model.result == "true"

		// even the author of the topic cannot edit it
		model = service.canEdit(user2,msg1)
		assert model.result == "false"
		assert model.errorMsg == "You are not allowed to edit this message"
	}

	void testCanDelete() {

		// only the author of a message can delete it
		def model = service.canDelete(user1,msg1)
		assert model.result == "true"

		// but when it comes to deleting, the author 
		// of the topic cannot do it too
		model = service.canDelete(user2,msg1)
		assert model.result == "true"		
	}

	void testCanToggleAnswerStatus () {

		// only the author of the topic can mark
		// answers as accepted or not
		def model = service.canToggleAnswerStatus(user1,topic,msg1)
		assert model.result == "false"
		assert model.errorMsg == "You are not allowed to accept an answer of this topic"

		// it works when it's the author
		model = service.canToggleAnswerStatus(user2,topic,msg1)
		assert model.result == "true"
		
		// but still, the topic question cannot be marked as answer
		model = service.canToggleAnswerStatus(user2,topic,msg2)
		assert model.result == "false"
		assert model.errorMsg == "This message is not an answer"
	}
}