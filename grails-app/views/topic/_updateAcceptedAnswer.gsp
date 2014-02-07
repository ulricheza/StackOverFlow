<r:script>
	
	var id = "${msg_id}"
	var accepted = "${accepted}" === 'true'

	var accepted_answer = "${resource(dir:'images', file:'accepted-answer.png')}"
	var unaccepted_answer = "${resource(dir:'images', file:'unaccepted-answer.png')}"

	var elements = document.getElementsByClassName('toggle-answer-status')
	for (var i = 0; i < elements.length; ++i) {
		var element_id = elements[i].id
	    var img = elements[i].getElementsByTagName("img")[0]

	    if (element_id != id){
	    	img.src = unaccepted_answer	    	
	    }
	    else {
	    	if (accepted)
	    		img.src = accepted_answer
	    	else
	    		img.src = unaccepted_answer	 
	    }
	}
</r:script>