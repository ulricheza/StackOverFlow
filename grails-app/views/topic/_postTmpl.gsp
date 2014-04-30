<div class="question">

	<table>
		<tbody>
			<tr>
				<tmpl:voteCell msg="${msg}" />
				<tmpl:postCell tags="${tags}" label="${label}" msg="${msg}" />
			</tr>
			<tr>
				<td class="vote-cell"/>
				<td><tmpl:postComments comments="${msg?.comments}" msg="${msg}" /></td>
			</tr>
			<tr>
				<td class="vote-cell"/>
				<td><tmpl:/shared/addComment messageInstance="${msg}" /></td>
			</tr>
			<tr>
				<td class="vote-cell"/>
				<td><div id="commentForm${msg?.id}"/></td>
			</tr>
		</tbody>
	</table>	
</div>