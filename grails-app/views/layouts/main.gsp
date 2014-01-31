<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="header" >
			<div id="grailsLogo" role="banner" style="display:inline-block">
				<a href="${createLink(uri: '/')}"><img width="250" src="${resource(dir: 'images', file: 'logo.StackOverflow.png')}" alt="logo"/></a>
			</div>
			<div id="menus">
				<ul>
					<li <g:if test="1==1">class="youarehere"</g:if>><a href="${createLink(uri: '/questions')}"><g:message code="isima.header.tags.questions" /></a></li>
					<li class="youarenotthere"><g:link url="${createLink(uri: '/tags')}"><g:message code="isima.header.tags.tags" /></g:link></li>
					<li class="youarenotthere"><g:link url="${createLink(uri: '/users')}"><g:message code="isima.header.tags.users" /></g:link></li>
					<li class="youarenotthere"><g:link url="${createLink(uri: '/')}"><g:message code="isima.header.tags.badges" /></g:link></li>
					<li class="youarenotthere"><g:link url="${createLink(uri: '/unanswered')}"><g:message code="isima.header.tags.unanswered" /></g:link></li>
					<li class="youarenotthere"><g:link action="create" controller="topic"><g:message code="isima.header.tags.askquestion" /></g:link></li>
				</ul>
			</div>
			<br/><br/><br/>
		</div>	    

		<div id="pagecontent">
			<g:layoutBody/>
		</div>
		
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
