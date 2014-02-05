package isima

class Comment {

	Message relatedMsg
	String 	content
	Date	replyDate

	static belongsTo = Message

    static constraints = {
    	content blank: false, validator: {
    		int minSize = 15
    		int maxSize = 600

    		int size = it.trim().replaceAll('\\s*','').size()

    		if (size < minSize) 
    			return ['minSize.notmet',minSize,size]
    		else if (size > maxSize )
    			return ['maxSize.exceeded',maxSize,size]
    	}
    }
}