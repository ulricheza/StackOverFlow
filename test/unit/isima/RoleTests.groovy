package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Role)
class RoleTests {

    void testConstraints() {

    	def existingRole = new Role(authority:"Sample")

    	mockForConstraintsTests(Role, [existingRole])

    	// validation should fail if properties are null 
    	def role = new Role()
    	assert !role.validate() 
    	assert role.errors.errorCount == 1
    	assert "nullable" == role.errors["authority"]
   
    	// validation should fail : unique constraint
    	role = new Role(authority:"Sample")
    	assert !role.validate() 
    	assert role.errors.errorCount == 1
    	assert "unique" == role.errors["authority"]

    	// Validation should pass!
        assert existingRole.validate() 
    	role = new Role(authority:"Another Sample")
        assert role.validate() 
    }
}