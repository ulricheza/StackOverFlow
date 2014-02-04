<g:javascript library="prototype" />

<g:javascript>
	function replaceEditor (form) {
		
		CKEDITOR.instances.ckeditorTextarea.destroy();
		//alert (document.getElementById('ckeditorTextarea').value);
	}

	function clearForm () {
		if($('bidule')) {
			var total = "${topicInstanceTotal}";
			var id = $('topic_id').value;
			var max = "${params.max}";
			var offset = Math.floor(total/max)*max;
			var answerId = total-offset
			
			var actualLocation = location.protocol + '//' + location.host + location.pathname
			var nextLocation = actualLocation + '?offset='+offset + '&max='+max + "#" + 'answer_'+answerId;
			
			location.reload(true)
			location.href = nextLocation
			return false;
		}
	}

	function scrollToLastQuestion () {
		var total = "${topicInstanceTotal}";
		var max = "${params.max}";
		var offset = Math.floor(total/max)*max;
		var answerId = total-offset

		location.hash = "#" + 'answer_'+answerId;
		return false;
	}
</g:javascript>

<r:script>
	//CKEDITOR.instances.ckeditorTextarea.destroy();
</r:script>

<g:formRemote name="productForm"
			  url="[action:'reply']"
			  update="ajaxForm"
			  //onBefore="replaceEditor();"
			  onComplete="clearForm();"
			  onSuccess="replaceEditor();"
			  after="scrollToLastQuestion();">

	<g:if test="${message}">
		<div id="bidule" role="status"></div>
	</g:if>

	<div style="margin-bottom:10px;"><strong>Your Answer</strong></div>
	<g:hasErrors bean="${messageInstance}" field="content">
		<div id="msgError" class="errors">
			<g:renderErrors bean="${messageInstance}" field="content" as="list" />
		</div>
	</g:hasErrors>

	<textarea id="ckeditorTextarea" name="content">${messageInstance?.content}</textarea> 	
	<br />

	<!-- <ckeditor:editor bodyId="fg" id="ckeditorTextarea" name="content">${messageInstance?.content}</ckeditor:editor> -->
	<input type="hidden" name="topic_id" id="topic_id" value="${topicInstance.id}" />

	<input type="submit" name="PostAnswer" value="Post Your Answer" />
</g:formRemote>