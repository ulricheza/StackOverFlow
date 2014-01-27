<%@ page import="isima.Topic" %>

<g:renderErrors bean="${book}" as="list" field="tags"/>
<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="topic.title.label" default="Title" />	
	</label>
	<g:textField name="title" value="${topicInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstanceMessage, field: 'content', 'error')}">
	<ckeditor:config
		removePlugins = 'save'
		resize_dir = 'vertical'
		skin = 'v2'
	/>
	
	<ckeditor:editor name="content" >	
		${topicInstanceMessage?.content}
	</ckeditor:editor>
<!-- <g:textArea name="content" value="" rows="5" cols="100"/>  -->
	 
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tags', 'error')}">
	<label for="tagNames">
		<g:message code="topic.tagNames.label" default="Tags" />		
	</label>
	<input type="text" id="tagNames" name="tagNames" value="${topicInstanceTags}" size="25" placeholder="at least one tag, max 5 tags">
</div>