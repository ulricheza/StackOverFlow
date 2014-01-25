import isima.Role
import isima.User
import isima.UserRole

class BootStrap {

    def init = {

        //defining Roles and admin User
        def adminRole = Role.findByAuthority('ROLE_ADMIN')?:new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = Role.findByAuthority('ROLE_USER')?:new Role(authority: 'ROLE_USER').save(flush: true)

        def adminUser = User.findByUsername('admin')?:new User(
                username: 'admin', enabled: true, password: 'admin',
                location:'',birthDate:new Date(),aboutMe:'',realName:'',profileImage:new byte[0]
            ).save(flush: true)

        if (!adminUser.authorities.contains(adminRole)) 
            UserRole.create adminUser, adminRole, true
        if (!adminUser.authorities.contains(userRole)) 
            UserRole.create adminUser, userRole, true
    }

    def destroy = {
    }
}
