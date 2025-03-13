
<div class="c5"></div>
<div class="breadLine">
    <ul class="breadcrumb">
        <li><a href="?"><i class="icon-home"></i></a></li>
        {pathpage}
    </ul>
</div>
<div class="c20"></div>
  
<div class="wraper-content">
<!-- START BLOCK : msg -->
<div>{msg}</div>
<!-- END BLOCK : msg --> 
<!-- START BLOCK : AddNew -->
<form action="{action}" method="post" id="inputform" onSubmit="return check_null();" enctype="multipart/form-data">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered tabletdnone">
      <tr>
        <th colspan="2"><i class="icon-pencil icon-white"></i>&nbsp;Thêm/Sửa</th>
      </tr>
      <tr>
        <td width="150"><strong>Tiêu đề</strong></td>
        <td>
            <input type="text" name="name" class="txtform100 notNull" value="{name}" data-alert="Bạn cần nhập vào tiêu đề {item}"/>
            
        </td>
      </tr>

      <tr>
        <td>&nbsp;</td>
        <td>
            
            <a class="btn btn-primary" onclick="$('#inputform').submit(); return false">
                <i class="icon-ok-circle icon-white"></i>&nbsp;Cập nhật
            </a>

            <div onclick="window.location='?page={par_page}&pid={pid}'" class="btn btn-inverse" style="margin-left:10px;">
                <i class="icon-remove icon-white"></i>&nbsp;Đóng
            </div>
        </td>
      </tr>
      
      
    </table>
</form>
<div class="divider1"><span></span></div>
<!-- END BLOCK : AddNew -->

<!-- START BLOCK : showStreetLoc -->
<form action="{action}" method="post" id="locform" onSubmit="return check_null();" enctype="multipart/form-data">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered tabletdnone">
      <tr>
        <th colspan="2"><i class="icon-pencil icon-white"></i>&nbsp;Thêm/Sửa</th>
      </tr>
      <tr>
        <td width="150"><strong>Tiêu đề</strong></td>
        <td>
            <input type="text" name="name" class="txtform100 notNull" value="{name}" disabled />
            <input type="hidden" name="id_street" value="{id_street}">
        </td>
      </tr>


      <tr>
        <td><strong>Tỉnh thành:</strong></td>
        <td>
	        <select id="vn_province" name="vn_province">
        	{vn_province}
            </select>
        </td>
      </tr>


      <tr>
        <td><strong>Quận Huyện</strong></td>
        <td>
            <select id="vn_district" name="vn_district">
                <option value="0">Đang tải..</option>
            </select>
        </td>
      </tr>
      
      <script>
      $(function()
        {
            $('#vn_district').load('index4.php?page=ajax_provider&code=getDistrictCombo&id=' + $('#vn_province').val() + '&selectedid={districtid}');
            $('#vn_province').change(function(){
                $('#vn_district').html('<option value="0">Đang tải..</option>');
                $('#vn_district').load('index4.php?page=ajax_provider&code=getDistrictCombo&id=' + $('#vn_province').val());
            });
        });    
        
      </script>

     
      <tr>
        <td>&nbsp;</td>
        <td>
            
            <a class="btn btn-primary" onclick="$('#locform').submit(); return false">
                <i class="icon-ok-circle icon-white"></i>&nbsp;Thêm vào
            </a>
            
            
            <div onclick="window.location='?page={par_page}&pid={pid}'" class="btn btn-inverse" style="margin-left:10px;">
                <i class="icon-remove icon-white"></i>&nbsp;Đóng
            </div>
        </td>
      </tr>
      
      
    </table>
</form>
                
<div class="divider1"><span></span></div>
<!-- END BLOCK : showStreetLoc -->

<!-- START BLOCK : showListLocation -->

<table style="width: 500px;" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped table-hover">
							 
  <tr>
    <th colspan="4">
        <div style="float:left"><i class="icon-list-alt icon-white"></i>&nbsp;Danh sách tỉnh/tp</div>
    </th>
  </tr>

  <tr class="title">
    <td width="16"><input type="checkbox" name="checkbox" id="checkbox" class="cat_check" data-check="cat_check" onclick="check_all(this)" /></td>
    <td width="150" align="center" class="center">Tỉnh/ thành phố</td>
    <td width="150" align="center" class="center">Quận Huyện</td>
    
    <td width="30" align="center">Xóa</td>
  </tr>
  <!-- START BLOCK : listLocation -->
  <tr>
    <td width="16"><input type="checkbox" name="delmulti[{id}]" id="checkbox" class="cat_check" value="{id}" /></td>
    <td align="left" class="center" valign="middle">{pname}</td>
    <td align="left">{dname}</td>
    <td><a href="{link_delete}" class="trash_item btn padingleftright4"><i class="icon-trash"></i></a></td>
  </tr>
  <!-- END BLOCK : listLocation -->

  </table>

<!-- END BLOCK : showListLocation -->



<!-- START BLOCK : showList -->

  


<form action="{action}" method="post" id="list_form">
  <div style="line-height: 40px;">
        Tên đường phố : 
        <input type="text" name="street_name" value="{street_name}" />  
        <div class="btn" onclick="$('#list_form').submit();" style="margin-left:5px">Tìm kiếm</div>
  </div>
    
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped table-hover">
							 
  <tr>
    <th colspan="6">
        <div style="float:left"><i class="icon-list-alt icon-white"></i>&nbsp;Danh sách {item}</div>
        <a href="?page={par_page}&code=showAddNew&pid={pid}" style="float:right"><div class="btn  btn-mini"><i class="icon-plus-sign"></i>&nbsp;Thêm mới {item}</div></a>
    </th>
  </tr>

  
  <tr class="title">
    <td width="16"><input type="checkbox" name="checkbox" id="checkbox" class="cat_check" data-check="cat_check" onclick="check_all(this)" /></td>
    <td>Tiêu đề</td>
    
    <td width="100" align="center" class="center">Tỉnh/Tp</td>
    <td width="30" align="center">Sửa</td>
    <td width="30" align="center">Xóa</td>
  </tr>
  <!-- START BLOCK : list -->
  <tr>
    <td width="16"><input type="checkbox" name="delmulti[{id}]" id="checkbox" class="cat_check" value="{id}" /></td>
    <td><div class="list_item_name"><a href="{link_edit}">{name}</a></div></td>
    <td><a href="{link_loc}" class="btn"> Cập nhật </a></td>
    <td><a href="{link_edit}" class="btn padingleftright4"><i class="icon-wrench"></i></a></td>
    <td><a href="{link_delete}" class="trash_item btn padingleftright4"><i class="icon-trash"></i></a></td>
  </tr>
  <!-- END BLOCK : list -->

  <tr class="title">
    <td width="16"><input type="checkbox" name="checkbox" id="checkbox" class="cat_check" onclick="check_all($(this))"/></td>
    <td></td>
    <td >
        
    </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr class="search_box nonehover">
    <td colspan="5">
           {pages}
    </td>
  </tr>
</table>
</form>
<!-- END BLOCK : showList -->
<div class="divider1"><span></span></div>
<div id="divremovea" style="display:none">d</div>
</div>

<script>
$(function(){
	
	// delete record
	$('.trash_item').click(function(){
		if(confirm('Bạn có thật sự muốn xóa không ?')){
			obj=$(this);
			show_mes('Đang thực hiện !');
			obj.parent().parent().fadeTo('fast', 0.3);
			$("#divremovea").load('index4.php' + obj.attr('href'), function(response, status, xhr) {
			  if (status == "error") {
				var msg = "Sorry but there was an error: ";
				alert(msg + xhr.status + " " + xhr.statusText);
			  }
			  if(status == 'success'){
				  obj.parent().parent().remove();
				   show_mes('Đã xóa xong');
			  }
			});
			return false;
		}else{
			return false;	
			show_mes('Đã hủy lệnh !');
		}
		
	});
	
	$('#delmultiitem').click(function(){
		if(confirm('Bạn có thật sự muốn xóa những mục đã chọn không ?')){
			$('#list_form').attr('action',$(this).attr('href'));
			$('#list_form').submit();
		}else{
			return false;	
		}
		return false;
	})
	// go to category
	$('#parentid').change(function(){
		window.location='?page={par_page}&pid=' + $(this).val();
	});
	
	// change active
	$('.changeactive').change(function(){
		show_mes('Đang thực hiện !');
		var obj = $(this);
		var active = 0;
		var mes ='Đã bỏ kích hoạt !';
		if(obj.is(":checked")){
			active = 1		
			mes = "Đã kích hoạt !";
		}
		obj.fadeTo('fast',0.3)
		$("#divremovea").load('index4.php?page=action_ajax&code=change_active&table={table}&id_item={id_item}&id=' + obj.attr('data-active') + '&active=' + active, function(response, status, xhr) {
		  if (status == "error") {
			var msg = "Sorry but there was an error: ";
			alert(msg + xhr.status + " " + xhr.statusText);
		  }
		  if(status == 'success'){
			  show_mes(mes);
			  obj.fadeTo('fast',1);
		  }
		});
	});
});


// block ui

// tool editor
function remove_A(){ // remove tag a
	$('#divremovea').html(CKEDITOR.instances.content.getData()) ;
	$("#divremovea a").each(function(){
		 $(this).replaceWith('<span>' + $(this).html() + '</span>');
	});
	CKEDITOR.instances.content.setData ($('#divremovea').html());
	
}
function table_center(){ // table to center
	$('#divremovea').html(CKEDITOR.instances.content.getData()) ;
	$("#divremovea table").each(function(){
		 //$(this).replaceWith('<span>' + $(this).html() + '</span>');
		 $(this).attr('align','center');
	});
	CKEDITOR.instances.content.setData ($('#divremovea').html());
}
function td_text_italic(){ // text italic in td 
	$('#divremovea').html(CKEDITOR.instances.content.getData()) ;
	$("#divremovea table td").each(function(){
		 $(this).css('font-style','italic');
	});
	CKEDITOR.instances.content.setData ($('#divremovea').html());
}
function td_text_center(){ // text center in td
	$('#divremovea').html(CKEDITOR.instances.content.getData()) ;
	$("#divremovea table td").each(function(){
		 $(this).css('text-align','center');
		
	});
	CKEDITOR.instances.content.setData ($('#divremovea').html());
}
function image_center(){ // image to center
	$('#divremovea').html(CKEDITOR.instances.content.getData()) ;
	$("#divremovea img").each(function(){
		if($(this).attr('alt')){
			var curAlt = $(this).attr('alt');		
		}
		if($(this).attr('title')){
			var curTitle = $(this).attr('title');		
		}
		
		$(this).replaceWith('<div align="center"><img src="'+ $(this).attr('src') +'"  /></div>');
		//$(this).css('margin','0 auto');
	});
	CKEDITOR.instances.content.setData ($('#divremovea').html());
}
function remove_P(){ // remove tag p
	$('#divremovea').html(CKEDITOR.instances.content.getData()) ;
	$("#divremovea p").each(function(){
		 $(this).replaceWith('<div>' + $(this).html() + '</div>');
	});
	CKEDITOR.instances.content.setData ($('#divremovea').html());
}
</script>

<script src="js/jQuery-File-Upload/js/vendor/jquery.ui.widget.js"></script>
<script src="js/jQuery-File-Upload/js/jquery.iframe-transport.js"></script>
<script src="js/jQuery-File-Upload/js/jquery.fileupload.js"></script>
<script>
$(function () {
    'use strict';
    var url = window.location.hostname ===  'js/jQuery-File-Upload/server/php/index.php';
    $('#fileupload').fileupload({
        url: 'js/jQuery-File-Upload/server/php/index.php',
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
               // $('<div/>').text(file.name).appendTo('#files');
				$('#load').append('<div class="cell_multi_upload"><img src="image.php?w=130&h=90&src={imagedir}' + file.url + '" /><div class="tool"><a href="#" onclick="insertimage(\'' + file.url + '\');return false">Chèn</a> | <a href="#" class="a_deleteimage" onclick="deleteimage(\'' + file.url + '\',\'' + file.thumbnailUrl + '\',$(this));return false">Xóa</a></div></div>');
			
            });
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .bar').css(
                'width',
                progress + '%'
            ).text(progress + '%');
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
});

function deleteimage(url,urlthumb,obj){
	obj.parent().parent().fadeTo('fast',0.3);
	$("#divremovea").load('index4.php?page=action_ajax&code=deleteimageurl&image=' + url + '&urlthumb=' + urlthumb, function(response, status, xhr) {
	  if (status == "error") {
		var msg = "Sorry but there was an error: ";
		alert(msg + xhr.status + " " + xhr.statusText);
	  }
	  if(status == 'success'){
		  obj.parent().parent().remove();
	  }
	});
}
function insertimage(url){
	CKEDITOR.instances.content.insertHtml( '<img src=' + url + ' />' );
}

$(function (){
	$('#btnSearch').click(function(){
			$('#list_form').attr('action','?page={par_page}&pid={pid}');
			$('#list_form').submit();
	});	
});
</script>