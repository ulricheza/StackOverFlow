
<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<g:set var="topicQuestion" value="${topicInstance?.replies?.get(0)}" />
		<g:set var="nbAnswersSuffix" value="${(topicInstanceTotal > 1) ? 'answers' : 'answer'}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require module="scriptaculous" />
		<g:javascript library="prototype" />
		<g:setProvider library="scriptaculous" />
		
	</head>
	<body>
		<div id="list-topic" class="content scaffold-list" role="main">
			<div class="page-title"><h1><g:fieldValue bean="${topicInstance}" field="title"/></h1></div>
			
			<tmpl:postTmpl msg="${topicQuestion}" tags="${topicInstance?.tags}" label="asked" />					    
			
			<g:if test="${topicInstanceTotal > 0}">
				<tmpl:/shared/subHeader title="${topicInstanceTotal} ${nbAnswersSuffix}" filters="['active','oldest']" 
						controller="topic" action="show" id="${topicInstance?.id}"  />
			</g:if>
			<g:else>
				<div style="border-bottom: 1px solid rgb(204, 204, 204);"></div>
				<br/>
			</g:else>

			<g:each in="${topicReplies}" var="answer" status="i">
				<div id="answer_${i}">
					<tmpl:postTmpl msg="${answer}" label="answered" />
					<div style="border-bottom: 1px solid rgb(204, 204, 204);"></div>
				</div>
			</g:each>

			<g:if test="${topicInstanceTotal > params.max}">
				<div class="pagination">
					<g:paginate id="${topicInstance?.id}" total="${topicInstanceTotal}" />
				</div>
			</g:if>
		</div>

		<g:form url="[controller:'message',action:'create']" >
			<div id="form-buttons">
				<input type="hidden" name="topic_id" id="topic_id" value="${topicInstance.id}" />
				<g:submitButton name="answerQuestion" value="${message(code: 'default.answerQuestion.label', default: 'Answer this Question')}" />
			</div>
		</g:form>
	</body>
</html>