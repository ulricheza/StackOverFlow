package isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(TagService)
@Mock(Tag)
class TagServiceTests {

    void testFindOrCreateTags() {

    	def values = service.findOrCreateTags('')
    	assert values.size() == 0

    	values = service.findOrCreateTags(',')
    	assert values.size() == 0

    	values = service.findOrCreateTags('C  ,      ')
    	assert values.size() == 1
    	assert values.iterator().next().tagName == 'C'

    	values = service.findOrCreateTags('C,Java')
    	assert values.size() == 2
    	def iterator = values.iterator()
    	assert iterator.next().tagName == 'C'
    	assert iterator.next().tagName == 'Java'

    	values = service.findOrCreateTags('C, Java, C,,  ')
    	assert values.size() == 2
    	iterator = values.iterator()
    	assert iterator.next().tagName == 'C'
    	assert iterator.next().tagName == 'Java'
    } 
}
