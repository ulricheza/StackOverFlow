
<%@ page import="isima.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.profileImage}">
				<li class="fieldcontain">
					<span id="profileImage-label" class="property-label"><g:message code="user.profileImage.label" default="Profile Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="user.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate type="date" date="${userInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.aboutMe}">
				<li class="fieldcontain">
					<span id="aboutMe-label" class="property-label"><g:message code="user.aboutMe.label" default="About Me" /></span>
					
						<span class="property-value" aria-labelledby="aboutMe-label"><g:fieldValue bean="${userInstance}" field="aboutMe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="user.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${userInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.realName}">
				<li class="fieldcontain">
					<span id="realName-label" class="property-label"><g:message code="user.realName.label" default="Real Name" /></span>
					
						<span class="property-value" aria-labelledby="realName-label"><g:fieldValue bean="${userInstance}" field="realName"/></span>
					
				</li>
				</g:if>
				<%--
				<g:if test="${userInstance?.userMessages}">
				<li class="fieldcontain">
					<span id="userMessages-label" class="property-label"><g:message code="user.userMessages.label" default="User Answers" /></span>
					
						<g:each in="${userInstance.userMessages}" var="u">
						<span class="property-value" aria-labelledby="userMessages-label"><g:link controller="message" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.userQuestions}">
				<li class="fieldcontain">
					<span id="userQuestions-label" class="property-label"><g:message code="user.userQuestions.label" default="User Questions" /></span>
					
						<g:each in="${userInstance.userQuestions}" var="u">
						<span class="property-value" aria-labelledby="userQuestions-label"><g:link controller="topic" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if> --%>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
