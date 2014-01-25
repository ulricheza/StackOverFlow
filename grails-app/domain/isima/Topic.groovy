package isima

class Topic {

	String 	title;
	User 	author;
	Date	creationDate;
	Boolean resolved; // If the author has accepted an answer.
	List    topicMessages;
    
    static constraints = {
        title(blank:false)
    }

    static mapping = {
    	creationDate type:'date'
    }

    static belongsTo = [author:User]
    static hasMany = [topicMessages:Message]

    def String toString(){
    	title
    }
}