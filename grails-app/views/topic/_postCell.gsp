<td class="post-cell">
	<div class="post-text">
			${msg?.content}
	</div>
	<div class="post-tags-list">
		<g:each in="${tags}" var="tag">
			<g:link class="post-tag" controller="tag" action="show" id="${tag.id}">
				${tag.tagName}
			</g:link>										
		</g:each>
	</div>
	<table >
    	<tbody>
			<tr>
			    <td class="message-footer">
			    	<div class="post-menu">
			    		<g:remoteLink controller="message" action="edit" id="${msg?.id}" update="edit-delete-error-${msg?.id}">
			    			edit
						</g:remoteLink>
			    		<span>|</span>
			    		<g:remoteLink controller="message" action="canDelete" id="${msg?.id}" update="edit-delete-error-${msg?.id}">
			    			delete
						</g:remoteLink>
			    	</div>
			    	<div id="edit-delete-error-${msg?.id}"></div>
				</td>
				<td class="post-signature owner">
				    <div>
				   		<div class="post-creationDate" style="margin-top: 2px;margin-bottom: 4px;">
				   			${label} <g:formatDate date="${msg?.replyDate}" type="datetime" style="MEDIUM" timeStyle="SHORT" />
				   		</div>
				   		<div class="user-avatar">
					   		<img width="32" height="35" alt="" 
					   			src="https://www.gravatar.com/avatar/f2ae1b3ade1a9d83d5dd5f6a7ef56d68?s=32&d=identicon&r=PG">
					   		</img>
				   		</div>
				   		<div class="user-details">
							<g:link controller="user" action="show" id="${msg?.author?.id}">
								${msg?.author?.username}
							</g:link>
							<br/>
							${msg?.author?.reputation}
				   		</div>
				   	</div>
				</td>
			</tr>
		</tbody>
	</table>
</td>		   