
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
                <td><strong>Tỉnh thành</strong></td>
                <td>

                    <select name="provinceid" id="tinhthanh" >
                        {provinceList}
                    </select>

                </td>
            </tr>

            <tr>
                <td><strong>Quận huyện</strong></td>
                <td>

                    <select name="districtid" id="quanhuyen">

                    </select>

                    <script>

                        $(function () {

                            $('#tinhthanh').change(function () {
                                if ($('#tinhthanh').val() != 0) {
                                    $('#quanhuyen').html('<option value="0">Đang nạp dữ liệu..</option>');
                                    $('#quanhuyen').load('/index4.php?page=ajaxprovider&code=getDistrict&id=' + $('#tinhthanh').val() + '&selectedid=' + {districtid});
                                } else {
                                    $('#quanhuyen').html('<option value="0">Chọn quận/huyện..</option>');
                                }
                            });

                            $('#quanhuyen').load('/index4.php?page=ajaxprovider&code=getDistrict&id=' + $('#tinhthanh').val() + '&selectedid=' + {districtid});

                        });



                    </script>		


                </td>
            </tr>
            
            <tr>
                <td><strong>Địa chỉ</strong></td>
                <td><input type="text" name="address" class="txtform100" value="{address}" /></td>
            </tr>            

            <tr>
                <td><strong>Phone</strong></td>
                <td><input type="text" name="phone"  class="txtform100" value="{phone}" /></td>
            </tr>
            <tr>
                <td><strong>Email</strong></td>
                <td><input type="text" name="email" class="txtform100" value="{email}" /></td>
            </tr>
            
            	  
            
            <tr>
                <td><strong>Link</strong></td>
                <td><input type="text" name="linkmap" class="txtform100" value="{linkmap}" /></td>
            </tr>


            <tr>
                <td><strong>Ảnh</strong></td>
                <td>
                    <div id="pic_avatar">{image}</div>
					<div class="c5"></div>
                    <div class="input-append">
                        <input name="imageurl" type="text" id="imageurl"  style="height:20px; width:290px;" value="{imageurl}"/>
                        <button class="btn" type="button" id="browserimage">Chọn ảnh trên server</button>
                    </div>


                </td>
            </tr>

            <!--

<tr>
                <td><strong>Website</strong></td>
                <td><input type="text" name="website" class="txtform100" value="{website}" /></td>
            </tr>
            
            <tr>
                <td><strong>Điểm phân phối</strong></td>
                <td><input type="checkbox" name="phanphoi" value="1" {phanphoi} /></td>
            </tr>	 

            <tr>
                <td><strong>Điểm bảo hành</strong></td>
                <td><input type="checkbox" name="baohanh" value="1" {baohanh} /></td>
            </tr>	            

            
            
            <tr>
                <td valign="top"><strong>Thông tin địa chỉ</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" valign="top"> 
                    <div class="input-group" style="float:left">
                        <span class="input-group-addon" style="width:60px; display:block; float:left; line-height:25px;">Tiêu đề</span>
                        <input name="maptitle" id="hfTitle" type="text" class="form-control input-lg" placeholder="Tiêu đề" value="{maptitle}">
                    </div>
                    <div class="input-group" style="float:left; margin-left:10px;">
                        <span class="input-group-addon"  style="width:60px; display:block;float:left;line-height:25px;">Địa chỉ</span>
                        <input name="mapaddress" id="txtAddress" type="text" class="form-control input-lg" placeholder="Tìm địa chỉ" value="{mapaddress}">

                        <div class="btn" onclick="getAddress();
                                return false">Tìm</div>
                    </div>
                    <div class="c5"></div>
                    <div class="input-group" style="float:left">
                        <span class="input-group-addon"  style="width:60px; display:block;float:left;line-height:25px;">Latitude</span>

                        <input type="text" class="form-control input-lg" placeholder="Tiêu đề" name="latitude"  id="txtLatitude" value="{latitude}">
                    </div>
                    <div class="input-group" style="float:left; margin-left:10px;">
                        <span class="input-group-addon"  style="width:60px; display:block;float:left;line-height:25px;" >Longitude</span>
                        <input type="text" class="form-control input-lg" placeholder="Longitude" name="longitude"  id="txtLongitude" value="{longitude}">
                    </div>
                    <div class="c10" style="clear:both"></div>
                    <div style="border:solid 1px #CCC; width:800px; height:300px;" id="showMap">
                    </div>
                </td>
            </tr>            
            
            -->	  

            <tr>
                <td valign="top"><strong>Mô tả</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" valign="top">{intro}</td>
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
        $('#btnSearch').click(function () {
            $('#list_form').attr('action', '?page={par_page}&pid={pid}');
            $('#list_form').submit();
        });
    });

</script>


<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyDlLCyGciPsbFRoHB-HiapPKba0_r6TGEQ" type="text/javascript"></script>
<script type="text/javascript">

    var infowindow = new google.maps.InfoWindow({
        maxWidth: 500
    });
    var geocoder;

    var map;

    var zoomIn = 13;
    var markersArray = [];
    function initialize() {

        var title = $('#hfTitle').val();

        var lat = $('#txtLatitude').val();

        var lng = $('#txtLongitude').val();

        lat = lat.replace(",", ".");

        lng = lng.replace(",", ".");

        if (!lat)
            lat = 0;

        if (!lng)
            lng = 0;
        var latLng;

        if (lat > 0 && lng > 0) {
            latLng = new google.maps.LatLng(lat, lng);
        } else {
            latLng = new google.maps.LatLng(21.042324102802453, 105.77579302215577);
        }
        geocoder = new google.maps.Geocoder();
        var myOptions = {
            zoom: zoomIn,
            center: latLng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById('showMap'), myOptions);
        $('#txtLatitude').attr('value', latLng.lat().toString());
        $('#txtLongitude').attr('value', latLng.lng().toString());
        createMarker(latLng, title);
    }
    function getAddress() {
        var address = $('#txtAddress').val();
        geocoder.geocode({'address': address}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                createMarker(results[0].geometry.location, "");
                $('#txtLatitude').attr('value', results[0].geometry.location.lat());
                $('#txtLongitude').attr('value', results[0].geometry.location.lng());
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }

    function createMarker(latLng, html) {
        var marker = new google.maps.Marker({
            position: latLng,
            map: map,
            draggable: true
        });
        infowindow.setContent(html);
        infowindow.open(map, marker);
        google.maps.event.addListener(marker, 'dragstart', function () {
        });
        google.maps.event.addListener(marker, 'drag', function () {
            updateMarkerPosition(marker.getPosition());
        });
        google.maps.event.addListener(marker, 'dragend', function () {
        });
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setMap(null);
            }
        }

        markersArray.push(marker);
        return marker;
    }

    function updateMarkerPosition(latLng) {
        $('#txtLatitude').val(latLng.lat().toString());
        $('#txtLongitude').val(latLng.lng().toString());
    }
    google.maps.event.addDomListener(window, 'load', initialize);

</script>