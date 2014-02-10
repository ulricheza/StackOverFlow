<%@ page import="isima.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.account" /></title>
	</head>
	<body>
		<div id="create-user" class="content scaffold-create" role="main">
			<div class="page-title"><h1><g:message code="default.create.account" /></h1></div>

			<g:hasErrors bean="${userInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<g:form action="save" enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<div style="border-bottom: 1px solid rgb(204, 204, 204);margin-top:17px;"></div>
				<div id="form-buttons">
					<g:submitButton name="create" value="${message(code:'default.create.user')}"/>
				</div>
			</g:form>
		</div>
	</body>
</html>