<%@ page import="isima.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'tagName', 'error')} ">
	<label for="tagName">
		<g:message code="tag.tagName.label" default="Tag Name" />
		
	</label>
	<g:textField name="tagName" value="${tagInstance?.tagName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="tag.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${tagInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'tagCount', 'error')} required">
	<label for="tagCount">
		<g:message code="tag.tagCount.label" default="Tag Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tagCount" type="number" value="${tagInstance.tagCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'taggedTopics', 'error')} ">
	<label for="taggedTopics">
		<g:message code="tag.taggedTopics.label" default="Tagged Topics" />
		
	</label>
	
</div>

