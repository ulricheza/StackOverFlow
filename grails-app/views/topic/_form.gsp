<%@ page import="isima.Topic" %>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="topic.title.label" default="Title" />		
	</label>
	<g:textField name="title" value="${topicInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'topicMessages', 'error')} ">
	<label for="topicMessage">
		<g:message code="topic.topicMessages.label" default="Message" />		
	</label>
	<g:textArea name="msgContent" value="myValue" rows="5" cols="100"/>
</div>