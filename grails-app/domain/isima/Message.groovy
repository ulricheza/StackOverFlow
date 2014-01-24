package isima

class Message {

	User	author;	
	Topic	topic;
	String 	content;
	Date	replyDate;

    static mapping = {
    	replyDate type:'date'
    }

    static belongsTo = [author:User, topic:Topic]
}