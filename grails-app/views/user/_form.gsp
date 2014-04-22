<%@ page import="isima.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>		
	</label>
	<g:field type="email" name="email" required="" value="${userInstance.email}"/>
</div>

<g:if test="${displayPasswordField}">
	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
		<label for="password">
			<g:message code="user.password.label" default="Password" />
			<span class="required-indicator">*</span>
		</label>
		<g:passwordField required="" name="password" value="${userInstance.password}" />
	</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profileImage', 'error')} ">
	<label for="profileImage">
		<g:message code="user.profileImage.label" default="Profile Image" />		
	</label>
	<input type="file" id="profileImage" name="profileImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="user.location.label" default="Location" />		
	</label>
	<g:textField name="location" value="${userInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'realName', 'error')} ">
	<label for="realName">
		<g:message code="user.realName.label" default="Real Name" />		
	</label>
	<g:textField name="realName" value="${userInstance?.realName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="user.birthDate.label" default="Birth Date" />		
	</label>
	<g:datePicker name="birthDate" precision="day" value="${userInstance?.birthDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'aboutMe', 'error')} ">
	<label for="aboutMe">
		<g:message code="user.aboutMe.label" default="About Me" />		
	</label>	
	<g:textArea style="resize:none" name="aboutMe" value="${userInstance?.aboutMe}" />
</div>