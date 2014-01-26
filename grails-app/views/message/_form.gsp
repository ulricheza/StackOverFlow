<%@ page import="isima.Message" %>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="message.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${isima.User.list()}" optionKey="id" required="" value="${messageInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="message.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${messageInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'replyDate', 'error')} required">
	<label for="replyDate">
		<g:message code="message.replyDate.label" default="Reply Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="replyDate" precision="day"  value="${messageInstance?.replyDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="message.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${isima.Topic.list()}" optionKey="id" required="" value="${messageInstance?.topic?.id}" class="many-to-one"/>
</div>

