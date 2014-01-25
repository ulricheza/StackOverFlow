<%@ page import="isima.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profileImage', 'error')} required">
	<label for="profileImage">
		<g:message code="user.profileImage.label" default="Profile Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="profileImage" name="profileImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="user.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${userInstance?.birthDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'aboutMe', 'error')} ">
	<label for="aboutMe">
		<g:message code="user.aboutMe.label" default="About Me" />
		
	</label>
	<g:textField name="aboutMe" value="${userInstance?.aboutMe}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="user.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${userInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="User Name" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'realName', 'error')} ">
	<label for="realName">
		<g:message code="user.realName.label" default="Real Name" />
		
	</label>
	<g:textField name="realName" value="${userInstance?.realName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userMessages', 'error')} ">
	<label for="userMessages">
		<g:message code="user.userMessages.label" default="User Answers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.userMessages?}" var="u">
    <li><g:link controller="message" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="message" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'message.label', default: 'Message')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userQuestions', 'error')} ">
	<label for="userQuestions">
		<g:message code="user.userQuestions.label" default="User Questions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.userQuestions?}" var="u">
    <li><g:link controller="topic" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="topic" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'topic.label', default: 'Topic')])}</g:link>
</li>
</ul>

</div>

