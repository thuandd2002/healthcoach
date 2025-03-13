
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
                <td width="150"><strong>Khoá học</strong></td>
                <td><input type="text" name="service_name" class="txtform100 notNull" readonly="" value="{service_name}"/></td>
            </tr>

            <tr>
                <td width="150"><strong>Tên buổi học</strong></td>
                <td><input type="text" name="name" class="txtform100 notNull" value="{name}" data-alert="Bạn cần nhập vào tiêu đề {item}"/></td>
            </tr>

            <tr>
                <td><strong>Nhóm cha</strong></td>
                <td>{parentid}</td>
            </tr>
            <tr>
                <td><strong>Nhóm phụ</strong></td>
                <td>
                    <select name="groupcat[]" multiple="multiple" style="width:300px; height:200px;">
                        {parentid1}
                    </select>
                </td>
            </tr>
            <tr>
                <td><strong>Ảnh đại diện</strong></td>
                <td>
                    <div id="pic_avatar">{image}</div>

                    <div class="c5"></div>
                    <div class="input-append">
                        <input name="imageurl" type="text" id="imageurl"  style="height:20px; width:290px;" value="{imageurl}"/>
                        <button class="btn" type="button" id="browserimage">Chọn ảnh trên server</button>
                    </div>


                </td>
            </tr>


            <tr>
                <td valign="top"><strong>Mô tả tổng quan</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" valign="top">{intro}</td>
            </tr>

            <tr>
                <td valign="top"><strong>Chi tiết</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <div>{content}</div>
                </td>
            </tr>

            <tr>
                <td><strong>Ngày đăng </strong></td>
                <td style="position:relative"><input type="text" name="ngay_dang" id="ngay_dang" style="width:100px;" value="{ngay_dang}" /></td>
            </tr>
            <tr>
                <td><strong>Url</strong></td>
                <td style="position:relative">
                    <div class="input-prepend">
                        <span class="add-on"><input name="autourl" id="autourl" type="checkbox" value="1" {autourl}/></span>
                        <input class="span2" id="url" name="url" type="text" style="width:572px;" value="{url}">
                    </div>
                    <div style="font-size:11px; color:#666; font-style:italic">Checked tự động tạo url/Uncheck lấy url trên ô text</div>
                </td>
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
                <td><a class="btn btn-primary" onclick="$('#inputform').submit();
                        return false"><i class="icon-ok-circle icon-white"></i>&nbsp;Cập nhật</a><div onclick="window.location = '?page={par_page}&pid={pid}'" class="btn btn-inverse" style="margin-left:10px;"><i class="icon-remove icon-white"></i>&nbsp;Đóng</div></td>
            </tr>
        </table>
    </form>
    <div class="divider1"><span></span></div>
    <script type="text/javascript">
        $(function () {
            $('#ngay_dang').datepicker({
                duration: '',
                showTime: true,
                constrainInput: false,
                dateFormat: 'dd/mm/yy',
                changeYear: true,
                changeMonth: true,
                showOtherMonths: true,
                time24h: true,
                currentText: 'Today'
            });
        });

    </script>

    <!-- END BLOCK : AddNew -->

    <!-- START BLOCK : showList -->
    <form action="{action}" method="post" id="list_form">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped table-hover">

            <tr>
                <th colspan="6">
                    <div style="float:left"><i class="icon-list-alt icon-white"></i>&nbsp;Danh sách {item}</div>
                    <a href="?page={par_page}&code=showAddNew&pid={pid}" style="float:right"><div class="btn  btn-mini"><i class="icon-plus-sign"></i>&nbsp;Thêm mới {item}</div></a>
                </th>
            </tr>
            <tr class="search_box nonehover">
                <td colspan="6">
                    <strong style="font-size: 16px;"> {service_name} </strong>
                </td>
            </tr>
            <tr class="title">
                <td width="16"><input type="checkbox" name="checkbox" id="checkbox" class="cat_check" data-check="cat_check" onclick="check_all(this)" /></td>
                <td>Tiêu đề</td>
                <td width="60" align="center" class="center">Kích hoạt</td>
                <td width="60" align="center" class="center">Thứ tự</td>
                <td width="30" align="center">Sửa</td>
                <td width="30" align="center">Xóa</td>
            </tr>
            <!-- START BLOCK : list -->
            <tr>
                <td width="16"><input type="checkbox" name="delmulti[{id}]" id="checkbox" class="cat_check" value="{id}" /></td>
                <td>
                    <a href="{link_edit}">{image}</a><div class="list_item_name"><a href="{link_edit}">{name}</a></div>
                    <div class="info_item"><strong>Người đăng:</strong> {user_name} [{username}] - <strong>Ngày:</strong> {createdate}</div>
                    <div class="info_item"><strong>Url:</strong> <a href="{url}" target="_blank">{url}</a></div>
                    <div class="c10"></div>

                </td>
                <td class="center"><input type="checkbox" name="active" value="1" data-active="{id}" {active} class="changeactive"/></td>
                <td><input type="text" name="thu_tu[{id}]" class="txtorder" value="{thu_tu}"/></td>
                <td><a href="{link_edit}" class="btn padingleftright4"><i class="icon-wrench"></i></a></td>
                <td><a href="{link_delete}" class="trash_item btn padingleftright4"><i class="icon-trash"></i></a></td>
            </tr>
            <!-- END BLOCK : list -->

            <tr class="title">
                <td width="16"><input type="checkbox" name="checkbox" id="checkbox" class="cat_check" onclick="check_all($(this))"/></td>
                <td><a href="?page={par_page}&code=deletemulti" id="delmultiitem">Xóa tất cả mục đã chọn</a></td>
                <td colspan="2"><div class="btn btn-inverse" onclick="$('#list_form').submit();" style="margin-left:30px">Cập nhật</div></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="search_box nonehover">
                <td colspan="6">
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
    $(function () {
        /// delete image
        $('#trash_image').click(function () {
            $('#trash_image').fadeTo('fast', 0.3)
            show_mes('Đang thực hiện !');
            $("#divremovea").load($('#trash_image').attr('href'), function (response, status, xhr) {
                if (status == "error") {
                    var msg = "Sorry but there was an error: ";
                    alert(msg + xhr.status + " " + xhr.statusText);
                }
                if (status == 'success') {
                    $('#avatar').remove();
                    $('#trash_image').remove();
                    show_mes('Đã xóa ảnh xong !');
                }
            });
            return false;
        });

        // delete record
        $('.trash_item').click(function () {
            if (confirm('Bạn có thật sự muốn xóa không ?')) {
                obj = $(this);
                show_mes('Đang thực hiện !');
                obj.parent().parent().fadeTo('fast', 0.3);
                $("#divremovea").load('index4.php' + obj.attr('href'), function (response, status, xhr) {
                    if (status == "error") {
                        var msg = "Sorry but there was an error: ";
                        alert(msg + xhr.status + " " + xhr.statusText);
                    }
                    if (status == 'success') {
                        obj.parent().parent().remove();
                        show_mes('Đã xóa xong');
                    }
                });
                return false;
            } else {
                return false;
                show_mes('Đã hủy lệnh !');
            }

        });

        $('#delmultiitem').click(function () {
            if (confirm('Bạn có thật sự muốn xóa những mục đã chọn không ?')) {
                $('#list_form').attr('action', $(this).attr('href'));
                $('#list_form').submit();
            } else {
                return false;
            }
            return false;
        })
        // go to category
        $('#parentid').change(function () {
            window.location = '?page={par_page}&pid=' + $(this).val();
        });

        // change active
        $('.changeactive').change(function () {
            show_mes('Đang thực hiện !');
            var obj = $(this);
            var active = 0;
            var mes = 'Đã bỏ kích hoạt !';
            if (obj.is(":checked")) {
                active = 1
                mes = "Đã kích hoạt !";
            }
            obj.fadeTo('fast', 0.3)
            $("#divremovea").load('index4.php?page=action_ajax&code=change_active&table={table}&id_item={id_item}&id=' + obj.attr('data-active') + '&active=' + active, function (response, status, xhr) {
                if (status == "error") {
                    var msg = "Sorry but there was an error: ";
                    alert(msg + xhr.status + " " + xhr.statusText);
                }
                if (status == 'success') {
                    show_mes(mes);
                    obj.fadeTo('fast', 1);
                }
            });
        });
    });


    $(function () {
        var xxx = 1;
        $('#multi_browser_image').click(function () {
            xxx++;
            $('#popupelfinder').append('<div id="openelfinder"></div>');
            showItemElfinderMulti('openelfinder', xxx);
        });
    });



    $(function () {
        $('#btnSearch').click(function () {
            $('#list_form').attr('action', '?page={par_page}&pid={pid}');
            $('#list_form').submit();
        });
    });
</script>