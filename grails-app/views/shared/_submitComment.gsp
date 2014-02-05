<g:javascript library="prototype" />

<r:script>
	$('addComment${messageInstance?.id}').hide()
</r:script>

<g:formRemote name="postComment${messageInstance?.id}"
			  url="[controller:'comment', action:'save']"
			  update="commentForm${messageInstance?.id}"
			  onComplete="refreshPage(${messageInstance?.id});">

	<g:hasErrors bean="${commentInstance}" field="content">
		<div style="display:inline-block;margin: 1em 0em;" class="errors">
			<g:renderErrors bean="${commentInstance}" field="content" as="list" />
		</div>
	</g:hasErrors>

	<div style="display:inline-block;width:75%;">
		<g:textArea style="width:100%;resize:none;padding:0 0;border:1px solid;" name="content" value="${commentInstance?.content}" />
	</div>
	<div style="display:inline-block;width:20%;">
		<input type="hidden" name="msg_id" value="${messageInstance?.id}" />
		<input type="hidden" id="status${messageInstance?.id}" value="${status}" />
		<div id="form-buttons">
			<input style="padding:0 0;margin-left:5px;" type="submit" name="post-comment-button" value="Add comment" />
		</div>
	</div>
</g:formRemote>