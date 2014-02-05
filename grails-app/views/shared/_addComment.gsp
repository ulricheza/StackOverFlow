<g:javascript library="prototype" />

<g:javascript>
	function hideForm (id) {
		$('addComment'+id).hide()
	}

	function refreshPage(id) {
		if ($('status'+id).value == "success")
			location.reload(true)		
	}	
</g:javascript>

<g:formRemote name="addComment${messageInstance?.id}"
			  url="[controller:'message', action:'addComment']"
			  update="commentForm${messageInstance?.id}"
			  onComplete="hideForm(${messageInstance?.id});">

	<input type="hidden" name="msg_id" value="${messageInstance?.id}" />
	<input style="color:rgb(136,136,136);border:0px none;padding:0px;text-indent:-4px;cursor: pointer;" type="submit" name="add-comment-button" value="add comment" />

</g:formRemote>