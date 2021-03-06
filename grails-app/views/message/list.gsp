
<%@ page import="isima.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="isima.topic.unanswered.title" /></title>
	</head>
	<body>
		<a href="#list-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-message" class="content scaffold-list" role="main">
			<div class="page-title"><h1><g:message code="isima.topic.unanswered.title" /></h1></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="message.author.label" default="Author" /></th>
					
						<g:sortableColumn property="content" title="${message(code: 'message.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="replyDate" title="${message(code: 'message.replyDate.label', default: 'Reply Date')}" />
					
						<th><g:message code="message.topic.label" default="Topic" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${messageInstanceList}" status="i" var="messageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "author")}</g:link></td>
					
						<td><g:message code="${messageInstance.content}" /></td>
					
						<td><g:formatDate type="date" date="${messageInstance.replyDate}" /></td>
					
						<td>${fieldValue(bean: messageInstance, field: "topic")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${messageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
