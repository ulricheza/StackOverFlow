package isima

class User {

	String 	username  // not userName because of spring security
    String  email
	String 	location  // Country
	Date	birthDate
	String  aboutMe // User's description of himself
	String 	realName
	byte[]	profileImage // user's profile picture
    int     reputation
    /*List    questions
    List    answers*/
	
    // Security fields
    transient springSecurityService

    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    // end

    static hasMany = [
        questions : Topic, 
        answers : Message,
    ]

	static constraints = {
        username(blank:false, unique:true, maxSize:30)
        password(blank:false)
        birthDate validator: {val, obj ->
            return val <= new Date()
        }
        email(email:true, unique:true, blank:false)
        profileImage(maxSize:16*1024, nullable:true)
        aboutMe(nullable:true)
        location(nullable:true)
        realName(nullable:true)
    } 

    static mapping = {
    	birthDate type:'date'
    }

    def String toString(){
    	username
    }

    Set<Badge> getBadges() {
        UserBadge.findAllByUser(this).collect { it.badge } as Set
    }

    // Security methods
    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    // end
}