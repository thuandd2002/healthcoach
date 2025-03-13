
<div class="c5"></div>
<div class="breadLine">
    <ul class="breadcrumb">
        <li><a href="?"><i class="icon-home"></i></a></li>
        Nhập lịch chiếu từ excel
    </ul>
</div>
<div class="c20"></div>

<div class="wraper-content">

	<!--
    <form action="" method="get" id="exportform" enctype="multipart/form-data">

        <input type="hidden" name="page" value="import_lichchieu"/>
        <input type="hidden" name="s" value="0"/>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered tabletdnone">
            <tr>
                <th colspan="2"><i class="icon-pencil icon-white"></i>&nbsp;Xuất danh sách</th>
            </tr>
            
            <tr>
                <td><strong>Xuất danh sách </strong></td>
                <td>
                    
                    <div>Ngày xuất: <input name="tungay"  autocomplete="off" id="tungay"  type="text" style="width:200px;" /></div>
                    
                </td>
            </tr>
            
            <tr>
                <td> </td>
                <td>
                    <a id="export_link" href="/manager/index4.php?page=export_lichchieu" target="_blank">Xuất danh sách..</a>
                </td>
            </tr>
            <script>
                $("#tungay").change(function(){
                    $("#export_link").attr("href",'/manager/index4.php?page=export_lichchieu&ngay=' + $(this).val());
                });
                
            </script>
            
        </table>
    </form>
    <div class="divider1"><span></span></div>
	
	-->

    <form action="" method="post" id="inputform" onSubmit="return check_null();" enctype="multipart/form-data">

        <input type="hidden" name="page" value="import_lichchieu"/>
        <input type="hidden" name="s" value="1"/>


        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered tabletdnone">
            <tr>
                <th colspan="2"><i class="icon-pencil icon-white"></i>&nbsp;Nhập danh sách</th>
            </tr>
            

            <tr>
                <td><strong>File Excel</strong></td>
                <td>
                    <div class="input-append">
                        <input type="text" id="fileurl" name="filelich"  style="height:20px; width:290px;" value="{fileurl}"/>
                        <button class="btn" type="button" id="browserfile">Tải file trên server</button>
                    </div></td>

            </tr>
            <tr>
                <td>Lưu ý</td>
                <td>
                    <em>File phải đặt vào thư mục <b>files</b>. Hỗ trợ định dạng exel 2010 (xlsx) </em>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td><a class="btn btn-primary" onclick="$('#inputform').submit();
                        return false"><i class="icon-ok-circle icon-white"></i>&nbsp;Cập nhật</a><div onclick="window.location = '?page={par_page}&pid={pid}'" class="btn btn-inverse" style="margin-left:10px;"><i class="icon-remove icon-white"></i>&nbsp;Đóng</div></td>
            </tr>


        </table>
    </form>




</div>

<script>
$(function() {
    $('#tungay').datepicker({
              duration: '',
              showTime: false,
              constrainInput: false,
              dateFormat: 'dd/mm/yy',
              changeYear: true,
              changeMonth: true,
              showOtherMonths: true,
              time24h: false,
              currentText: 'Today'							
  });	
});
	
</script>