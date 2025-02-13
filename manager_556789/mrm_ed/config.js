CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	///config.extraPlugins = 'mediaembed,insertvideo,layoutmanager';
	config.toolbarCanCollapse = true;
	config.allowedContent = true;
	config.contentsCss = ['/css/grid.css'];
	config.enterMode = CKEDITOR.ENTER_BR;
	config.extraPlugins = 'videodetector,youtube,table,tabletools,mediaembed,lineheight,quicktable,pastefromexcel,pdfviewer,wordcount,browsefile';
	
	
};
