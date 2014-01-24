package isima

class User {

	String 	name;
	String 	location;  // Country
	Date	birthDate;
	String  aboutMe; // User's description of himself
	String 	realName;
	byte[]	profileImage; // user's profile picture
	List    userQuestions
	List    userMessages

	static constraints = {
    	profileImage maxSize:16*1024
    	birthDate max: new Date()    	
    } 

    static mapping = {
    	birthDate type:'date'
    }

    static hasMany = [userQuestions:Topic, userMessages:Message]

    def String toString(){
    	name
    }
}