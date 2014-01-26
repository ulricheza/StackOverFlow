package isima

class TagService {

    // The names are separated by ", "
    def findOrCreateTags(String tagNames) {
    	def tags = []

    	if (!tagNames.isEmpty()){
	    	tagNames.split(',').each{  
	    		it = it.trim()
	    		def tag = Tag.findByTagName(it)?:new Tag(tagName:it,tagCount:0)  
	    		tag.tagCount += 1		
	    		tags.add(tag)
	    	}
	    }

    	tags as Set
    }
}
