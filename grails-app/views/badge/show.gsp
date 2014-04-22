
<%@ page import="isima.Badge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'badge.label', default: 'Badge')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-badge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-badge" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list badge">
			
				<g:if test="${badgeInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="badge.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${badgeInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${badgeInstance?.awarded}">
				<li class="fieldcontain">
					<span id="awarded-label" class="property-label"><g:message code="badge.awarded.label" default="Awarded" /></span>
					
						<g:each in="${badgeInstance.awarded}" var="a">
						<span class="property-value" aria-labelledby="awarded-label"><g:link controller="user" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${badgeInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="badge.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${badgeInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${badgeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="badge.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${badgeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${badgeInstance?.rank}">
				<li class="fieldcontain">
					<span id="rank-label" class="property-label"><g:message code="badge.rank.label" default="Rank" /></span>
					
						<span class="property-value" aria-labelledby="rank-label"><g:fieldValue bean="${badgeInstance}" field="rank"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${badgeInstance?.id}" />
					<g:link class="edit" action="edit" id="${badgeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
