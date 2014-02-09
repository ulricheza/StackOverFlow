package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserTests {

    void testConstraints() {

    	def existingUser = new User(
    		username:"User1",
    		password:"password",
    		email:"test@gmail.com")

    	mockForConstraintsTests(User, [existingUser])

    	// validation should fail if properties are null 
    	def user = new User()
    	assert !user.validate()
    	assert user.errors.errorCount == 3
    	assert "nullable" == user.errors["username"]
    	assert "nullable" == user.errors["password"]
    	assert "nullable" == user.errors["email"]

    	// validation should fail : unique constraint
    	user = new User(username:"User1",password:"password",email:"test@gmail.com")
    	assert !user.validate()
    	assert user.errors.errorCount == 2
    	assert "unique" == user.errors["username"]
    	assert "unique" == user.errors["email"]

    	// invalid birthdate, password size and email
    	user = new User(username:"User2",password:"pwd",email:"com",birthDate:new Date() + 2)
    	assert !user.validate()
    	assert user.errors.errorCount == 3
    	assert "minSize" == user.errors["password"]
    	assert "email" == user.errors["email"]
    	assert "validator" == user.errors["birthDate"]

    	// validation should work
    	assert existingUser.validate()    	
    }
}