<%@ page import="isima.Topic" %>

<div class="fieldcontain">
	<strong><g:message code="isima.topic.create.topictitle.label" default="Title" /></strong>
	<g:textField style="width:30%;" name="title" value="${topicInstance?.title}" placeholder="What's your question? Be specific." />
</div>

<div class="fieldcontain">	
	<ckeditor:editor name="content">	
		${topicInstance?.replies?.get(0)?.content}
	</ckeditor:editor>

	<!-- <g:textArea name="content" value="" rows="5" cols="100"/>  -->
	 
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tags', 'error')}">
	<strong><g:message code="topic.tagNames.label" default="Tags" /></strong>
	<input type="text" id="tagNames" name="tagNames" value="${topicInstanceTags}" size="25" placeholder="at least one tag, max 5 tags">
</div>