
<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<ckeditor:resources/>
	</head>
	<body>
		<div id="list-topic" class="content scaffold-list" role="main">
			<div id="title"><h3><g:fieldValue bean="${topicInstance}" field="title"/></h3></div><br/><br/>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:each in="${topicInstance.replies}" status="messageId" var="message">
				<div id="question-summary">
					<div id="votes-counter">
						<span class="nbvotes">0</span> <br/>
						<span class="nbvotes-label"><g:message code="isima.topic.newestquestions.votes" /></span><br/>
						<span class="nbanswers">0</span> <br/>
						<span class="nbanswers-label"><g:message code="isima.topic.newestquestions.answers" /></span>
					</div>
					<div id="summary">
						<div id="message-content">
							${message.content}
						</div><br/>

						<g:if test="messageId==0">
							<div>
								<g:each in="${topicInstance.tags}" var="tag">
									<div id="question-tags">
										<a class="post-tag" href="${createLink(uri: '/tag/show/')}${fieldValue(bean: tag, field: "id")}">${fieldValue(bean: tag, field: "tagName")}</a>
									</div>
								</g:each>
								<div class="question-author">
									<g:if test="${messageId==0}">Asked by </g:if>
									<g:if test="${messageId!=0}">Answered by </g:if>
									<g:link action="show" id="${topicInstance.author.id}">${topicInstance.author.username}</g:link></div>
							</div>
						</g:if>
					</div>
				</div>
			</g:each>

			<g:if test="${nbmessages > params.max}">
			<div class="pagination">
				<g:paginate total="${topicInstanceTotal}" />
			</div>
			</g:if>
		</div>














			<g:form method="post" url="[action:'save',controller:'message']">
				<strong>Your Answer</strong>
				<div class="fieldcontain ${hasErrors(bean: topicInstanceMessage, field: 'content', 'error')}">
					<ckeditor:config removePlugins = 'save'  resize_dir = 'vertical' skin = 'v2' />    
					
					<ckeditor:editor id="ckeditorTextarea" name="content">testtestetesteststest</ckeditor:editor>
					<input type="hidden" name="topic_id" id="topic_id" value="${topicInstance.id}" />
				</div>


				<fieldset class="buttons">
					<input type="submit" name="PostAnswer" value="Post Your Answer" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
