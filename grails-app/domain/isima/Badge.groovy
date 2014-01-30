package isima

class Badge {

	String title
	String description
	String category
	String rank
	
	static hasMany = [awarded:User]
	static belongsTo = User

    static constraints = {
    	title unique: true
    }
}