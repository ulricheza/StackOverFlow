<%@ page import="isima.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<ckeditor:resources/>
	</head>
	<body>
		<div id="edit-message" class="content scaffold-edit" role="main">
			<div class="page-title"><h1><g:message code="default.edit.label" args="[entityName]" /></h1></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:hasErrors bean="${messageInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${messageInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<g:form method="post" >
				<g:hiddenField name="id" value="${messageInstance?.id}" />
				<g:hiddenField name="version" value="${messageInstance?.version}" />
				
				<g:render template="form"/>
				<div style="border-bottom: 1px solid rgb(204, 204, 204);margin-top:17px;"></div>

				<div id="form-buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		</div>
	</body>
</html>