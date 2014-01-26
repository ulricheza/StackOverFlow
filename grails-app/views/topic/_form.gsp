<%@ page import="isima.Topic" %>

<g:renderErrors bean="${book}" as="list" field="tags"/>
<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="topic.title.label" default="Title" />	
	</label>
	<g:textField name="title" value="${topicInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstanceMessage, field: 'content', 'error')}">
	<label for="content">
		<g:message code="topic.content.label" default="Message" />		
	</label>
	<g:textArea name="content" value="${topicInstanceMessage?.content}" rows="5" cols="100"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tags', 'error')}">
	<label for="tagNames">
		<g:message code="topic.tagNames.label" default="Tags" />		
	</label>
	<input type="text" id="tagNames" name="tagNames" value="${topicInstanceTags}" size="25" placeholder="at least one tag, max 5 tags">
</div>