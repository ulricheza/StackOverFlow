
<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-topic" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topic">
			
				<g:if test="${topicInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="topic.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="user" action="show" id="${topicInstance?.author?.id}">${topicInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="topic.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate type="date" date="${topicInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.resolved}">
				<li class="fieldcontain">
					<span id="resolved-label" class="property-label"><g:message code="topic.resolved.label" default="Resolved" /></span>
					
						<span class="property-value" aria-labelledby="resolved-label"><g:formatBoolean boolean="${topicInstance?.resolved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="topic.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${topicInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.topicMessages}">
				<li class="fieldcontain">
					<span id="topicMessages-label" class="property-label"><g:message code="topic.topicMessages.label" default="Topic Messages" /></span>
					
						<g:each in="${topicInstance.topicMessages}" var="t">
						<span class="property-value" aria-labelledby="topicMessages-label"><g:link controller="message" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${topicInstance?.id}" />
					<g:link class="edit" action="edit" id="${topicInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
