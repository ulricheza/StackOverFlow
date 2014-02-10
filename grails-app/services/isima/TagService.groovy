package isima

class TagService {

    // The names are separated by ", "
    def findOrCreateTags(String tagNames) {

        def uniqueTags = [] as Set
    	def result = [] as Set

    	// Get Unique names
    	tagNames = tagNames.trim()
    	tagNames.split(',').each {
    		it = it.trim()
    		if(it != '') uniqueTags.add(it)
    	}    	

    	// Find or Create the tags
    	uniqueTags.each{
    		def tag = Tag.findByTagName(it)?:new Tag(tagName:it,tagCount:0)  
	    	tag.tagCount += 1		
	    	result.add(tag)
    	}

    	return result
    }
}