<g:each in="${badgesList}" var="badge">
	<div class="badge-row">
		<div class="badge-title">
			<div class="badge">
				<div class="badge-${badge.level.toLowerCase()}"></div>
				${fieldValue(bean: badge, field: "title")}
			</div> 
		</div>
		<div class="badge-description">${fieldValue(bean: badge, field: "description")}</div>	
		<div class="badge-count">${badge.count} awarded</div>
	</div>
</g:each>