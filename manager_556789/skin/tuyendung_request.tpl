
<div class="c5"></div>
<div class="breadLine">
  <ul class="breadcrumb">
    <li><a href="?"><i class="icon-home"></i></a></li>
    <a href="?page=tuyendung_request">Danh sách ứng viên (tuyển dụng)</a>
  </ul>
</div>
<div class="c20"></div>
<div class="wraper-content"> 
  
  <!-- START BLOCK : msg -->
  
  <div>{msg}</div>
  
  <!-- END BLOCK : msg --> 
  
  <!-- START BLOCK : view -->
  
  <form action="{action}" method="post" id="inputform" onSubmit="return check_null();" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered tabletdnone">
      <tr>
        <th colspan="2">{subject}</th>
      </tr>
      <tr>
        <td width="150" valign="top"><strong>Ngày</strong></td>
        <td>{createdate}</td>
      </tr>
      <tr>
        <td width="150" valign="top"><strong>Họ tên</strong></td>
        <td>{name}</td>
      </tr>
      <tr>
        <td width="150" valign="top"><strong>Địa chỉ</strong></td>
        <td>{address}</td>
      </tr>
      <tr>
        <td width="150" valign="top"><strong>Điện thoại</strong></td>
        <td>{phone}</td>
      </tr>
      <tr>
        <td width="150" valign="top"><strong>Email</strong></td>
        <td>{email}</td>
      </tr>
      <tr>
        <td width="150" valign="top"><strong>Nội dung</strong></td>
        <td>{message}</td>
      </tr>
      <tr>
        <td width="150" valign="top"><strong>File đính kèm</strong></td>
        <td><a href="{file}" target="_blank">{file}</a></td>
      </tr>
      <tr>
        <td colspan="2" valign="top">{content}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><div onClick="window.location='?page=tuyendung_request'" class="btn btn-inverse" style="margin-left:10px;"><i class="icon-remove icon-white"></i>&nbsp;Đóng</div></td>
      </tr>
    </table>
  </form>
  <div class="divider1"><span></span></div>
  
  <!-- END BLOCK : view --> 
  
  <!-- START BLOCK : showList -->
  
  <form action="{action}" method="post" id="list_form">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped table-hover">
      <tr>
        <th colspan="3"> <div style="float:left; white-space:nowrap"><i class="icon-list-alt"></i>&nbsp;Danh sách liên hệ</div>
        </th>
      </tr>
      <tr class="title">
        <td>Tiêu đề</td>
        <td width="120" align="center" style="text-align:center">Ngày</td>
        <td width="30" align="center">Xóa</td>
      </tr>
      
      <!-- START BLOCK : list -->
      
      <tr>
        <td><a href="{link}">[{name}] - {subject} </a></td>
        <td style="text-align:center">{createdate}</td>
        <td><a href="{linkdel}" class="trash_item btn padingleftright4"><i class="icon-trash"></i></a></td>
      </tr>
      
      <!-- END BLOCK : list -->
      
      <tr class="search_box nonehover">
        <td colspan="3"> {pages} </td>
      </tr>
    </table>
  </form>
  
  <!-- END BLOCK : showList -->
  
  <div class="divider1"><span></span></div>
</div>
<script>

	$('.trash_item').click(function(){

		if(confirm('Bạn có thật sự muốn xóa không ?')){

			window.location=$(this).attr('href');

			return false;

		}

		return false;

	});

</script> 
