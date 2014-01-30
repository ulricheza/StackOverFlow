<%@ page import="isima.Topic" %>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="topic.title.label" default="Title" />	
	</label>
	<g:textField name="title" value="${topicInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstanceMessage, field: 'content', 'error')}">	

	<ckeditor:editor name="content">	
		${topicInstance?.replies?.get(0)?.content}
	</ckeditor:editor>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tags', 'error')}">
	<label for="tagNames">
		<g:message code="topic.tagNames.label" default="Tags" />		
	</label>
	<input type="text" id="tagNames" name="tagNames" value="${topicInstanceTags}" size="25">
</div>