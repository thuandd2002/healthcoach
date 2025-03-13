
( function() {
    CKEDITOR.plugins.add('Hello',
    {
        init: function (editor) {
            var pluginName = 'Hello';
            editor.ui.addButton('Hello',
                {
                    label: 'Hello',
                    command: 'OpenWindow1',
                    icon: CKEDITOR.plugins.getPath('Hello') + 'bimage.png'
                });
            var cmd = editor.addCommand('OpenWindow1', { exec: openelfinderCk });
        }
    });
    
} )();
function showMyDialog1(e) {
   e.insertHtml(' Hello ');
}

function openelfinderCk(e){
	$('#popupelfinder').append('<div id="openelfinder"></div>');
	$('#openelfinder').dialogelfinder({
		 url : 'elFinder/php/connector.php',
		 title          : 'My files', 
		 width          : 850,        
		 autoOpen       : true,      
		 destroyOnClose : true        ,
		 getFileCallback : function(files, fm) {
			e.insertHtml('<img src="'+ files.url +'" />');
		},			
		commandsOptions : {
			getfile : {
				oncomplete : 'close',
				folders : false
			}
		}
	 })
}