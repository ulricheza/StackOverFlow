package isima

class Badge {

	String title
	String description
	String category
	String level
	
	static constraints = {
    	title unique: true
    }

    int getCount() {
    	UserBadge.countByBadge(this)
    }
}