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
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'loginAjax.css')}" type="text/css">
		<g:set var="loggedUser_id"><sec:loggedInUserInfo field="id"/></g:set>
		<g:set var="loggedUser_img"><sec:loggedInUserInfo field="profileImage"/></g:set>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="topbar">
			<div>
				<sec:ifNotLoggedIn>
					<g:link class="topbar-link" controller="login"><g:message code="identification.login.text" /></g:link>
					<g:link class="topbar-link" controller="user" action="create"><g:message code="identification.signup.text" /></g:link>
				</sec:ifNotLoggedIn>
				<sec:ifLoggedIn>
					<g:link class="topbar-link" controller="logout"><g:message code="identification.logout.text" /></g:link>
					<g:link controller="user" action="show" id="${loggedUser_id}" >
						<img class="topbar-link" width="25" height="25" alt="user-profile-picture" title="go to your profile page"
							src="data:image/png;base64,${loggedUser_img}" />
						</img>
					</g:link>					
				</sec:ifLoggedIn>
			</div>
		</div>
		<div id="header">
			<div id="grailsLogo" role="banner">
				<a href="${createLink(uri: '/')}"><img width="250" src="${resource(dir: 'images', file: 'logo.StackOverflow.png')}" alt="logo"/></a>
			</div>
			<div id="menus">
				<ul>
					<li>
						<g:link class="${(selectedTab == 'questions')? 'youarehere' : ''}" 
							url="${createLink(uri:'/questions')}"><g:message code="isima.header.tags.questions"/></g:link>
					</li>
					<li>
						<g:link class="${(selectedTab == 'tags')? 'youarehere' : ''}" 
							url="${createLink(uri:'/tags')}"><g:message code="isima.header.tags.tags" /></g:link>
					</li>
					<li>
						<g:link class="${(selectedTab == 'users')? 'youarehere' : ''}" 
							url="${createLink(uri:'/users')}"><g:message code="isima.header.tags.users" /></g:link>
					</li>
					<li>
						<g:link class="${(selectedTab == 'badges')? 'youarehere' : ''}" 
							url="${createLink(uri: '/badges')}"><g:message code="isima.header.tags.badges" /></g:link>
					</li>
					<li class="last-link">
						<g:link class="${(selectedTab == 'askQuestion')? 'youarehere' : ''}"
							controller="topic" action="create"><g:message code="isima.header.tags.askquestion" /></g:link>
					</li>
				</ul>
			</div>
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