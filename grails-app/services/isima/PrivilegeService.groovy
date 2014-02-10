package isima

class PrivilegeService {

	private static final int VOTE_DOWN_REPUTATION = 25
	private static final int LEAVE_COMMENTS_REPUTATION = 50
	private static final int VOTE_UP_REPUTATION = 75
	
	def canVoteDown (User voter, Message msg) {
		
		if (voter == msg.author)
			[result:'false',errorMsg:'You cannot vote down your own message',code:'default.cannotSelfVoteDown.message'];
		else 
			checkReputation(voter.reputation,VOTE_DOWN_REPUTATION)		
	}
	
	def canComment (User commenter, Message msg) {
		
		if (commenter == msg.topic.author)
			[result:'true']
		else 
			checkReputation(commenter.reputation,LEAVE_COMMENTS_REPUTATION)			
	}
	
	def canVoteUp (User voter, Message msg) {
		
		if (voter == msg.author)
			[result:'false',errorMsg:'You cannot vote up your own message',code:'default.cannotSelfVoteUp.message']
		else
			checkReputation(voter.reputation,VOTE_UP_REPUTATION)	
	}

	def canEdit (User user, Message msg) {
		
		if (msg.author == user)
			[result:'true']
		else
			[result:'false',errorMsg:'You are not allowed to edit this message',code:'default.cannotEdit.message']
	}

	def canDelete (User deleter, Message msg) {
		
		if (msg.author == deleter || msg.topic.author == deleter)
			[result:'true']
		else
			[result:'false',errorMsg:'You are not allowed to delete this message',code:'default.cannotDelete.message']
	}

	def canToggleAnswerStatus(User user,Topic topic,Message msg) {
		if (topic.author == user){
			if (msg.isQuestion())
				[result:'false',errorMsg:"This message is not an answer",code:'default.notAnAnswer.message']
			else
				[result:'true']			
		}			
		else 
			[result:'false',errorMsg:'You are not allowed to accept an answer of this topic',code:'default.cannotAcceptAnswer.message']
	}
	
	private def checkReputation (int voterReputation, int requiredReputation) {
		if (voterReputation >= requiredReputation)
			[result:'true']
		else
			[result:'false',errorMsg:'You must have at least '+requiredReputation+' reputation',code:'default.lackReputation.message',args:requiredReputation]	
	}
}