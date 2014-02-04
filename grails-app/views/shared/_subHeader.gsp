<div id="subHeader">
	<h1 id="answers">${title}</h1>

	<div class="tabs">		
		<g:each in="${filters}" var="filter_name">
				<a  class="${(params.filter) == filter_name ?'currentTab':''}"
					href='<g:createLink controller="${controller}" action="${action}" id="${id}"
						params="[filter:filter_name]" />#answers'>

						${filter_name}
				</a>											
		</g:each>
	</div>
</div>