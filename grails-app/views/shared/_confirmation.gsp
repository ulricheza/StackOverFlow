<div class="confirmation-dialog" id="confirmation-dialog-${id}">
	<g:form >
		Are you sure ? : 
		<g:hiddenField name="id" value="${id}" />
		<input type=hidden name="offset" value="${offset}" />
		<g:actionSubmit action="${action}" value="Yes" />
		<input type=button value="No" onclick="$('confirmation-dialog-${id}').hide();" />
	</g:form>
</div>