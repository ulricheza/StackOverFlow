<div>
	<div class="user-avatar">
		<img width="32" height="35" alt="user-avatar" 
			src="data:image/png;base64,${user.profileImage.encodeBase64().toString()}">
		</img>
	</div>
	
	<div class="user-info">
		<g:link controller="user" action="show" id="${user?.id}">
			${user?.username}
		</g:link>
		<br/>
		${user?.reputation}

		<g:if test="${user.nbBronzeBadges > 0}">
			<div class="badge-bronze"/>
			${user?.nbBronzeBadges}
		</g:if>

		<g:if test="${user.nbSilverBadges > 0}">
			<div class="badge-silver"/>
			${user?.nbSilverBadges}
		</g:if>

		<g:if test="${user.nbGoldBadges > 0}">
			<div class="badge-gold"/>
			${user?.nbGoldBadges}
		</g:if>
	</div>
</div>