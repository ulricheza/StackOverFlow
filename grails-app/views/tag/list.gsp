
<%@ page import="isima.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="isima.tags.list.title" /></title>


		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<r:require module="jquery-ui" />
		<!-- autoCompletion script -->
		<script>
			$(function() {
				var url = "${createLink(uri: '/tag/findTagsAjax')}"

				function split( val ) {
					return val.split( /,\s*/ );
				}

				function extractLast( term ) {
					return split( term ).pop();
				}

				$( "#tagSearch" )
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
								$('#tagListContent tbody').remove();
								$('#tagListContent td').remove();
								$('#tagListContent tr').remove();

								// Populates the table with the new results.
								var i;
								for(i=0; i<te["tags"].length; ++i)
								{
									if(i%4==0) $("#tagListContent").append("<tr>");
									
									$("#tagListContent tbody tr").last().append(
										"<td class=\"tag-cell\">" +
											"<a class=\"post-tag\" href=\"./tag/show/"+te["tags"][i]["id"]+"\">"+te["tags"][i]["tagName"]+"</a>" +
										"</td>"
									);

									if((i+1)%4==0) $("#tagListContent").append("</tr>");
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

		

		<div id="list-tag" class="content scaffold-list" role="main">
			<div class="page-title"><h1><g:message code="isima.tags.list.title" /></h1></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="shortdescription">				
				<label for="tagSearch"><g:message code="isima.tags.list.search.label" default="Tag Name" /></label>
				<g:textField name="tagSearch" id="tagSearch" placeholder="Tag" value="" />
				<br/><br/>
			</div>


			<table id="tagListContent" name="tagListContent">
				<g:each in="${tagInstanceList}" status="tagInstanceId" var="tagInstance">

					<g:if test="${tagInstanceId%4==0}">
					<tr>
					</g:if>
						<td class="tag-cell">
							<a class="post-tag" href="${createLink(uri: '/tag/show/')}${tagInstance.id}">${tagInstance.tagName}</a><br/>
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
