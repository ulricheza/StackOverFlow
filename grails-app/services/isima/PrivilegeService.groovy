package isima

class PrivilegeService {

	private static final int VOTE_DOWN_REPUTATION = 15
	private static final int LEAVE_COMMENTS_REPUTATION = 50
	private static final int VOTE_UP_REPUTATION = 125
	
	def canVoteDown (User voter, Message msg) {
		
		if (voter == msg.author)
			[result:'false',errorMsg:'You cannot vote down your own message'];
		else 
			checkReputation(voter.reputation,VOTE_DOWN_REPUTATION)		
	}
	
	def canComment (User voter, Message msg) {
		
		if (voter == msg.author)
			[result:'true']
		else 
			checkReputation(voter.reputation,LEAVE_COMMENTS_REPUTATION)			
	}
	
	def canVoteUp (User voter, Message msg) {
		
		if (voter == msg.author)
			[result:'false',errorMsg:'You cannot vote up your own message']
		else
			checkReputation(voter.reputation,VOTE_UP_REPUTATION)	
	}

	def canEdit (User user, Message msg) {
		
		if (msg.author == user)
			[result:'true']
		else
			[result:'false',errorMsg:'You are not allowed to edit this message']
	}

	def canDelete (User user, Message msg) {
		
		if (msg.author == user)
			[result:'true']
		else
			[result:'false',errorMsg:'You are not allowed to delete this message']
	}
	
	private def checkReputation (int voterReputation, int requiredReputation) {
		if (voterReputation >= requiredReputation)
			[result:'true']
		else
			[result:'false',errorMsg:'You must have at least '+requiredReputation+' reputation']	
	}
}