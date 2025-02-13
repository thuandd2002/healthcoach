<!-- START BLOCK : default -->
<script src="js/jquery.form.min.js" /></script>
<script src="editor/ckeditor.js"></script>
<script src="editor/adapters/jquery.js"></script>
<form action="index4.php?page=service_item&id={id}&code={code}&id_item={id_item}" method="post" id="addnewserviceform">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered tabletdnone">
      <tr>
        <td><strong>Dịch vụ</strong></td>
        <td>{servicename}&nbsp;</td>
      </tr>
      <tr>
        <td width="150"><strong>Tiêu đề</strong></td>
        <td><input type="text" style="width:90%" name="name" id="name" value="{name}" /></td>
      </tr>
      <tr>
        <td><strong>Ảnh</strong></td>
        <td>
        	<div id="pic_avatar1">{image}</div>
            <div class="input-append">
			  <input name="imageurl" type="text" id="imageurl1"  style="height:20px; width:290px;" value="{imageurl}"/>
			  <button class="btn" type="button" id="browserimage1">Chọn ảnh trên server</button>
			</div>
        </td>
      </tr>
      <tr>
        <td colspan="2"><strong>Nội dung</strong></td>
      </tr>
      <tr>
        <td colspan="2"><div style="width:95%">
        <textarea name="contentservice" id="contentservice" cols="" rows="">{content}</textarea>
        
    <script>    
		  $( document ).ready( function() {
				$( 'textarea#contentservice' ).ckeditor( {
				toolbar: [
					{ name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', '-', 'Save'] },
				{ name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
				{ name: 'editing', groups: [ 'find' ], items: [ 'Find', 'Replace' ] },
				
				
				{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
				{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
				{ name: 'links', items: [ 'Link', 'Unlink' ] },
				{ name: 'insert', items: [ 'Image', 'Table',  'SpecialChar', 'Youtube' ] },
				'/',
				{ name: 'styles', items: [ 'Format', 'Font', 'FontSize', 'lineheight' ] },
				{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
				{ name: 'tools', items: [ 'Maximize'] },
				{ name: 'others', items: [ '-', 'VideoDetector' ] },
				
				]
			});
		} );
    </script>    
        </div></td>
      </tr>
      <tr>
        <td><strong>Kích hoạt</strong></td>
        <td><input type="checkbox" name="active" id="active" value="1" {active} /></td>
      </tr>
     
      <tr>
        <td><strong>Thứ tự</strong></td>
        <td><input type="text" name="thu_tu" id="thu_tu" class="txtorder" value="{thu_tu}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><a href="#" class="btn btn-primary" onclick="$('#addnewserviceform').submit(); return false">Cập nhật</a></td>
      </tr>
    </table>

</form>
<script>
	$(function(){
		var options = { 
			target:'#contenttext',  
			success:function(){
				$( "#loaditemservice" ).load( "index4.php?page=service_item&id={id}&code=load", function( response, status, xhr ) {
				  if ( status == "error" ) {}
				});
			}
		}; 
		$('#addnewserviceform').ajaxForm(options); 	
	});
	$('#browserimage1').click(function() {
		$('#popupelfinder').append('<div id="openelfinder"></div>');
		 openelfinder('openelfinder','imageurl1','pic_avatar1');
	});
</script>
<!-- END BLOCK : default -->
<!-- START BLOCK : load -->
<div style="padding:10px; background:#FFF;width:600px; max-width:100%">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><strong>Tên</strong></td>
    <td width="40" style="text-align:center"><strong>Sửa</strong></td>
    <td width="40" style="text-align:center"><strong>Xóa</strong></td>
  </tr>
  <!-- START BLOCK : lstserviceitem -->
  <tr>
    <td>{itemname}</td>
    <td style="text-align:center"><a href="{editlink}" class="linkajax"><i class="icon-wrench"></i></a></td>
    <td style="text-align:center"><a href="{deletelink}" class="linkajaxdel"><i class="icon-trash"></i></a></td>
  </tr>
  <!-- END BLOCK : lstserviceitem -->
</table>
</div>
<script>
	$(function(){
		$('.linkajaxdel').click(function(){
			if(confirm('Bạn có thật sự muốn xóa không ?')){
				var obj = $(this).parent().parent();
				$.ajax({
				  url: $(this).attr('href'),
				  cache: false
				}).done(function( html ) {
					obj.remove();
				});
			}else{
				return false;
			}
			return false;
		});
		$('.linkajax').click(function(){
			$('.box-add-service').stop().fadeIn();
			$( "#contenttext" ).load( $(this).attr('href'), function( response, status, xhr ) {
			  	if ( status == "error" ) {}
			});
			return false;
		});
	});
</script>
<!-- END BLOCK : load -->