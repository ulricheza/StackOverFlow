
<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-topic" class="content scaffold-list" role="main">
			<div class="page-title"><h1><g:message code="isima.topic.newestquestions.title" /></h1></div><br/><br/>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:each in="${topicInstanceList}" status="i" var="topicInstance">
				<div id="question-summary">
					<div id="votes-counter">
						<span class="nbvotes">0</span> <br/>
						<span class="nbvotes-label"><g:message code="isima.topic.newestquestions.votes" /></span><br/>
						<span class="nbanswers">0</span> <br/>
						<span class="nbanswers-label"><g:message code="isima.topic.newestquestions.answers" /></span>
					</div>
					<div id="summary">
						<h3>
							<a class="home" href="${createLink(uri: '/topic/show/')}${fieldValue(bean: topicInstance, field: "id")}">
							${fieldValue(bean: topicInstance, field: "title")}</a>
						</h3>
						<div id="question-description">
							${messageHeaders[i]}
						</div>

						<div>
							<g:each in="${topicInstance.tags}" var="tag">
								<div id="question-tags">
									<a class="post-tag" href="${createLink(uri: '/tag/show/')}${fieldValue(bean: tag, field: "id")}">${fieldValue(bean: tag, field: "tagName")}</a>
								</div>
							</g:each>
							<div class="question-author">Asked by <g:link action="show" id="${topicInstance.author.id}">${topicInstance.author.username}</g:link></div>
						</div>
					</div>
				</div>
			</g:each>

			<g:if test="${topicInstanceTotal > params.max}">
			<div class="pagination">
				<g:paginate total="${topicInstanceTotal}" />
			</div>
			</g:if>
		</div>
	</body>
</html>
