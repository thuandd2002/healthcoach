
( function() {
    CKEDITOR.plugins.add( 'mediaembed',
    {
       // icons: 'icon/mediaembed.png', // %REMOVE_LINE_CORE%
		icons:'mediaembed',
        hidpi: true, // %REMOVE_LINE_CORE%
        init: function( editor )
        {
           var me = this;
           CKEDITOR.dialog.add( 'MediaEmbedDialog', function (instance)
           {
              return {
                 title : 'Chèn mã nhúng',
                 minWidth : 550,
                 minHeight : 200,
                 contents :
                       [
                          {
                             id : 'iframe',
                             expand : true,
                             elements :[{
                                id : 'embedArea',
                                type : 'textarea',
                                label : 'Paste Embed Code Here',
                                'autofocus':'autofocus',
                                setup: function(element){
                                },
                                commit: function(element){
                                }
                              }]
                          }
                       ],
                  onOk: function() {
                        var div = instance.document.createElement('div');
                        div.setHtml(this.getContentElement('iframe', 'embedArea').getValue());
                        instance.insertElement(div);
                  }
              };
           } );

            editor.addCommand( 'MediaEmbed', new CKEDITOR.dialogCommand( 'MediaEmbedDialog',

                { allowedContent: 'iframe[*]' }

            ) );

            editor.ui.addButton( 'MediaEmbed',
            {

                label: 'Chèn mã nhúng',
                command: 'MediaEmbed',
                toolbar: 'mediaembed',
				icon: this.path + 'icons/mediaembed.png'
            } );
        }
    } );
} )();

