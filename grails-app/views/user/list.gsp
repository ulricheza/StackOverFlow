
<%@ page import="isima.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-user" class="content scaffold-list" role="main">
			<div id="title"><h1><g:message code="isima.user.list.title" /></h1></div><br/><br/>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="shortdescription">
				<label for="tagName"><g:message code="isima.user.list.search.label" default="Tag Name" /></label>
				<g:textField name="tagName" value=" to do " />
				<br/><br/>
			</div>


			<table>
				<g:each in="${userInstanceList}" status="userInstanceId" var="userInstance">

					<g:if test="${userInstanceId%4==0}">
					<tr>
					</g:if>
						<td class="tag-cell">
							<img style="float:left" width="32" height="32" src="data:image/png;base64,${userInstance.profileImage.encodeBase64().toString()}" />
							<div class="user-description-container">
								<a class="username-link" href="${createLink(uri: '/user/show/')}${userInstance.id}">${userInstance.username}</a><br/>
								<div class="tag-short-description">${userInstance.location}</div>
							</div>
						</td>
					<g:if test="${(userInstanceId+1)%4==0}">
					</tr>
					</g:if>
				</g:each>
			</table>




			<g:if test="${userInstanceTotal>params.max}">
				<div class="pagination">
					<g:paginate total="${userInstanceTotal}" />
				</div>
			</g:if>
		</div>

	</body>
</html>
