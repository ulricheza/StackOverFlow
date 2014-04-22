
<%@ page import="isima.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<g:set var="nbQuestionsSuffix" value="${(userInstance?.questions?.size() > 1) ? 's' : ''}" />
		<g:set var="nbAnswersSuffix" value="${(userInstance?.nbAnswers > 1) ? 's' : ''}" />
		<title>${userInstance?.username}</title>
	</head>
	<body>
		<div class="page-title">
			<div style="display:inline-block">
				<h1>${userInstance.username}</h1>
			</div>
			<div style="display:inline-block;float:right;margin-right:15px">
				<g:link controller="user" action="edit" id="${userInstance.id}" style="text-decoration:none">
					<input style="border: 1px solid #cccccc;font-size: 1em;cursor: pointer;background-color: rgb(26,26,26);color: white;" 
						type="button" value="${message(code:'user.edit.title', default:'Edit your profile')}" />
				</g:link>
			</div>
		</div>

		<div id="show-user" class="content scaffold-show" role="main">
			<div>
				<div id="profile-imagecontainer-div">
					<div id="profile-image-div">
						<img border="0" width="128" height="128" 
							src="data:image/png;base64,${userInstance.profileImage.encodeBase64().toString()}" />
					</div>
					<center>
						<strong>${userInstance.reputation}</strong>
						<br/>
						<g:message code="user.profile.reputation.title" />
					</center>
				</div>

				<div id="profile-description-div">
					<table style="width:100%">
						<tr>
							<td class="profile-italic-description"><g:message code="user.profile.bio.title" /></td>
							<td class="profile-description"><g:message code="user.profile.location.title" /></td>
							<td class="profile-description">${userInstance.location}</td>
							<td></td>
						</tr>			
						<tr>
							<td class="profile-italic-description"></td>
							<td class="profile-description"><g:message code="user.profile.realName.title" /></td>
							<td class="profile-description">${userInstance.realName}</td>
							<td></td>
						</tr>		
						<tr>
							<td class="profile-italic-description"></td>
							<td class="profile-description"><g:message code="user.profile.birthDate.title" /></td>
							<td class="profile-description"><g:formatDate type="date" date="${userInstance?.birthDate}" /></td>
							<td></td>
						</tr>
					</table>
				</div>

				<div id="profile-aboutme-div">
					<div><g:message code="user.profile.aboutMe.title" /></div>
					<div class="profile-aboutme">${userInstance.aboutMe}</div>
				</div>
			</div>

			<div style="clear:both">
				<div style="display:inline-block;width:49%;vertical-align:top">
					<div class="page-title">
						<h1>${userInstance.questions.size()} <g:message code="user.profile.question.label" />${nbQuestionsSuffix}</h1>
					</div>
					<g:each in="${userInstance?.questions}" var="curTopic" >
	    				<br/>
	    				<span style="background:green;color:white">${curTopic.replies.size()<=1?0:curTopic.replies.size()-1}</span> 
	    				<a href="${createLink(uri: '/topic/show/')}${fieldValue(bean: curTopic, field: "id")}">${curTopic.title}</a>
	  				</g:each>
				</div>

				<div style="display:inline-block;width:50%;vertical-align:top">
					<div class="page-title">
						<h1>${userInstance.nbAnswers} <g:message code="user.profile.answer.label" />${nbAnswersSuffix}</h1>
					</div>
					<g:each var="curAnswer" in="${userInstance?.answers}">
						<g:if test="${!curAnswer.isQuestion()}">
	    					<br/>
	    					<span style="background:green;color:white">${curAnswer.topic.replies.size()<=1?0:curAnswer.topic.replies.size()-1}</span> 
	    					<a href="${createLink(uri: '/topic/show/')}${fieldValue(bean: curAnswer.topic, field: "id")}">${curAnswer.topic.title}</a>
	    				</g:if>
	  				</g:each>
				</div>
			</div>
			<br/><br/>
		</div>
	</body>
</html>