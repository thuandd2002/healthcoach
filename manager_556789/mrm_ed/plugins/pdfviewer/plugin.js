
( function() {
    CKEDITOR.plugins.add( 'pdfviewer',
    {
       // icons: 'icon/mediaembed.png', // %REMOVE_LINE_CORE%
		icons:'pdfviewer',
        hidpi: true, // %REMOVE_LINE_CORE%
        init: function( editor )
        {
           var me = this;
           CKEDITOR.dialog.add( 'PdfViewerDialog', function (instance)
           {
              return {
                 title : 'File viewer',
                 minWidth : 550,
                 minHeight : 100,
                 contents :
                       [{
                             id : 'iframe',
                             expand : true,
                             elements :[
								{
									id : 'width',
									style:'width:140px;',	
									type : 'text',
									label : 'Chiều rộng',
									'autofocus':'autofocus',
                               
								},{
									id : 'height',
									style:'width:140px;',	
									type : 'text',
									label : 'Chiều cao',
									'autofocus':'autofocus',
									   
								 },{
									id : 'content',
									style:'width:500px;',	
									type : 'text',
									label : 'Đường dẫn file',
									'autofocus':'autofocus',
									   
								 },{
									type:'button',
									id:'browse',
									filebrowser:'iframe:content',
									
									hidden:true,
									style:'display:inline-block;margin-top:5px;',
									label:editor.lang.common.browseServer
								}
							]
				}
			],
            onOk: function() {
						var host = 'https://' + window.location.hostname;
                        var div = instance.document.createElement('div');
						var viewerWidth = this.getContentElement('iframe', 'width').getValue();
						var viewerHeight = this.getContentElement('iframe', 'height').getValue();
						var viewerFile = this.getContentElement('iframe', 'content').getValue();
						if(viewerWidth == '' || viewerWidth == 0){
							viewerWidth = '100%'
						}
						
						if(viewerHeight == '' || viewerHeight == 0){
							viewerHeight = '700';
						}
						
						var codehtml = '<iframe src="http://docs.google.com/viewer?url=' + host + viewerFile + '&embedded=true" width="' + viewerWidth + '" height="' + viewerHeight + '" style="border: none;"></iframe>'
						
                       // div.setHtml(this.getContentElement('iframe', 'content').getValue());
					    div.setHtml(codehtml);
                        instance.insertElement(div);
                  }
              };
           } );

            editor.addCommand( 'pdfviewer', new CKEDITOR.dialogCommand( 'PdfViewerDialog',
                { allowedContent: 'iframe[*]' }
            ) );

            editor.ui.addButton( 'pdfviewer',
            {
				
                label: 'File viewer',
                command: 'pdfviewer',
                toolbar: 'pdfviewer',
				icon: this.path + 'icons/pdfviewer.png'
            } );
        }
    } );
} )();
