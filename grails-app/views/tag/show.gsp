
<%@ page import="isima.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tag">
			
				<g:if test="${tagInstance?.tagName}">
				<li class="fieldcontain">
					<span id="tagName-label" class="property-label"><g:message code="tag.tagName.label" default="Tag Name" /></span>
					
						<span class="property-value" aria-labelledby="tagName-label"><g:fieldValue bean="${tagInstance}" field="tagName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tagInstance?.tagCount}">
				<li class="fieldcontain">
					<span id="tagCount-label" class="property-label"><g:message code="tag.tagCount.label" default="Tag Count" /></span>
					
						<span class="property-value" aria-labelledby="tagCount-label"><g:fieldValue bean="${tagInstance}" field="tagCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tagInstance?.taggedTopics}">
				<li class="fieldcontain">
					<span id="taggedTopics-label" class="property-label"><g:message code="tag.taggedTopics.label" default="Tagged Topics" /></span>
					
						<g:each in="${tagInstance.taggedTopics}" var="t">
						<span class="property-value" aria-labelledby="taggedTopics-label"><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tagInstance?.id}" />
					<g:link class="edit" action="edit" id="${tagInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
