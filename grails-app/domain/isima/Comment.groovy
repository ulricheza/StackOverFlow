package isima

class Comment {

	Message relatedMsg
	String 	content

	static belongsTo = Message

    static constraints = {
    	content blank: false, validator: {

    		int size = it.trim().replaceAll('\\s*','').size()
    		if (size < 15) return ['minSize.notmet',size]
    	}
    }
}