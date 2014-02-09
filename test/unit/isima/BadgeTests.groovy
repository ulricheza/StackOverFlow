package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Badge)
class BadgeTests {

    void testConstraints() {

    	def existingBadge = new Badge(
    		title:"Sample",
    		description:"",
    		category:"",
    		level:"")

    	mockForConstraintsTests(Badge, [existingBadge])

    	// validation should fail if properties are null 
    	def badge = new Badge()
    	assert !badge.validate() 
    	assert badge.errors.errorCount == 4
    	assert "nullable" == badge.errors["title"]
    	assert "nullable" == badge.errors["description"]
    	assert "nullable" == badge.errors["category"]
    	assert "nullable" == badge.errors["level"]

    	// validation should fail : unique constraint
    	badge = new Badge(
    		title:"Sample",
    		description:"",
    		category:"",
    		level:"") 	
    	assert !badge.validate() 
    	assert badge.errors.errorCount == 1
    	assert "unique" == badge.errors["title"]

    	// Validation should pass!
        badge = new Badge(
        	title:"Another Sample",
        	description:"",
    		category:"",
    		level:"")
        assert badge.validate() 
    }
}