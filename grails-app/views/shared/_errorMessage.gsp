<div id="error-message${msg_id}" style="display:inline-block;margin: 1em 0em;" class="errors">
	<div style="display:inline-block;" class="message-text">
		${errorMsg}
	</div>
	<div style="display:inline-block;border:1px solid rgba(0, 0, 0, 0.2);padding: 2px 6px 3px;cursor:pointer;" class="message-close">
		<a style="text-decoration:none;" onclick="$('error-message${msg_id}').hide();$('addComment${msg_id}').style.display='block';">x</a>
	</div>
</div>