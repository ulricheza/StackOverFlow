
<%@ page import="isima.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="user.list.title" /></title>

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<r:require module="jquery-ui" />
		<!-- autoCompletion script -->
		<script>
			$(function() {
				var url = "${createLink(uri: '/user/findUsersAjax')}"

				function split( val ) {
					return val.split( /,\s*/ );
				}

				function extractLast( term ) {
					return split( term ).pop();
				}

				$( "#userSearch" )
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
							$.getJSON(url, { term: extractLast(request.term) }, function(te){

								// Clean the table from the previous results.
								$('#userListContent tbody').remove();
								$('#userListContent td').remove();
								$('#userListContent tr').remove();

								// Populate the table with the new results.
								var i;
								for(i=0; i<te["users"].length; ++i)
								{
									if(i%4==0) $("#userListContent").append("<tr>");

									$("#userListContent tbody tr").last().append(
										"<td class=\"tag-cell\">" +
											"<img style=\"float:left; margin-right:5px;\" width=\"32\" height=\"32\" src=\"data:image/png;base64,"+te["users"][i]["img"]+"\" />" +
											"<div class=\"user-description-container\">" +
												"<a class=\"username-link\" href=\"./user/show/"+te["users"][i]["id"]+"\">"+te["users"][i]["username"]+"</a><br/>" +
												"<div class=\"tag-short-description\">"+te["users"][i]["location"]+"</div>" +
											"</div>" +
										"</td>"
									);
									
									if((i+1)%4==0) $("#userListContent").append("</tr>");
								}
							});

						},
						focus: function() {
							// prevent value inserted on focus
							return false;
						},
						select: function( event, ui ) {
							return false;
						}

					});
			});
		</script>	
	</head>
	<body>
		<div id="list-user" class="content scaffold-list" role="main">
			<div class="page-title"><h1><g:message code="user.list.title" /></h1></div>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="shortdescription">
				<label for="userSearch"><g:message code="user.list.search.label" default="Tag Name" /></label>
				<g:textField name="userSearch" id="userSearch" placeholder="${message(code:"form.placeholder.user")}" value="" />
				<br/><br/>
			</div>

			<table id="userListContent" name="userListContent">
				<g:each in="${userInstanceList}" status="userInstanceId" var="userInstance">
					<g:if test="${userInstanceId%4==0}">
						<tr>
					</g:if>
					<td class="tag-cell">
						<img style="float:left; margin-right:5px;" width="32" height="32" 
							src="data:image/png;base64,${userInstance.profileImage.encodeBase64().toString()}" />
						<div class="user-description-container">
							<a class="username-link" href="${createLink(uri: '/user/show/')}${userInstance.id}">
								${userInstance.username}
							</a>
							<br/>
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