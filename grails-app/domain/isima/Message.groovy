package isima

class Message {

	String 	content
	Date	replyDate
	int 	score
	List    comments
	boolean accepted = false

	boolean isQuestion() {
    	return (this == topic.replies[0])
    }

	static constraints = {
		content blank: false, validator: { 
			// delete all html tags
			it = it.replaceAll('<[^>]*>','')

			// delete spaces
			it = it.replaceAll('&nbsp;','').replaceAll('\\s*','')

			// replace other specials html commands with a single character
			// only the count matters here
			it = it.replaceAll('&\\p{Alnum}+;','c')

			// check that the size of the content is at least 30
			int size = it.size()
    		if (size < 30) return ['minSize.notmet',30,size]
    	}
    }

    static mapping = {
    	content type:'materialized_clob'
    }

    static hasMany = [comments:Comment]
    static belongsTo = [
    	author : User, 
    	topic : Topic
    ]
}