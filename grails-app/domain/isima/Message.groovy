package isima

class Message {

	String 	content;
	Date	replyDate;

	static constraints = {
		content blank: false//, minSize:30
	}

    static mapping = {
    	replyDate type:'date'
    }

    static belongsTo = [author:User, topic:Topic]
}