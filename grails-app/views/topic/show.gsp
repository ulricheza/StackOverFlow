
<%@ page import="isima.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<g:set var="topicQuestion" value="${topicInstance?.replies?.get(0)}" />
		<g:set var="nbAnswersSuffix" value="${(topicInstanceTotal > 1) ? 's' : ''}" />
		<title><g:fieldValue bean="${topicInstance}" field="title"/></title>
		<r:require module="scriptaculous" />
		<g:javascript library="prototype" />
		<g:setProvider library="scriptaculous" />	
		<!-- ajax login page script -->
		<script type='text/javascript'>

			// center the form
			function showLogin() {
				var ajaxLogin = $('ajaxLogin');
				$('ajaxLogin').style.left = ((screen.width - ajaxLogin.getDimensions().width) / 2) + 'px';
				$('ajaxLogin').style.top = ((document.body.getDimensions().height -
                                ajaxLogin.getDimensions().height) / 2) + 'px';
				$('ajaxLogin').style.display = 'block';
  			}

		   	function cancelLogin() { 
				Form.enable(document.ajaxLoginForm); 
		      	Element.hide('ajaxLogin'); 
		  	}

   			function authAjax() {
		    	Form.enable(document.ajaxLoginForm); 
		      	Element.update('loginMessage', '...');
		      	Element.show('loginMessage');

		      	var form = document.ajaxLoginForm; 
		      	var params = Form.serialize(form); 
		      	Form.disable(form); 
		      	new Ajax.Request(form.action, { 
		      		method: 'POST',
		        	postBody: params, 
		         	onSuccess: function(response) { 
		            	Form.enable(document.ajaxLoginForm); 
		            	var responseText = response.responseText || '[]'; 
		            	var json = responseText.evalJSON(); 
		            	if (json.success) { 
		               		location.reload('true');
		            	}
		            	else if (json.error) { 
		               		Element.update('loginMessage', "<span class='errorMessage'>" + json.error + '</error>');
		            	} 
		            	else { 
		               		Element.update('loginMessage', responseText);
		            	}
		         	}
		     	});
  			}
		</script>	
	</head>
	<body>
		<div id="list-topic" class="content scaffold-list" role="main">
			<div class="page-title"><h1><g:fieldValue bean="${topicInstance}" field="title"/></h1></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<tmpl:postTmpl msg="${topicQuestion}" tags="${topicInstance?.tags}" label="${message(code:"topic.askedon.text")}" />					    
			
			<g:if test="${topicInstanceTotal > 0}">
				<tmpl:/shared/subHeader title="${topicInstanceTotal} ${message(code:"default.answer.label")}${nbAnswersSuffix}" filters="['active','oldest']" 
						controller="topic" action="show" id="${topicInstance?.id}"  />
			</g:if>
			<g:else>
				<div style="border-bottom: 1px solid rgb(204, 204, 204);"></div>
				<br/>
			</g:else>

			<g:each in="${topicReplies}" var="answer" status="i">
				<div id="answer_${i}">
					<tmpl:postTmpl msg="${answer}" label="${message(code:"topic.answeredon.text")}" />
					<div style="border-bottom: 1px solid rgb(204, 204, 204);"></div>
				</div>
			</g:each>

			<g:if test="${topicInstanceTotal > params.max}">
				<div class="pagination">
					<g:paginate id="${topicInstance?.id}" total="${topicInstanceTotal}" />
				</div>
			</g:if>
		</div>

		<sec:ifLoggedIn>
			<g:form url="[controller:'message',action:'create']" >
				<div id="form-buttons">
					<input type="hidden" name="topic_id" id="topic_id" value="${topicInstance.id}" />
					<g:submitButton name="answerQuestion" value="${message(code: 'topic.answerthisquestion.text', default: 'Answer this Question')}" />
				</div>
			</g:form>
		</sec:ifLoggedIn>
		<sec:ifNotLoggedIn>			
			<div id="form-buttons">
				<g:link controller="user" action="create" style="text-decoration:none;">
					<input type="button" value="${message(code:'topic.signUpToPost.text', default:'Sign up to post an answer')}" />
				</g:link>
			</div>
		</sec:ifNotLoggedIn>

		<g:javascript library='prototype' />
		<g:javascript src='prototype/scriptaculous.js' />
		<g:render template='/shared/ajaxLogin'/>
	</body>
</html>