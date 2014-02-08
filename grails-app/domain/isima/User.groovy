package isima

class User {

	String 	username  // not userName because of spring security
    String  email
	String 	location 
	Date	birthDate
	String  aboutMe 
	String 	realName
	byte[]	profileImage 
    int     reputation
   	
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
        username(blank:false, unique:true, maxSize:15)
        password(blank:false, minSize:5)
        birthDate nullable:true, validator: {val, obj ->
            return val <= new Date()
        }
        email(blank:false, unique:true,email:true)
        profileImage(maxSize:100*1024, nullable:true)
        aboutMe(nullable:true, maxSize:600)
        location(nullable:true, maxSize:30)
        realName(nullable:true, maxSize:30)
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

    int getNbBronzeBadges() {
        badges.count { it.level == BadgeService.BRONZE }
    }

    int getNbSilverBadges() {
        badges.count { it.level == BadgeService.SILVER }
    }

    int getNbGoldBadges() {
        badges.count { it.level == BadgeService.GOLD }
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