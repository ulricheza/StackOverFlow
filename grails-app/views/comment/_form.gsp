<%@ page import="isima.Comment" %>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="comment.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${commentInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'relatedMsg', 'error')} required">
	<label for="relatedMsg">
		<g:message code="comment.relatedMsg.label" default="Related Msg" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="relatedMsg" name="relatedMsg.id" from="${isima.Message.list()}" optionKey="id" required="" 
		value="${commentInstance?.relatedMsg?.id}" class="many-to-one"/>
</div>