package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Tag)
class TagTests {

    void testConstraints() {

    	def existingTag = new Tag(tagName:"Sample")

    	mockForConstraintsTests(Tag, [existingTag])

    	// validation should fail if properties are null 
    	def tag = new Tag()
    	assert !tag.validate() 
    	assert tag.errors.errorCount == 1
    	assert "nullable" == tag.errors["tagName"]
   
    	// validation should fail : unique constraint
    	tag = new Tag(tagName:"Sample")
    	assert !tag.validate() 
    	assert tag.errors.errorCount == 1
    	assert "unique" == tag.errors["tagName"]

    	// Validation should pass!
    	assert existingTag.validate() 
    	tag = new Tag(tagName:"Another Sample")
        assert tag.validate() 
    }
}