<%@ page import="isima.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<ckeditor:resources/>
	</head>
	<body>		
		<div id="create-message" class="content scaffold-create" role="main">
			<div class="page-title"><h1><g:fieldValue bean="${topicInstance}" field="title"/></h1></div>
			
			<g:hasErrors bean="${messageInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${messageInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<g:form action="save" >
				<g:render template="form"/>
				<div style="border-bottom: 1px solid rgb(204, 204, 204);margin-top:17px;"></div>

				<div id="form-buttons">
					<input type="hidden" name="topic_id" id="topic_id" value="${topicInstance.id}" />
					<g:submitButton name="postAnswer" value="${message(code: 'default.postAnswer.label', default: 'Post your answer')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>