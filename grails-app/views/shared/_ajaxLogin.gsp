<div id='ajaxLogin'>
   <div class='inner'>
      <div class='fheader'><g:message code="springSecurity.login.title"/></div> 
         <form action='${request.contextPath}/j_spring_security_check' method='POST' 
            id='ajaxLoginForm' name='ajaxLoginForm' class='cssform'> 
            <p>
               <label for='username'>${message(code:"form.placeholder.login")}</label> 
               <input type='text' class='text_' name='j_username' id='username' /> 
            </p>

            <p>
               <label for='password'>${message(code:"form.placeholder.password")}</label>
               <input type='password' class='text_' name='j_password' id='password' />
            </p>

            <p> 
               <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label> 
               <input type='checkbox' class='chk' id='remember_me' name='_spring_security_remember_me'/> 
            </p> 

            <p>
               <a href='javascript:void(0)' onclick='authAjax(); return false;'>${message(code: "springSecurity.login.button")}</a>
               <a href='javascript:void(0)' onclick='cancelLogin(); return false;'><g:message code="springSecurity.cancel.button" default="Cancel"/></a>
            </p>
         </form>

         <div style='display: none; text-align: left;' id='loginMessage'></div> 
     </div> 
</div>