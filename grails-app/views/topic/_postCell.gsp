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
			    			<g:message code="topic.message.edit" />
						</g:remoteLink>
			    		<span>|</span>
			    		<g:remoteLink controller="message" action="canDelete" id="${msg?.id}" update="edit-delete-error-${msg?.id}" params="${[offset:params.offset]}">
			    			<g:message code="topic.message.delete" />
						</g:remoteLink>
			    	</div>
			    	<div id="edit-delete-error-${msg?.id}"></div>
				</td>
				<td class="post-signature owner">
				    <div>
				    	<div class="post-creationDate" style="margin-top: 2px;margin-bottom: 4px;">
							${label} <g:formatDate date="${msg?.replyDate}" type="datetime" style="MEDIUM" timeStyle="SHORT" />
						</div>
				    	<tmpl:userDetails user="${msg?.author}" />
				   	</div>
				</td>
			</tr>
		</tbody>
	</table>
</td>		   