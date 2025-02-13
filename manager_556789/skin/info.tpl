
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
                <th colspan="2"><i class="icon-pencil icon-white"></i>&nbsp;Form cập nhật dữ liệu</th>
            </tr>
            <tr>
                <td width="150"><strong>Tiêu đề</strong></td>
                <td><input type="text" name="name" class="txtform100 notNull" value="{name}" data-alert="Bạn cần nhập vào tiêu đề {item}"/></td>
            </tr>
            <tr>
                <td><strong>Title</strong></td>
                <td><input type="text" name="title" id="title" class="txtform100" value="{title}" /></td>
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
                <td><strong>Ảnh</strong></td>
                <td>
                    <div id="pic_avatar">{image}</div>

                    <div class="c10"></div>

                    <div class="input-append">
                        <input name="imageurl" type="text" id="imageurl"  style="height:20px; width:290px;" value="{imageurl}"/>
                        <button class="btn" type="button" id="browserimage">Chọn ảnh trên server</button>
                    </div>


                </td>
            </tr>


            <tr>
                <td><strong>Catalogue</strong></td>
                <td><div id="pic_avatar2">{image2}</div>
                    <div class="c10"></div>
                    <div class="input-append">
                        <input name="fileurl" type="text" id="fileurl"  style="height:20px; width:290px;" value="{fileurl}"/>
                        <button class="btn" type="button" id="browserfile">Chọn/Tải file trên server</button>
                    </div>
                </td>
            </tr>

            <tr>
                <td><strong>Url Video</strong></td>
                <td>
                    <div class="input-append">
                        <input name="videourl" type="text" id="videourl"  style="height:20px; width:290px;" value="{videourl}"/>
                        <button class="btn" type="button" id="videobrowse">Chọn/Tải video trên server</button>
                    </div>
                    <div style="font-size:12px; color:#666; font-style:italic">(Có thể dán link youtube)</div>
                </td>

            </tr>            

            <tr>
                <td valign="top"><strong>Mô tả</strong></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2" valign="top">{intro}</td>
            </tr>
            <tr>
                <td valign="top"><strong>Chi tiết</strong></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2">
                    {content}
                </td>
            </tr>


            <tr>
                <td><strong>Ảnh Slide</strong></td>
                <td><button class="btn btn-info" type="button" id="multi_browser_image">Chọn ảnh trên server</button></td>
            </tr>
            <tr>
                <td colspan="2" id="show_collection_cell">
                    <!-- START BLOCK : collection_cell -->
                    <div class="collection_cell">
                        <div class="image"><img src="{image}"></div>
                        <input name="image_name[]" type="text" class="txtname name_image" placeholder="Tiêu đề..." value="{name}">
                        <textarea name="image_desc[]" cols="" class="txtname" style="height:60px;resize:none; " rows="" placeholder="Mô tả...">{image_desc}</textarea>
                        <div style="padding-left:10px;"><span class="labelorder">Thứ tự</span>
                            <input name="image_thu_tu[]" type="text" class="txtorder image_thu_tu" placeholder="Thứ tự..." value="{thu_tu}">
                            <a class="btn btn-mini" style="margin-top:2px; margin-left:10px;" onClick="delete_multi_image($(this));
                                    return false"><i class="icon-trash"></i>&nbsp;Xóa</a>
                            <div style="c"></div>
                        </div>
                        <input type="hidden" name="image_path[]" value="{real_image}" class="collection_image">
                    </div>
                    <!-- END BLOCK : collection_cell -->
                </td>
            </tr>

            <tr>
                <td><strong>Description</strong></td>
                <td><textarea name="description" class="txtareakeyword-description">{description}</textarea></td>
            </tr>
            <tr>
                <td><strong>Keywords</strong></td>
                <td><textarea name="keywords" class="txtareakeyword-description">{keywords}</textarea></td>
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
                <th colspan="7">
                    <div style="float:left"><i class="icon-list-alt icon-white"></i>&nbsp;Danh sách {item}</div>
                    <a href="?page={par_page}&code=showAddNew&pid={pid}" style="float:right"><div class="btn  btn-mini"><i class="icon-plus-sign"></i>&nbsp;Thêm mới {item}</div></a>
                </th>
            </tr>
            <tr class="search_box nonehover">
                <td colspan="7">
                    <div class="form-search" style="margin:0px;">
                        <div class="input-append">
                            <input type="text" class=" search-query" id="keyword" name="keyword" style="height:20px;" placeholder="Từ khóa cần tìm...">
                            <button type="submit" class="btn" id="btnSearch">Tìm</button>
                        </div>
                        {parentid}
                    </div>
                </td>
            </tr>
            <tr class="title">
                <td width="16"><input type="checkbox" name="checkbox" id="checkbox" class="cat_check" data-check="cat_check" onclick="check_all(this)" /></td>
                <td>Tiêu đề</td>
                <td width="130" align="center" class="center">Danh mục</td>
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
                    <div class="info_item"><strong>Nhóm phụ:</strong> [{groupcat}]</div>
                    <div class="info_item"><strong>Url:</strong> <a href="{url}" target="_blank">{url}</a></div>
                </td>
                <td align="center" class="center" valign="middle"><a href="{linkcat}">{categoryname}</a></td>
                <td class="center"><input type="checkbox" name="active" value="1" data-active="{id}" {active} class="changeactive"/></td>
                <td><input type="text" name="thu_tu[{id}]" class="txtorder" value="{thu_tu}"/></td>
                <td><a href="{link_edit}" class="btn padingleftright4"><i class="icon-wrench"></i></a></td>
                <td><a href="{link_delete}" class="trash_item btn padingleftright4"><i class="icon-trash"></i></a></td>
            </tr>
            <!-- END BLOCK : list -->

            <tr class="title">
                <td width="16"><input type="checkbox" name="checkbox" id="checkbox" class="cat_check" onclick="check_all($(this))"/></td>
                <td><a href="?page={par_page}&code=deletemulti" id="delmultiitem">Xóa tất cả mục đã chọn</a></td>
                <td colspan="3"><div class="btn btn-inverse" onclick="$('#list_form').submit();" style="margin-left:30px">Cập nhật</div></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="search_box nonehover">
                <td colspan="7">
                    {pages}
                </td>
            </tr>
        </table>
    </form>
    <!-- END BLOCK : showList -->
    <div class="divider1"><span></span></div>
    <div id="divremovea" style="display:none"></div>
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
	
	function delete_multi_image(obj) {
        if (confirm("Bạn muốn xóa ảnh này?")) {
            obj.parent().parent().remove();
        } else {
            return false;
        }
    }


// block ui

</script>
