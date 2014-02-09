 
<%@ page import="isima.Badge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'badge.label', default: 'Badge')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
		<div id="subHeader">
			<h1><g:message code="badges.page.h1.text" /></h1>
			<div class="tabs">
			
				<g:link class="${(params.filter) == 'all' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'all']"><g:message code="badges.tab.all" /></g:link>

				<g:link class="${(params.filter) == 'earned' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'earned']"><g:message code="badges.tab.earned" /></g:link>

				<g:link class="${(params.filter) == 'unearned' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'unearned']"><g:message code="badges.tab.unearned" /></g:link>

				<g:link class="${(params.filter) == 'gold' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'gold']"><g:message code="badges.tab.gold" /></g:link>

				<g:link class="${(params.filter) == 'silver' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'silver']"><g:message code="badges.tab.silver" /></g:link>

				<g:link class="${(params.filter) == 'bronze' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'bronze']"><g:message code="badges.tab.bronze" /></g:link>
			</div>
		</div>
		<div id="list-badge" class="content scaffold-list" role="main">				
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<h1><g:message code="badges.question.badges.text" /></h1>	
			<tmpl:display badgesList="${questionBadges}" />		

			<h1><g:message code="badges.answer.badges.text" /></h1>
			<tmpl:display badgesList="${answerBadges}" />	
			
			<h1><g:message code="badges.moderation.badges.text" /></h1>
			<tmpl:display badgesList="${moderationBadges}" />		
		</div>
	</body>
</html>