<%@ page import="isima.Topic" %>

<br/>
<g:renderErrors bean="${book}" as="list" field="tags"/>
<div>
	<strong><g:message code="isima.topic.create.topictitle.label" default="Title" /></strong>
	<g:textField name="title" value="${topicInstance?.title}" placeholder="What's your programming question? Be specific." />
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstanceMessage, field: 'content', 'error')}">	

	<ckeditor:editor name="content">	
		${topicInstance?.replies?.get(0)?.content}
	</ckeditor:editor>

	<!-- <g:textArea name="content" value="" rows="5" cols="100"/>  -->
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tags', 'error')}">
	<strong><g:message code="topic.tagNames.label" default="Tags" /></strong>
	<input type="text" id="tagNames" name="tagNames" value="${topicInstanceTags}" size="25" placeholder="at least one tag, max 5 tags">
</div>