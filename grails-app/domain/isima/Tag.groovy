package isima

class Tag {

	String tagName
	int    tagCount

    static constraints = {
    	tagName unique:true
    }

    static hasMany = [taggedTopics:Topic]
    static belongsTo = Topic

    def String toString() {
    	tagName
    }
}