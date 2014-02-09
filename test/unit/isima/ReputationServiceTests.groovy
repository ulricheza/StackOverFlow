package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(ReputationService)
@Mock([User,Message])
class ReputationServiceTests {

	def topicAuthor
	def commenter1
	def commenter2
	def msg1
	def msg2

	@Before
	void startup() {
		topicAuthor = new User(reputation:50)
		        
        commenter1 = new User(reputation:50)
        commenter2 = new User(reputation:50)

        msg1 = new Message(author:commenter1) 
        msg2 = new Message(author:commenter2)                 
	}

	void testVoteDownQuestion() {
		// voteDown = -2
		service.voteDownQuestion(topicAuthor)
		assert topicAuthor.reputation == 48
	}

	void testVoteDownAnswer() {
		// the critic should lose 1 rep,
		// and the answer author -1
		service.voteDownAnswer(topicAuthor, commenter1)
		assert topicAuthor.reputation == 49
		assert commenter1.reputation == 48
	}

	void testMinReputation() {
		// reputation never goes beyond 1
		topicAuthor.reputation = 1
		service.voteDownQuestion(topicAuthor)
		assert topicAuthor.reputation == 1
	}

	void testVoteUpQuestion() {
		// voteUp = +5
		service.voteUpQuestion(topicAuthor)
		assert topicAuthor.reputation == 55
	}

	void testVoteUpAnswer() {
		// voteUp = +10
		service.voteUpAnswer(topicAuthor)
		assert topicAuthor.reputation == 60
	}

	void testAcceptAnswer () {

		// new answer : the topic author earn two
		// reputation and the commenter 15
		msg1.accepted = true
		service.acceptAnswer(topicAuthor,null,msg1)
		assert topicAuthor.reputation == 52
		assert commenter1.reputation == 65

		// new answer. We have to revoke the previous
		// reputation earned of commenter1
		msg1.accepted = false
		msg2.accepted = true
		service.acceptAnswer(topicAuthor,msg1,msg2)
		assert topicAuthor.reputation == 52
		assert commenter1.reputation == 50
		assert commenter2.reputation == 65

		// now the topic has no answers so everyone
		// should have the original reputation
		msg2.accepted = false
		service.acceptAnswer(topicAuthor,msg2,msg2)
		assert topicAuthor.reputation == 50
		assert commenter1.reputation == 50
		assert commenter2.reputation == 50

		// the topic author should not earn reputation on his own answer
		service.acceptAnswer(topicAuthor,null,msg1)
		assert topicAuthor.reputation == 50
		assert commenter1.reputation == 50
		assert commenter2.reputation == 50
	}
}