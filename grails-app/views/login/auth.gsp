<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	

	/***************************************/
	#login #title {
		border-bottom:1px solid #cccccc;
		font-weight:bold;
	}
	#login #instruction {
		font-size:20px;
		font-weight:bold;
		padding-bottom: 5px;
	}
	#login #flashMessage {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}
	#login #content {
		margin-left:20px;
	}
	</style>
</head>

<body>
<div id='login'>
	<div class="page-title"><h1><g:message code="springSecurity.login.title"/></h1></div></br>
	<div id="content">
		<div id="instruction"><g:message code="springSecurity.login.header"/></div>
		<g:if test='${flash.message}'>
				<div id="flashMessage">${flash.message}</div>
		</g:if>
		<div id="fields">
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<input type='text' class='text_' name='j_username' id='username' placeholder="${message(code:"form.placeholder.login")}" />
				<input type='password' class='text_' name='j_password' id='password' placeholder="${message(code:"form.placeholder.password")}"/><br/><br/>

				<label>
					<input type='checkbox' class='chk' name='${rememberMeParameter}' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
					<g:message code="springSecurity.login.remember.me.label"/>
				</label>
				<br/><br/>
				
				<input type='submit' value='${message(code: "springSecurity.login.button")}'/>
			</form>
		</div>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>