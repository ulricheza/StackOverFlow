package isima

class User {

	String 	username; // not userName because of spring security
	String 	location;  // Country
	Date	birthDate;
	String  aboutMe; // User's description of himself
	String 	realName;
	byte[]	profileImage; // user's profile picture
	List    userQuestions
	List    userMessages

    // Security fields
    transient springSecurityService

    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    // end

	static constraints = {
        username(blank:false, unique:true, maxSize:30)
        birthDate validator: {val, obj ->
            return val <= new Date()
        }
       	profileImage maxSize:16*1024
        password blank: false
    } 

    static mapping = {
    	birthDate type:'date'
    }

    static hasMany = [userQuestions:Topic, userMessages:Message]

    def String toString(){
    	username
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