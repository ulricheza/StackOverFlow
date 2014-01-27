
<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-topic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>							
						<g:sortableColumn property="title" title="${message(code: 'topic.title.label', default: 'Title')}" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										
						<td><strong><a class="home" href="${createLink(uri: '/topic/show/')}${fieldValue(bean: topicInstance, field: "id")}">${fieldValue(bean: topicInstance, field: "title")}</a></strong> <br /> ${messageHeaders[i]}

							<g:each in="${topicInstance.tags}" var="tag">
								<div style="display: inline-block; background-color:rgb(224,234,241);">
									<a class="post-tag" href="${createLink(uri: '/tag/show/')}${fieldValue(bean: tag, field: "id")}">${fieldValue(bean: tag, field: "tagName")}</div>
									</a>
							</g:each>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topicInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
