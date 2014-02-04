
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
			<div class="page-title"><h1><g:message code="isima.tags.list.title" /></h1></div><br/><br/>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="shortdescription">
				<g:message code="isima.tags.list.paragraph" />
				<br/><br/>
				<label for="tagName"><g:message code="isima.tags.list.search.label" default="Tag Name" /></label>
				<g:textField name="tagName" value=" to do " />
				<br/><br/>
			</div>


			<table>
				<g:each in="${tagInstanceList}" status="tagInstanceId" var="tagInstance">

					<g:if test="${tagInstanceId%4==0}">
					<tr>
					</g:if>
						<td class="tag-cell">
							<a class="post-tag" href="${createLink(uri: '/tag/show/')}${tagInstance.id}">${tagInstance.tagName}</a><br/>
							<div class="tag-short-description">${tagInstance.description}</div>
						</td>
					<g:if test="${(tagInstanceId+1)%4==0}">
					</tr>
					</g:if>
				</g:each>
			</table>




			<g:if test="${tagInstanceTotal>params.max}">
				<div class="pagination">
					<g:paginate total="${tagInstanceTotal}" />
				</div>
			</g:if>
		</div>
	</body>
</html>
