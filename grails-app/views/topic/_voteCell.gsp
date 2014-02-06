<g:javascript library="prototype" />

<td class="vote-cell">
	<div class="vote">
		<div>
			<g:remoteLink class="vote-up" controller="message" action="voteUp" id="${msg_id}" update="vote-error-${msg_id}">
			</g:remoteLink>
		</div>
		<br/>
		<div id="score-${msg_id}">${score}</div><br/>	
		<div>
			<g:remoteLink class="vote-down" controller="message" action="voteDown" id="${msg_id}" update="vote-error-${msg_id}">
			</g:remoteLink>
		</div>			
	</div>
</td>
<div id="vote-error-${msg_id}"></div>