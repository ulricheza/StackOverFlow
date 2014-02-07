package isima

class Topic {
    
	String 	title
	User 	author
	Date	creationDate
	boolean resolved // If the author has accepted an answer.
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
        (replies-answer).each {
            it.accepted = false
        }
    }
}