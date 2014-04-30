<table>
	<tbody>
		<div class="post-comments-list">
			<g:each in="${comments}" status="i" var="comment">
				<div id="comment-${msg.id}-${i}">
					<tr class="comment">
						<td class="comment-text">
							<span class="comment-content">${comment.content}</span>
							-
							<g:link class="comment-author" controller="user" action="show" id="${msg?.author?.id}">
								${msg?.author?.username}
							</g:link>
							-
							<span class="comment-date">
								<g:formatDate date="${comment.replyDate}" type="datetime" style="MEDIUM" timeStyle="SHORT" />
							</span>
						</td>
					</tr>	
				</div>									
			</g:each>
		</div>
	</tbody>
</table>