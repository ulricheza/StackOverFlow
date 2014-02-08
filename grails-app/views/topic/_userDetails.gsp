<div>
	<div class="user-avatar">
		<img width="32" height="35" alt="user-profile-picture" 
			src="https://www.gravatar.com/avatar/f2ae1b3ade1a9d83d5dd5f6a7ef56d68?s=32&d=identicon&r=PG">
		</img>
	</div>
	
	<div class="user-info">
		<g:link controller="user" action="show" id="${user?.id}">
			${user?.username}
		</g:link>
		<br/>
		${user?.reputation}

		<g:if test="${user.nbBronzeBadges > 0}">
			<div class="badge-bronze"></div>
			${user?.nbBronzeBadges}
		</g:if>

		<g:if test="${user.nbSilverBadges > 0}">
			<div class="badge-silver"></div>
			${user?.nbSilverBadges}
		</g:if>

		<g:if test="${user.nbGoldBadges > 0}">
			<div class="badge-gold"></div>
			${user?.nbGoldBadges}
		</g:if>
	</div>
</div>