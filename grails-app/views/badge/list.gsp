 
<%@ page import="isima.Badge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'badge.label', default: 'Badge')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
		<div class="subHeader">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<div class="tabs">
			
				<g:link class="${(params.filter) == 'all' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'all']">all</g:link>

				<g:link class="${(params.filter) == 'earned' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'earned']">earned</g:link>

				<g:link class="${(params.filter) == 'unearned' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'unearned']">unearned</g:link>

				<g:link class="${(params.filter) == 'gold' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'gold']">gold</g:link>

				<g:link class="${(params.filter) == 'silver' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'silver']">silver</g:link>

				<g:link class="${(params.filter) == 'bronze' ?'currentTab':''}"
						controller="badge" action="list" params="[filter:'bronze']">bronze</g:link>
			</div>
		</div>
		<div id="list-badge" class="content scaffold-list" role="main">				
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<h1>Question Badges</h1>			
			<g:each in="${questionBadges}" var="questionBadge">
				<div class="badge-row">
					<div class="badge-title">
						<div class="badge">
							<div class="badge-${questionBadge.rank.toLowerCase()}"></div>
							${fieldValue(bean: questionBadge, field: "title")}
						</div> 
					</div>
					<div class="badge-description">${fieldValue(bean: questionBadge, field: "description")}</div>	
					<div class="badge-count">${questionBadge.awarded.size()} awarded</div>				
				</div>
			</g:each>

			<h1>Answer Badges</h1>
			<g:each in="${answerBadges}" var="answerBadge">
				<div class="badge-row">
					<div class="badge-title">
						<div class="badge">
							<div class="badge-${answerBadge.rank.toLowerCase()}"></div>
							${fieldValue(bean: answerBadge, field: "title")}
						</div> 
					</div>
					<div class="badge-description">${fieldValue(bean: answerBadge, field: "description")}</div>	
					<div class="badge-count">${answerBadge.awarded.size()} awarded</div>				
				</div>
			</g:each>

			<h1>Participation Badges</h1>
			<g:each in="${participationBadges}" var="participationBadge">
				<div class="badge-row">
					<div class="badge-title">
						<div class="badge">
							<div class="badge-${participationBadge.rank.toLowerCase()}"></div>
							${fieldValue(bean: participationBadge, field: "title")}
						</div> 
					</div>
					<div class="badge-description">${fieldValue(bean: participationBadge, field: "description")}</div>	
					<div class="badge-count">${participationBadge.awarded.size()} awarded</div>				
				</div>
			</g:each>

			<h1>Tag Badges</h1>
			<g:each in="${tagBadges}" var="tagBadge">
				<div class="badge-row">
					<div class="badge-title">
						<div class="badge">
							<div class="badge-${tagBadge.rank.toLowerCase()}"></div>
							${fieldValue(bean: tagBadge, field: "title")}
						</div> 
					</div>
					<div class="badge-description">${fieldValue(bean: tagBadge, field: "description")}</div>	
					<div class="badge-count">${tagBadge.awarded.size()} awarded</div>				
				</div>
			</g:each>

    		<h1>Moderation Badges</h1>
    		<g:each in="${moderationBadges}" var="moderationBadge">
				<div class="badge-row">
					<div class="badge-title">
						<div class="badge">
							<div class="badge-${moderationBadge.rank.toLowerCase()}"></div>
							${fieldValue(bean: moderationBadge, field: "title")}
						</div> 
					</div>
					<div class="badge-description">${fieldValue(bean: moderationBadge, field: "description")}</div>	
					<div class="badge-count">${moderationBadge.awarded.size()} awarded</div>				
				</div>
			</g:each>

    		<h1>Other Badges</h1>
    		<g:each in="${othersBadge}" var="othersBadge">
				<div class="badge-row">
					<div class="badge-title">
						<div class="badge">
							<div class="badge-${othersBadge.rank.toLowerCase()}"></div>
							${fieldValue(bean: othersBadge, field: "title")}
						</div> 
					</div>
					<div class="badge-description">${fieldValue(bean: othersBadge, field: "description")}</div>	
					<div class="badge-count">${othersBadge.awarded.size()} awarded</div>				
				</div>
			</g:each>
		</div>
	</body>
</html>