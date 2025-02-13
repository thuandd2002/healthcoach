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

    <script>
        $(function () {

            action_select_type($('.data_type:checked').val());


            if ($('#boxmenufooter input').is(":checked")) {
                $('#colfooter').show();
            } else {
                $('#colfooter').hide();
            }
            $('#boxmenufooter input').change(function () {
                if ($(this).is(":checked")) {
                    $('#colfooter').show();
                } else {
                    $('#colfooter').hide();
                }
            });

            if ($('#menuhome input').is(":checked")) {
                $('#iconmenu').show();
            } else {
                $('#iconmenu').hide();
            }
            $('#menuhome input').change(function () {
                if ($(this).is(":checked")) {
                    $('#iconmenu').show();
                } else {
                    $('#iconmenu').hide();
                }
            });


            if ($('#menubar input').is(":checked")) {
                $('#stylebar').show();
            } else {
                $('#stylebar').hide();
            }
            $('#menubar input').change(function () {
                if ($(this).is(":checked")) {
                    $('#stylebar').show();
                } else {
                    $('#stylebar').hide();
                }
            });



            $('#cathome input').change(function () {
                if ($(this).is(":checked") && ($('.data_type:checked').val() == 'logo' || $('.data_type:checked').val() == 'news' || $('.data_type:checked').val() == 'product' || $('.data_type:checked').val() == 'service' || $('.data_type:checked').val() == 'info' || $('.data_type:checked').val() == 'video')) {

                    $('#styleshow').show();
                } else {
                    $('#styleshow').hide();
                }
            });

        });
        function action_select_type(data_type) {


            $('#chooselocation li input').attr('disabled', true);
            $('#chooselocation li label').addClass('classdisable');

            if (data_type == 'news' || data_type == 'service' || data_type == 'article' || data_type == 'info' || data_type == 'daily' || data_type == 'du_an' || data_type == 'product_manufacture' || data_type == 'video' || data_type == 'support' || data_type == 'album' || data_type == 'info_donvi' || data_type == 'info_lichsu' || data_type == 'download' || data_type == 'product') {
                var arr = ["menubar", "leftbar", "rightbar", "menufooter", "menuleft", "menutop", "inright", "boxmenufooter", "menuhome", "hothome", "menumobile", "cathome", "inhome"];
            }

            if (data_type == 'faq' || data_type == 'tuyendung') {
                var arr = ["menubar", "leftbar", "rightbar", "menuleft", "menutop", "menuhome", "boxmenufooter"];
            }

            if (data_type == 'logo' || data_type == 'link' || data_type == 'partner') {
                var arr = ["menubar", "leftbar", "rightbar", "menufooter", "menuleft", "menutop", "inright", "boxmenufooter", "menuhome", "hothome", "menumobile", "cathome", "inhome", "logosite", "slideshow", "slidemobile"];
            }


			if (data_type == 'contact' || data_type == 'contactinfo' || data_type == 'home' || data_type == 'sitemap') {
                var arr = ["menutop", "menubar", "leftbar", "rightbar", "menuleft", "menutop", "menufooter", "popup", "menumobile", "boxmenufooter"];
            }


            if (arr) {
                jQuery.each(arr, function () {
                    $('#' + this + ' label').removeClass('classdisable');
                    $('#' + this + ' input').attr('disabled', false);
                });
            }


            if (data_type == 'news') {
                $('.template_layout').show();
            } else {
                $('.template_layout').hide();
            }


            if (data_type == 'product') {
                $('#stypeshow').show();
            } else {
                $('#stypeshow').hide();
            }


            if ($('#cathome input').prop("checked") && ($('.data_type:checked').val() == 'logo' || $('.data_type:checked').val() == 'news' || $('.data_type:checked').val() == 'product' || $('.data_type:checked').val() == 'service' || $('.data_type:checked').val() == 'info' || $('.data_type:checked').val() == 'video')) {
                $('#styleshow').show();
            } else {
                $('#styleshow').hide();
            }



        }
    </script>
    <form action="{action}" method="post" id="inputform" onSubmit="return check_null();" enctype="multipart/form-data" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered tabletdnone">
            <tr>
                <th colspan="2"><i class="icon-pencil"></i>&nbsp;Quản lý {item}</th>
            </tr>
            <tr>
                <td width="150"><strong>Tiêu đề</strong></td>
                <td><input type="text" name="name" id="name" class="txtform100 notNull" data-alert="Bạn cần nhập vào tiêu đề {item}" value="{name}"/></td>
            </tr>
            <tr>
                <td><strong>Tiêu đề phụ</strong></td>
                <td><input type="text" name="subname" class="txtform100" value="{subname}"/></td>
            </tr>

            <tr>
                <td><strong>Page title</strong></td>
                <td><input type="text" name="title" id="title" class="txtform100" value="{title}"/></td>
            </tr>

            <tr>
                <td valign="top">&nbsp;</td>
                <td><ul class="fr_location borderright-FFF" id="choose_datatype">
                        <li class="title">Kiểu dữ liệu</li>
                        <div class="divline"></div>


                        <li id="news">
                            <label class="radio">
                                <input type="radio" name="data_type" value="news" class="data_type" {news}/>
                                Tin tức</label>
                        </li>

                        <li id="info">
                            <label class="radio">
                                <input type="radio" name="data_type" value="info" class="data_type" {info}/>
                                Giới thiệu</label>
                        </li>

                        <li id="info_leader">
                            <label class="radio">
                                <input type="radio" name="data_type" value="info_leader" class="data_type" {info_leader}/>
                                Giới thiệu nhân sự</label>
                        </li>  
                        
                        <li id="info_donvi">
                            <label class="radio">
                                <input type="radio" name="data_type" value="info_donvi" class="data_type" {info_donvi}/>
                                Đơn vị thành viên</label>
                        </li>
                        
                        <li id="info_lichsu">
                            <label class="radio">
                                <input type="radio" name="data_type" value="info_lichsu" class="data_type" {info_lichsu}/>
                                Lịch sử hình thành</label>
                        </li>
                        

                        <li id="article">
                            <label class="radio">
                                <input type="radio" name="data_type" value="article" class="data_type" {article}/>
                                Ý kiến khách hàng</label>
                        </li>

                        <!--
                        <li id="daily">
                            <label class="radio">
                                <input type="radio" name="data_type" value="daily" class="data_type" {daily}/>
                                Hệ thống đại lý</label>
                        </li>
                        
                        <li id="product_manufacture">
                            <label class="radio">
                                <input type="radio" name="data_type" value="product_manufacture" class="data_type" {product_manufacture}/>
                                Hãng sản xuất</label>
                        </li>
                        
                        -->

                        <li id="product">
                            <label class="radio">
                                <input type="radio" name="data_type" value="product" class="data_type" {product}/>
                                Trang sản phẩm</label>
                        </li>

                        

                        <li id="du_an">
                            <label class="radio">
                                <input type="radio" name="data_type" value="du_an" class="data_type" {du_an}/>
                                Trang dự án</label>
                        </li>

                        <li id="service">
                            <label class="radio">
                                <input type="radio" name="data_type" value="service" class="data_type" {service}/>
                                Trang Dịch vụ</label>
                        </li> 

                        <li id="album">
                            <label class="radio">
                                <input type="radio" name="data_type" value="album" class="data_type" {album}/>
                                Album ảnh</label>
                        </li>

                        <li id="video">
                            <label class="radio">
                                <input type="radio" name="data_type" value="video" class="data_type" {video}/>
                                Trang video</label>
                        </li>

                        <li id="tuyendung">
                            <label class="radio">
                                <input type="radio" name="data_type" value="tuyendung" class="data_type" {tuyendung}/>
                                Trang Tuyển dụng</label>
                        </li>
                        

                        <!--
                        
                        
                        <li id="faq">
                            <label class="radio">
                                <input type="radio" name="data_type" value="faq" class="data_type" {faq}/>
                                Câu hỏi thường gặp</label>
                        </li>

                        -->

                        <li id="download">
                            <label class="radio">
                                <input type="radio" name="data_type" value="download" class="data_type" {download}/>
                                Tài liệu download</label>
                        </li>

                        <li id="partner">
                            <label class="radio">
                                <input type="radio" name="data_type" value="partner" class="data_type" {partner}/>
                                Trang Đối tác - Khách hàng</label>
                        </li>                        

                        <li id="contact">
                            <label class="radio">
                                <input type="radio" name="data_type" value="contact" class="data_type" {contact}/>
                                Trang liên hệ</label>
                        </li>
                        <li id="logo">
                            <label class="radio">
                                <input type="radio" name="data_type" value="logo" class="data_type" {logo}/>
                                Logo - Liên kết web</label>
                        </li>

                        <li id="home">
                            <label class="radio">
                                <input type="radio" name="data_type" value="home" class="data_type" {home}/>
                                Trang chủ</label>
                        </li>


                        <li id="support">
                            <label class="radio">
                                <input type="radio" name="data_type" value="support" class="data_type" {support}/>
                                Hỗ trợ trực tuyến</label>
                        </li>

                        <!-- <li id="sendquestion">
                             <label class="radio">
                                 <input type="radio" name="data_type" value="sendquestion" class="data_type" {sendquestion}/>
                                 Gửi câu hỏi</label>
                         </li>-->
                        <li id="sitemap">
                            <label class="radio">
                                <input type="radio" name="data_type" value="sitemap" class="data_type" {sitemap}/>
                                Sitemap</label>
                        </li>

                        <li id="tacgia">
                            <label class="radio">
                                <input type="radio" name="data_type" value="tacgia" class="data_type" {tacgia}/>
                                Tác giả</label>
                        </li>



                    </ul>
                    <ul class="fr_location borderleft-dddddd" id="chooselocation">
                        <li class="title">Vị trí hiển thị</li>
                        <div class="divline"></div>


                        <li id="menutop">


                            <label class="checkbox">
                                <input name="vitri[menutop]" type="checkbox" value="menutop" {menutop}/>
                                Menu top</label>
                        </li>

                        <li id="menubar">
                            <label class="checkbox">
                                <input name="vitri[menubar]" type="checkbox" value="menubar" {menubar}/>
                                Menu ngang</label>
                        </li>
                        <!--
                        
                        <li id="leftbar">
                            <label class="checkbox">
                                <input name="vitri[leftbar]" type="checkbox" value="leftbar" {leftbar}/>
                                Menu  (trái)</label>
                        </li>
                        <li id="rightbar">
                            <label class="checkbox">
                                <input name="vitri[rightbar]" type="checkbox" value="rightbar" {rightbar}/>
                                Menu  (phải)</label>
                        </li>
                        -->



                        <li id="menufooter">
                            <label class="checkbox">
                                <input name="vitri[menufooter]" type="checkbox" value="menufooter" {menufooter}/>
                                Menu chân trang</label>
                        </li>

                        <li id="boxmenufooter">
                            <label class="checkbox">
                                <input name="vitri[boxmenufooter]" type="checkbox" value="boxmenufooter" {boxmenufooter}/>
                                Menu cột chân trang</label></li>
                        <div id="colfooter" style="padding-left:15px;">


                            <label class="radio" style="float:left; margin-right:10px;">
                                <input name="footercol" type="radio" value="1" {footercol1}>
                                Cột 1</label>

                            <label class="radio" style="float:left; margin-right:10px;">
                                <input name="footercol" type="radio" value="2" {footercol2}>
                                Cột 2</label>	

                            <label class="radio" style="float:left; margin-right:10px;">
                                <input name="footercol" type="radio" value="3" {footercol3}>
                                Cột 3</label>	

                            <div class="c"></div>
                        </div>




                        <li id="menuleft">
                            <label class="checkbox">
                                <input name="vitri[menuleft]" type="checkbox" value="menuleft" {menuleft}/>
                                Menu trái</label>
                        </li>

                        <li id="banner">
                            <label class="checkbox">
                                <input name="vitri[banner]" type="checkbox" value="banner" {banner}/>
                                Logo-Top</label>
                        </li>


                        <li id="logosite">
                            <label class="checkbox">
                                <input name="vitri[logosite]" type="checkbox" value="logosite" {logosite}/>
                                Logo</label>
                        </li>

                        <li id="slideshow">
                            <label class="checkbox">
                                <input name="vitri[slideshow]" type="checkbox" value="slideshow" {slideshow}/>
                                Slide show</label>
                        </li>

                        <li id="slidemobile">
                            <label class="checkbox">
                                <input name="vitri[slidemobile]" type="checkbox" value="slidemobile" {slidemobile}/>
                                Slide Mobile</label>
                        </li>
						
						<li id="popup">
                            <label class="checkbox">
                                <input name="vitri[popup]" type="checkbox" value="popup" {popup}/>
                                Popup</label>
                        </li>

                        <li id="cathome">
                            <label class="checkbox">
                                <input name="vitri[cathome]" type="checkbox" value="cathome" {cathome}/>
                                Hiển trị ở trang chủ [cathome]</label>
                        </li>

                        <li id="hothome">
                            <label class="checkbox">
                                <input name="vitri[hothome]" type="checkbox" value="hothome" {hothome}/>
                                Hiển trị ở trang chủ [hothome]</label>
                        </li>

                        <li id="inhome">
                            <label class="checkbox">
                                <input name="vitri[inhome]" type="checkbox" value="inhome" {inhome}/>
                                Hiển trị ở trang chủ [inhome]</label>
                        </li>


                        <!--
                        <li id="hothome">
                            <label class="checkbox">
                                <input name="vitri[hothome]" type="checkbox" value="hothome" {hothome}/>
                                Hiển trị ở trang chủ [Hotzone]</label>
                        </li>
                        
                        <li id="inhome">
                            <label class="checkbox">
                                <input name="vitri[inhome]" type="checkbox" value="inhome" {inhome}/>
                                Slide lĩnh vực</label>
                        </li>
                        <li id="advfooter">
                            <label class="checkbox">
                                <input name="vitri[advfooter]" type="checkbox" value="advfooter" {advfooter}/>
                                Quảng cáo chân trang</label>
                        </li>

                        -->


                        <div class="c"></div>
                        <li id="inright">
                            <label class="checkbox">
                                <input name="vitri[inright]" type="checkbox" value="inright" {inright}/>
                                Cột trái/phải</label></li>

                    </ul></td>
            </tr>
            <tr>
                <td><strong>Nhóm cha</strong></td>
                <td><div id="cls_category" >{parentid}</div></td>
            </tr>
            <!--
            <tr>
    <td><strong>Mega menu</strong></td>
    <td>
                    <input name="mega_menu" type="checkbox" value="1" {mega_menu}/>
                    </td>
</tr>
            -->


            <tr id="stypeshow" style="display:none">
                <td><strong>Nhóm thuộc tính</strong></td>
                <td>
                    <div>
                        <!-- START BLOCK : list_attr -->

                        <label class="radio" style="float:left;margin-right:10px;">
                            <input name="id_attr" type="radio" value="{id_attr}" {checked}/>
                            {attrname}</label>

                        <!-- END BLOCK : list_attr -->
                    </div>
                </td>
            </tr>

            <tr>
                <td valign="top"><strong>Template name</strong></td>
                <td>
                    <input name="template_name" type="text" style="width:200px;" value="{template_name}"/>


                </td>
            </tr>

            <tr>
                <td><strong>Ảnh</strong></td>
                <td><div id="pic_avatar">{image}</div>
                    <div class="c5"></div>
                    <div class="input-append">
                        <input name="imageurl" type="text" id="imageurl"  style="height:20px; width:290px;" value="{imageurl}"/>
                        <button class="btn" type="button" id="browserimage">Chọn ảnh trên server</button>
                    </div></td>
            </tr>
            <tr >
                <td><strong>Ảnh icon</strong></td>
                <td><div id="pic_avataradv">{imageadv}</div>
                    <div class="c5"></div>
                    <div class="input-append">
                        <input name="imageurladv" type="text" id="imageurladv"  style="height:20px; width:290px;" value="{imageurladv}"/>
                        <button class="btn" type="button" id="browserimageadv">Chọn ảnh trên server</button>
                    </div></td>
            </tr>

            <tr>
                <td><strong>Mô tả</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">{intro}</td>
            </tr>

            <tr>
                <td><strong>Nội dung</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">{content}</td>
            </tr>


            <tr>
                <td><strong>Ảnh Slide</strong></td>
                <td><button class="btn btn-info" type="button" id="multi_browser_image">Chọn ảnh trên server</button></td>
            </tr>
            <tr>
                <td colspan="2" id="show_collection_cell">

                    <!-- START BLOCK : collection_cell -->
                    <div class="collection_cell">
                        <div class="image"><a href="{big_image}" class="highslide" onClick="return hs.expand(this)"><img src="{image}"></a></div>
                        <input name="image_name[collection_{id}]" type="text" class="txtname name_image" placeholder="Tiêu đề..." value="{name}"/>
						<textarea name="image_desc[collection_{id}]" class="txtname" style="height:60px;resize:none; " placeholder="Mô tả..." >{image_desc}</textarea>
                        <div style="padding-left:10px;"><span class="labelorder">Thứ tự</span>
                            <input name="image_thu_tu[collection_{id}]" type="text" class="txtorder image_thu_tu" placeholder="Thứ tự..." value="{thu_tu}">
                            <a class="btn btn-mini" style="margin-top:2px; margin-left:10px;" onClick="delete_multi_image($(this));
                                    return false"><i class="icon-trash"></i>&nbsp;Xóa</a>
                            <div style="c"></div>
                        </div>
                        <input type="hidden" name="image_path[collection_{id}]" value="{real_image}" class="collection_image">
                    </div>
                    <!-- END BLOCK : collection_cell -->

                </td>
            </tr>
            <tr>
                <td><strong>Description</strong></td>
                <td><textarea name="description" id="description" class="txtareakeyword-description">{description}</textarea></td>
            </tr>
            <tr>
                <td><strong>Keywords</strong></td>
                <td><textarea name="keywords" class="txtareakeyword-description">{keywords}</textarea></td>
            </tr>
            <tr>
                <td><strong>Header tag</strong></td>
                <td><textarea name="header_tag" class="txtareakeyword-description">{header_tag}</textarea></td>
            </tr>

            <tr>
                <td><strong>Url</strong></td>
                <td style="position:relative">
                    <div class="input-prepend"> 
                        <span class="add-on">
                            <input name="autourl" id="autourl" type="checkbox" value="1" {autourl}/>
                        </span>
                        <input class="span2" id="url" name="url" type="text" style="width:572px;" value="{url}">
                    </div>
                    <div style="font-size:11px; color:#666; font-style:italic">Checked tự động tạo url/Uncheck lấy url trên ô text</div></td>
            </tr>
            <tr>
                <td><strong>Target blank</strong></td>
                <td><input type="checkbox" name="target" value="1" {targetcheck} /> </td>
            </tr>

            <tr>
                <td><strong>Kích hoạt</strong></td>
                <td><input type="checkbox" name="active" id="active" value="1" {active}/></td>
            </tr>
            <tr>
                <td><strong>Thứ tự</strong></td>
                <td><input type="text" name="thu_tu" id="thu_tu" class="txtorder" value="{thu_tu}" /></td>
            </tr>
            <tr>
                <td><strong>Shortcut ra trang chủ quản trị</strong></td>
                <td><input type="checkbox" name="shortinhome" id="shortinhome" value="1" {shortinhome}/></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><div onclick="$('#inputform').submit();
                        return false" class="btn btn-primary"><i class="icon-ok-circle icon-white"></i>&nbsp;Cập nhật</div>
                    <div onclick="window.location = '?page={par_page}&pid={pid}'" class="btn btn-inverse" style="margin-left:10px;"><i class="icon-remove icon-white"></i>&nbsp;Đóng</div></td>
            </tr>
        </table>
    </form>
    <div class="divider1"><span></span></div>

    <!-- END BLOCK : AddNew --> 

    <!-- START BLOCK : showList -->

    <form action="{action}" method="post" id="list_form">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped table-hover" id="tablelist">
            <tr>
                <th colspan="7"> <div style="float:left"><i class="icon-list-alt"></i>&nbsp;Danh sách {item}</div>
                    <a href="?page={par_page}&code=showAddNew&pid={pid}" style="float:right">
                        <div class="btn  btn-mini"><i class="icon-plus-sign"></i>&nbsp;Thêm mới {item}</div>
                    </a> </th>
            </tr>
            <tr class="title">
                <td>Tiêu đề

                    <span class="expand-all-child"  style="float:right;" >&nbsp; Mở rộng </span> <span style="float:right;" > / </span> <span class="collapse-all-child"  style="float:right;" > Thu gọn &nbsp; </span>


                </td>
                <td width="150" class="center">Vị trí<br />
                    {pos}</td>
                <td width="120" class="center">Kiểu dữ liệu<br />
                    {dtype}</td>
                <td width="60" class="center">Kích hoạt</td>
                <td width="60" class="center">Thứ tự</td>
                <td width="30">Sửa</td>
                <td width="30">Xóa</td>
            </tr>

            <!-- START BLOCK : listCate -->

            <tr class="{child-cat}">
                <td class="showurl">
                    <div style="float:left;" class="list_item_name"><a style="{font-weight}" href="{link}">{name}</a></div>

                    <span style="font-size:11px; color:#666; display:none" class="urlview">{url}</span>

                    <span class="expand-child" data-expand="child-cat-{catid}" style="float:right;" >{expand-icon}</span>

                </td>
                <td class="center">{vitri}</td>
                <td class="center">{datatype}</td>
                <td class="center"><input type="checkbox" name="active" value="1" data-active="{id}" {active} class="changeactive"/></td>
                <td><input type="text" name="thu_tu[{id}]" class="txtorder" value="{thu_tu}"/></td>
                <td><a href="{link_edit}" class="btn padingleftright4"><i class="icon-wrench"></i></a></td>
                <td><a href="{link_delete}" class="btn padingleftright4 trash_item"><i class="icon-trash"></i></a></td>
            </tr>



            <!-- END BLOCK : listCate -->

            <tr class="title">
                <td colspan="3">Xóa tất cả mục đã chọn</td>
                <td colspan="2" ><a href="#" onclick="$('#list_form').submit();
                        return false" class="btn btn-inverse" style="margin-left:30px">Cập nhật</a></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
    <script>


        $(".expand-all-child").click(function () {
            $(".child-cat").show();
        });

        $(".collapse-all-child").click(function () {
            $(".child-cat").hide();
        });
        $(".expand-child").click(function () {
            var child_id = $(this).attr('data-expand');
            $("." + child_id).stop().toggle();
        });



        $(function () {
            $('.showurl').hover(function () {
                $('.urlview', this).delay(300).show();
            }, function () {
                $('.urlview', this).stop().hide();
            });
        })
    </script>
    <!-- END BLOCK : showList --> 

</div>
<div id="divremovea"></div>
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
    function delete_multi_image(obj) {
        if (confirm("Bạn muốn xóa ảnh này?")) {
            obj.parent().parent().remove();
        } else {
            return false;
        }
    }


    $(function () {
        var xxx = 1;
        $('#multi_browser_image').click(function () {
            xxx++;
            $('#popupelfinder').append('<div id="openelfinder"></div>');
            showItemElfinderMulti('openelfinder', xxx);
        });
    });




</script>