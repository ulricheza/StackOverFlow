
<%@ page import="isima.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-tag" class="content scaffold-list" role="main">
			<div id="title"><h1><g:message code="isima.tags.list.title" /></h1></div><br/><br/>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tagName" title="${message(code: 'tag.tagName.label', default: 'Tag Name')}" />
					
						<g:sortableColumn property="tagCount" title="${message(code: 'tag.tagCount.label', default: 'Tag Count')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tagInstanceList}" status="i" var="tagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tagInstance.id}">${fieldValue(bean: tagInstance, field: "tagName")}</g:link></td>
					
						<td>${fieldValue(bean: tagInstance, field: "tagCount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tagInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
