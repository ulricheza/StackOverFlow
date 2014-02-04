<div class="question">
	<table>
		<tbody>
			<tr>
				<tmpl:voteCell mark="${msg?.mark}" />
				<tmpl:postCell tags="${tags}" label="${label}" msg="${msg}" />
			</tr>
			<tr>
				<td class="vote-cell"></td>
				<td><a class="post-cell post-comment" href="#">add comment</a></td>
			</tr>
		</tbody>
	</table>	
</div>