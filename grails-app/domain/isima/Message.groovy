package isima

class Message {

	String 	content;
	Date	replyDate;

	static constraints = {
		content blank: false, minSize:30
	}

    static mapping = {
    	replyDate type:'date'
    	content type:'materialized_clob'
    }

    static belongsTo = [author:User, topic:Topic]
}