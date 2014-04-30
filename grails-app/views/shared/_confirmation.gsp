<div class="confirmation-dialog" id="confirmation-dialog-${id}">
	<g:form >
		<g:message code='default.confirmation.message' /> : 
		<g:hiddenField name="id" value="${id}" />
		<input type=hidden name="offset" value="${offset}" />
		<g:actionSubmit action="${action}" value="${message(code:'default.yes.button')}" />
		<input type=button value="${message(code:'default.no.button')}" onclick="$('confirmation-dialog-${id}').hide();" />
	</g:form>
</div>