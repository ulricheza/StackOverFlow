<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head> 
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<ckeditor:resources/>
		<r:require module="jquery-ui" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<!-- autoCompletion script -->
		<script>
			$(function() {
				var url = "${createLink(uri: '/tag/searchAJAX')}"

				function split( val ) {
					return val.split( /,\s*/ );
				}

				function extractLast( term ) {
					return split( term ).pop();
				}

				$( "#tagNames" )
					// don't navigate away from the field on tab when selecting an item
					.bind( "keydown", function( event ) {
						if ( event.keyCode === $.ui.keyCode.TAB && $( this ).data( "ui-autocomplete" ).menu.active ) {
							event.preventDefault();
						}
					})
					.autocomplete({
						minLength: 0,
						source: function( request, response ) {
							// delegate back to autocomplete, but extract the last term
							$.getJSON(url, { term: extractLast(request.term) }, response);
						},
						focus: function() {
							// prevent value inserted on focus
							return false;
						},
						select: function( event, ui ) {
							var terms = split( this.value );
							// remove the current input
							terms.pop();
							// add the selected item
							terms.push( ui.item.value );
							 // add placeholder to get the comma-and-space at the end
							terms.push( "" );
							this.value = terms.join( ", " );
							return false;
						}
					});
			});
		</script>		
	</head>
	<body>
		<div id="create-topic" class="content scaffold-create" role="main">
			<div class="page-title"><h1><g:message code="isima.topic.create.label" args="[entityName]" /></h1></div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${topicInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${topicInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>	
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>