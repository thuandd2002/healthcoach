
( function() {
    CKEDITOR.plugins.add( 'browsefile',
    {
       // icons: 'icon/mediaembed.png', // %REMOVE_LINE_CORE%
		icons:'browsefile',
        hidpi: true, // %REMOVE_LINE_CORE%
        init: function( editor )
        {
           var me = this;
           CKEDITOR.dialog.add( 'browsefileDialog', function (instance)
           {
                    $('.cke_screen_reader_only').remove();
					$('.cke_dialog_background_cover').remove();
					$('#popupelfinder').append('<div id="openelfinder"></div>');					
					$('#openelfinder').dialogelfinder({
				 url : 'elFinder/php/connector.php',
				
				 width          : 850,        
				 autoOpen       : true,      
				 destroyOnClose : true        ,
				 getFileCallback : function(files, fm) {
					instance.insertHtml('<img src="'+ files.url +'" />');
				},			
				commandsOptions : {
					getfile : {
						oncomplete : 'close',
						folders : false
					}
				}
			 })
           } );
		   
            editor.addCommand( 'browsefile', new CKEDITOR.dialogCommand( 'browsefileDialog',
                { allowedContent: 'iframe[*]' }
            ) );

            editor.ui.addButton( 'browsefile',
            {

                label: 'Chèn ảnh',
                command: 'browsefile',
                toolbar: 'browsefile',
				icon: this.path + 'icons/browsefile.png'
            } );
        }
    } );
} )();


