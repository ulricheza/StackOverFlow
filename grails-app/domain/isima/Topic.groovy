package isima

class Topic {
    
	String 	title
	User 	author
	Date	creationDate
	boolean resolved 
	List    replies
    Set     tags

    static constraints = {
        title blank: false
        tags nullable: false, size: 1..5
    }

    static belongsTo = [ author : User ]
    static hasMany = [
        replies : Message,
        tags : Tag
    ]

    def String toString(){
    	title
    }

    def revokeAnswersExcept(Message answer) {
        def prevAnswer = null

        (replies-answer).each {
            if (it.accepted) prevAnswer = it
            it.accepted = false
        }
        if (!prevAnswer && answer.accepted) prevAnswer = answer

        return prevAnswer
    }
}