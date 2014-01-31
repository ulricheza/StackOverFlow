
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
			<div id="title"><h1><g:message code="default.list.label" args="[entityName]" /></h1></div><br/>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<table>
			<g:each var="currentUser" status="currentUserId" in="${userInstanceList}">
				<g:if test="${currentUserId%5==0}">
				<tr>
				</g:if>
					<td>
						<div style="width:150px; border:1px solid black">
							<div style="float:left"><img width="32" height="32" src="data:image/png;base64,${currentUser.profileImage}" /></div>
							<div style="float:right">					
								<g:link action="show" id="${currentUser.id}">${currentUser.username}</g:link><br/>
								${currentUser.location}
							</div>
						</div>
					</td>
				<g:if test="${currentUserId%5==0}">
				</tr>
				</g:if>
			</g:each>	
			</table>


					<br/><br/><br/><br/><br/><br/><br/><br/><br/>









			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="profileImage" title="${message(code: 'user.profileImage.label', default: 'Profile Image')}" />
					
						<g:sortableColumn property="birthDate" title="${message(code: 'user.birthDate.label', default: 'Birth Date')}" />
					
						<g:sortableColumn property="aboutMe" title="${message(code: 'user.aboutMe.label', default: 'About Me')}" />
					
						<g:sortableColumn property="location" title="${message(code: 'user.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'User Name')}" />
					
						<g:sortableColumn property="realName" title="${message(code: 'user.realName.label', default: 'Real Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}"><img width="32" height="32" src="data:image/png;base64,${userInstance.profileImage.encodeBase64().toString()}" alt="Image profile" /></g:link></td>
					
						<td><g:formatDate type="date" date="${userInstance.birthDate}" /></td>
					
						<td>${fieldValue(bean: userInstance, field: "aboutMe")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "realName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
