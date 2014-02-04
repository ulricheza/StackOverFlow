<%@ page import="isima.Message" %>

<div class="fieldcontain">
	<ckeditor:editor name="content">	
		${messageInstance?.content}
	</ckeditor:editor>
</div>