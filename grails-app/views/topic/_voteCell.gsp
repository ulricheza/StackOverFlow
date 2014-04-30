<g:javascript library="prototype" />

<div id="vote-error-${msg?.id}"/>

<td class="vote-cell">
	<div class="vote">
		<div>
			<g:remoteLink controller="message" action="voteUp" id="${msg?.id}" update="vote-error-${msg?.id}">
				<img width=30% heigth=50 src="${resource(dir:'images', file:'vote-up.png')}" alt="vote-up"/>
			</g:remoteLink>
		</div>
		
		<div id="score-${msg?.id}">
			${msg?.score}
		</div>
		
		<div>
			<g:remoteLink controller="message" action="voteDown" id="${msg?.id}" update="vote-error-${msg?.id}">
				<img width=30% heigth=50 src="${resource(dir:'images', file:'vote-down.png')}" alt="vote-down"/>
			</g:remoteLink>
		</div>

		<g:if test="${!msg?.isQuestion()}">
			<g:remoteLink 
				class="toggle-answer-status" controller="topic" action="toggleAnswerStatus" id="${msg?.id}" 
				update="vote-error-${msg?.id}">
				
					<g:if test="${msg.accepted}">
						<img width=30% heigth=50 src="${resource(dir:'images', file:'accepted-answer.png')}" alt="accept-answer"/>
					</g:if>
					<g:else>
						<img width=30% heigth=50 src="${resource(dir:'images', file:'unaccepted-answer.png')}" alt="unaccept-answer"/>
					</g:else>

			</g:remoteLink>
		</g:if>
	</div>
</td>