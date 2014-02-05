<g:javascript library="prototype" />

<g:javascript>
	function refreshPage(id) {
		if ($('status'+id).value == "success")
			location.reload(true)		
	}	
</g:javascript>

<g:remoteLink id="addComment${messageInstance?.id}"
			  url="[controller:'message', action:'addComment', id:"${messageInstance?.id}"]"
			  update="commentForm${messageInstance?.id}"
			  style="color:rgb(136,136,136);border:0px none;padding:0px;text-indent:-4px;cursor:pointer;text-decoration:none;">

	add comment
</g:remoteLink>