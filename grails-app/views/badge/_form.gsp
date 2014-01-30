<%@ page import="isima.Badge" %>



<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="badge.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${badgeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: 'awarded', 'error')} ">
	<label for="awarded">
		<g:message code="badge.awarded.label" default="Awarded" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="badge.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${badgeInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="badge.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${badgeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: 'rank', 'error')} ">
	<label for="rank">
		<g:message code="badge.rank.label" default="Rank" />
		
	</label>
	<g:textField name="rank" value="${badgeInstance?.rank}"/>
</div>

