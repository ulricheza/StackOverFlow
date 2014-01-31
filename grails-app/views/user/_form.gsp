<%@ page import="isima.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">	
	<input type="text" id="email" name="email" placeholder="name@example.com" value="test@test.com" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">	
	<input type="text" id="username" name="username" placeholder="John Smith" value="test"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<input type="text" id="password" name="password" placeholder="Password" value="testtest"  />
</div>