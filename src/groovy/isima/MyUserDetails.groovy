package isima

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.userdetails.User

class MyUserDetails extends GrailsUser {

	String profileImage

	public MyUserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
	 	boolean credentialsNonExpired, boolean accountNonLocked, Collection<GrantedAuthority> authorities, 
	 	long id, String profileImage) {

		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities, id)
		
		this.profileImage = profileImage
	}
} 