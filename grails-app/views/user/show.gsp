
<%@ page import="isima.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="page-title"><h1>${userInstance.username}</h1></div>
		<div id="show-user" class="content scaffold-show" role="main">
			<div>
				<div id="profile-imagecontainer-div">
					<div id="profile-image-div">
						<img border="0" width="128" height="128" 
							src="data:image/png;base64,${userInstance.profileImage.encodeBase64().toString()}" />
					</div>
					<center>
						<strong>${userInstance.reputation}</strong><br/>
						réputation
					</center>
				</div>
				<div id="profile-description-div">
					<table style="width:100%">
						<tr>
							<td class="profile-italic-description"><g:message code="isima.profile.bio.title" /></td>
							<td class="profile-description"><g:message code="isima.profile.location.title" /></td>
							<td class="profile-description">${userInstance.location}</td>
							<td></td>
						</tr>			
						<tr>
							<td class="profile-italic-description"></td>
							<td class="profile-description"><g:message code="isima.profile.realname.title" /></td>
							<td class="profile-description">${userInstance.realName}</td>
							<td></td>
						</tr>		
						<tr>
							<td class="profile-italic-description"></td>
							<td class="profile-description"><g:message code="isima.profile.birthdate.title" /></td>
							<td class="profile-description"><g:formatDate type="date" date="${userInstance?.birthDate}" /></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div id="profile-aboutme-div">
					<div><g:message code="isima.profile.aboutme.title" /></div>
					<div class="profile-aboutme">${userInstance.aboutMe}</div>
				</div>
			</div>

			<div style="clear: both">
			<div style="display:inline-block; width:49%">
				<div class="page-title"><h1>${userInstance.questions.size()} <g:message code="isima.profile.questions.label" /></h1></div>
				<g:each var="curTopic" in="${userInstance?.questions}">
    				<br/><span style="background:green; color:white">${curTopic.replies.size()<2?0:curTopic.replies.size()-1}</span> <a href="${createLink(uri: '/topic/show/')}${fieldValue(bean: curTopic, field: "id")}">${curTopic.title}</a>
  				</g:each>
			</div>
			<div style="display:inline-block; width:50%">
				<div class="page-title"><h1>${userInstance.answers.size()} <g:message code="isima.profile.answers.label" /></h1></div>
				<g:each var="curAnswer" in="${userInstance?.answers}">
    				<br/><span style="background:green; color:white">${curAnswer.topic.replies.size()<2?0:curAnswer.topic.replies.size()-1}</span> <a href="${createLink(uri: '/topic/show/')}${fieldValue(bean: curAnswer.topic, field: "id")}">curTopic${curAnswer.topic.title}</a>
  				</g:each>
			</div>
			</div>
			<br/>
			<br/>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
	</body>
</html>
