package isima

class Tag {

	String tagName
	int    tagCount
    String description

    static constraints = {
    	tagName unique:true
        description nullable:true
    }

    static hasMany = [taggedTopics:Topic]
    static belongsTo = Topic

    def String toString() {
    	tagName
    }
}