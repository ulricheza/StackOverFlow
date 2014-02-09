package isima

class ReputationService {

	static final int INITIAL_REPUTATION = 49
	static final int MIN_REPUTATION = 1

	def voteDownQuestion(User questionAuthor) {

		questionAuthor.reputation -= 2
		if (questionAuthor.reputation < MIN_REPUTATION) questionAuthor.reputation = MIN_REPUTATION    
    }

    def voteDownAnswer(User voter, User answerAuthor) {

		voter.reputation -= 1
		answerAuthor.reputation -= 2
		
		if (voter.reputation < MIN_REPUTATION) voter.reputation = MIN_REPUTATION
		if (answerAuthor.reputation < MIN_REPUTATION) answerAuthor.reputation = MIN_REPUTATION    
    }

    def voteUpQuestion(User questionAuthor) {
		questionAuthor.reputation += 5 
    }

    def voteUpAnswer(answerAuthor) {
		answerAuthor.reputation += 10
	}

	def acceptAnswer(User acceptor, Message prevAnswer, Message newAnswer) {

		User prevAnswerAuthor = prevAnswer?.author
		User newAnswerAuthor = newAnswer.author

		if (newAnswerAuthor == acceptor) return

		if (prevAnswerAuthor){
			prevAnswerAuthor.reputation -= 15
			acceptor.reputation -= 2

			if (prevAnswerAuthor.reputation < MIN_REPUTATION) prevAnswerAuthor.reputation = MIN_REPUTATION
			if (acceptor.reputation < MIN_REPUTATION) acceptor.reputation = MIN_REPUTATION   
		}

		if (newAnswer.accepted) {
			newAnswerAuthor.reputation += 15
			acceptor.reputation += 2
		}


		/*if (!prevAnswerAuthor) {
			acceptor.reputation += 2
			newAnswerAuthor.reputation += 15
		}
		else {
			if (prevAnswerAuthor != newAnswerAuthor) {
				prevAnswerAuthor -= 15
				newAnswerAuthor.reputation += 15
			}
			else {

			}			
		}*/
	}
}