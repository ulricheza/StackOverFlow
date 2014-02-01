
<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<g:set var="topicQuestion" value="${topicInstance.replies?.get(0)}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<ckeditor:resources/>
	</head>
	<body>
		<div id="list-topic" class="content scaffold-list" role="main">
			<div class="page-title"><h1><g:fieldValue bean="${topicInstance}" field="title"/></h1></div><br/>
			
			<div class="question">
			 <table>
			  <tbody>
			   <tr>
				<td class="vote-cell">
					<div class="vote">
						<div><a class="vote-up" href="#"></a></div><br/>
						<div>${topicQuestion?.mark}</div><br/>	
						<div><a class="vote-down" href="#"></a></div>				
					</div>
				</td>
				<td class="post-cell">
					<div class="post-text">
						${topicQuestion?.content}
					</div>
					<div class="post-tags-list">
						<g:each in="${topicInstance.tags}" var="tag">
							<g:link class="post-tag" controller="tag" action="show" id="${tag.id}">
								${tag.tagName}
							</g:link>										
						</g:each>
					</div>
					<table style="width:100%;">
					 <tbody>
					  <tr>
					   <td class="message-footer">
					    	<div class="post-menu">
					    		<a href="#">edit</a>
					    		<span>|</span>
					    		<a href="#">delete</a>
					    	</div>
					   </td>
					   <td class="post-signature owner">
					    <div>
					   		<div class="post-creationDate" style="margin-top: 2px;margin-bottom: 4px;">
					   			asked ${topicQuestion.replyDate}
					   		</div>
					   		<div class="user-avatar">
						   		<img width="32" height="35" alt="" 
						   			src="https://www.gravatar.com/avatar/f2ae1b3ade1a9d83d5dd5f6a7ef56d68?s=32&d=identicon&r=PG">
						   		</img>
					   		</div>
					   		<div class="user-details">
								<g:link controller="user" action="show" id="${topicQuestion.author.id}">
									${topicQuestion.author.username}
								</g:link>
								<br/>
								${topicQuestion.author.reputation}
					   		</div>
					   	</div>
					   </td>
					  </tr>
					 </tbody>
					</table>
				</td>
			   </tr>
			   <tr>
			   		<td class="vote-cell"></td>
			   		<td><a class="post-cell post-comment" href="#">add comment</a></td>
			   </tr>
			  </tbody>
			 </table>
			</div>

			<g:each in="${topicInstance.replies-topicQuestion}" status="messageId" var="message">
				<div id="message-summary">
					<div class="vote-up-down">
						<div class="arrow-up"></div>
						<div class="arrow-down"></div>
					</div>
					<div id="summary">
						<div id="message-content">
							${message.content}
						</div>

						<g:if test="messageId==0">
							<div>
								<g:each in="${topicInstance.tags}" var="tag">
									<div id="question-tags">
										<a class="post-tag" href="${createLink(uri: '/tag/show/')}${fieldValue(bean: tag, field: "id")}">${fieldValue(bean: tag, field: "tagName")}</a>
									</div>
								</g:each>
						</g:if>
						<div class="question-author">
							<g:if test="${messageId==0}">Asked by </g:if>
							<g:if test="${messageId!=0}">Answered by </g:if>
							<g:link action="show" id="${topicInstance.author.id}">${topicInstance.author.username}</g:link></div>
						</div>
					</div>
				</div>
			</g:each>

			<g:if test="${nbmessages > params.max}">
			<div class="pagination">
				<g:paginate total="${topicInstanceTotal}" />
			</div>
			</g:if>
		</div>

		<g:form class="yourAnswer" method="post" url="[controller:'topic', action:'addReply']">
			<strong>Your Answer</strong>
			<g:hasErrors bean="${topicAnswer}" field="content">
    			<div class="errors">
       				<g:renderErrors bean="${topicAnswer}" field="content" as="list" />
    			</div>
			</g:hasErrors>
			
			<ckeditor:editor id="ckeditorTextarea" name="content">${topicAnswer?.content}</ckeditor:editor>
			<input type="hidden" name="topic_id" id="topic_id" value="${topicInstance.id}" />

			<input type="submit" name="PostAnswer" value="Post Your Answer" />
		</g:form>
	</body>
</html>