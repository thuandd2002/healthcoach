<script language="javascript" src="js/printThis.js"></script>

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
    <!-- START BLOCK : viewcart -->
	
	
	<form action="" method="get" id="view_form">
	<input type="hidden" name ="page" value="order"/>
	<input type="hidden" name ="id" value="{id_order}"/>
	<input type="hidden" name ="code" value="01"/>
	
    <div id="printdiv">   
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped ">

            <tr class="title">
                <th colspan="5" style="text-transform:uppercase; background-color:#ccc"><div class="dvpad5">Chi tiết đơn hàng</div></th>
            </tr>
            <tr>
                <td  colspan="2" class="dvpad5"><strong>Mã đơn hàng: </strong><strong>ORD{id_order}</strong></td>
                <td  colspan="3" class="dvpad5"><strong>Ngày đặt: </strong><strong>{createdate}</strong></td>
            </tr>
			
			<tr>
                <td  colspan="5" class="dvpad5"><strong>Hình thức thanh toán: </strong> {payment_type}  </td>
            </tr>
			
			<tr>
                <td  colspan="2" class="dvpad5"><strong>TransStatus: </strong> {transStatus}. (<strong>ResponseCode: </strong> {ResponseCode}) </td>
                <td  colspan="3" class="dvpad5"><strong>TransactionNo: </strong> {TransactionNo} - <strong> BankCode: </strong> {BankCode} </td>
            </tr>
			
			
			<tr>
                <td  colspan="2" class="dvpad5"><strong>PayDate: </strong> {PayDate} </td>
                <td  colspan="3" class="dvpad5"><strong>OrderInfo: </strong> {OrderInfo} </td>
            </tr>			
			
			

            <tr>
                <td colspan="5" >  


                    {content}

                </td>
            </tr>




        </table>
    </div>   

    <table width="100%" style="border-collapse:collapse" border="0" cellspacing="5" cellpadding="0" class="table table-bordered table-striped printtable">

        <tr class="title">
            <td colspan="5">

                In đơn hàng: <a href="#" title="In đơn hàng này " id="btnPrint" > <i class="icon-print"></i> </a>

                <div style="float:right">

                    Tình trạng đơn hàng: 
                    <select name="statusupdate" id="statusupdate">
                        <option value="0" {status0}> CHỜ DUYỆT </option>
                        <option value="3" {status3}> Đang xử lý</option>
                        <option value="31" {status31}>Đã gửi</option>
                        <option value="32" {status32}>Đã nhận hàng</option>
                        <option value="33" {status33}>TỪ CHỐI</option>
                        <option value="2" {status2}>ĐÃ HỦY</option>
                        <option value="1" {status1}> THÀNH CÔNG</option>
                    </select>
					
					<input type="submit" class="btn btn-primary" value="Cập nhật"  />

                    <span id="ssssss"></span>

                    <a style="margin-left:40px;" href="javascript:ConfirmDeleteItem({id_order});" title="Xóa đơn hàng này ">
                        Xóa đơn hàng..<i class="icon-trash"></i>
                    </a>
                </div>


            </td>
        </tr>
    </table>
	
	</form>
	
    <style></style>
    <script language="javascript">

        function printIt(printThis)

        {

            win = window.open();

            self.focus();

            win.document.open();

            win.document.write('<' + 'html' + '><' + 'head' + '><' + 'style' + '>');

            win.document.write(' .printtable td,.printtable th { font-family: arial; font-size: 10pt; padding:5px; border:solid 1px #CCC} .printtable{ border-collapse:collapse;} .printtable th { background:#EEE } .dvpad5{ padding:10px 0px} ');

            win.document.write('<' + '/' + 'style' + '><' + '/' + 'head' + '><' + 'body' + '>');

            win.document.write(printThis);

            win.document.write('<' + '/' + 'body' + '><' + '/' + 'html' + '>');

            win.document.close();

            win.print();

            win.close();

        }
        $("#btnPrint").click(function () {
            //Hide all other elements other than printarea.
            printIt($('#printdiv').html());

            return false;
        });

		/*
        $('#statusupdate').change(function () {
            $('#ssssss').load('index4.php?page=action_ajax&code=updateorder&id={id_order}&status=' + $(this).val());
        });
		*/
		
		
    </script>
    <div id="ssssss"></div>
    <div class="divider1"><span></span></div>
    <!-- END BLOCK : viewcart -->
    <!-- START BLOCK : showList -->
    <form action="" method="get" id="list_form">
        <input type="hidden" name="page" value="order" />

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped table-hover">

            <tr class="search_box nonehover">
                <td colspan="8">
                    <div class="form-search" style="margin:0px;">
                        <div class="input-append">

                            <input type="text" name="fd" id="tu_ngay" style="width:120px;" value="{tu_ngay}" />


                        </div>
                        <div class="input-append">
                            <input type="text" name="td" id="den_ngay" style="width:120px;" value="{den_ngay}" />


                        </div>
                        <select name="st">
                            <option value="-1" {status-1}> Toàn bộ đơn hàng </option>
                            <option value="0" {status0}> CHỜ DUYỆT  </option>
                            <option value="3" {status3}> Đang xử lý </option>
                            <option value="31" {status31}>Đã gửi </option>
                            <option value="32" {status32}>Đã nhận hàng </option>
                            <option value="33" {status33}>TỪ CHỐI</option>
                            <option value="2" {status2}>ĐÃ HỦY </option>
                            <option value="1" {status1}> THÀNH CÔNG</option>
                        </select>

                        <button type="submit" class="btn" id="btnSearch">Lọc đơn hàng</button>

                    </div>
                </td>
            </tr>

            <tr>
                <th colspan="6">
                    <div style="float:left"><i class="icon-list-alt icon-white"></i>&nbsp;Danh sách {item}</div>

                </th>
            </tr>

            <tr class="title">
                <td>Tiêu đề</td>
				
				<td width="100" align="center" class="center">Hình thức TT</td>
				<td width="120" align="center" class="center">Trạng thái TT</td>
                <td width="100" align="center" class="center">Ngày đặt</td>
                <td width="80" align="center" class="center">Trạng thái</td>
                <td width="30" align="center">Xóa</td>
            </tr>
            <!-- START BLOCK : list_order -->
            <tr>
                <td>
                    <div class="list_item_name">
                        <a style="font-weight: {normal}" href="{link}">{name} - Order ID: ORD{id_order}  </a>
                        <br/>
                        Total: <strong>{total} </strong> đ 
                    </div>

                </td>
				
				<td class="center">{payment_type}</td>
				<td class="center">{transStatus}</td>
				
				
                <td class="center">{createdate}</td>
                <td class="center">{status}</td>
                <td><a href="{linkdel}" class="trash_item btn padingleftright4"><i class="icon-trash"></i></a></td>
            </tr>
            <!-- END BLOCK : list_order -->
            <tr class="title">
                <td>

                </td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td colspan="2"></td>



            </tr>
            <tr class="search_box nonehover">
                <td colspan="6">
                    {pages_items}
                </td>
            </tr>
        </table>
    </form>
	
	<a href="/manager/index4.php?page=export_order" target="_blank">Xuất danh sách..</a>
	
    <!-- END BLOCK : showList -->
</div>
<script>


    $(function () {
        $('#tu_ngay, #den_ngay').datepicker({
            duration: '',
            showTime: false,
            constrainInput: false,
            dateFormat: 'dd/mm/yy',
            changeYear: true,
            changeMonth: true,
            showOtherMonths: true,
            currentText: 'Today'
        });
    });

    $('.trash_item').click(function () {
        if (confirm('Bạn có thật sự muốn xóa không ?')) {
            window.location = $(this).attr('href');
            return false;
        }
        return false;
    });
</script>
