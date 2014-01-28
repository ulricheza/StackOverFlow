CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.removePlugins = 'elementspath,save';
	config.resize_dir = 'vertical';
	//config.skin = 'BootstrapCK-Skin'
	//config.skin = 'kama'
	//config.skin = 'office2003';
	config.skin = 'v2';
	config.toolbar = [
		{ name: 'document', items : [ 'Preview' ] },
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    	{ name: 'paragraph', items : [ 'NumberedList','BulletedList' ]},
    	{ name: 'insert', items : [ 'HorizontalRule','Smiley' ] },
    	{ name: 'links', items : [ 'Link','Unlink' ] }
	];
};