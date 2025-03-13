<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Administrator</title>
        <link href="../css/fontawesome-5.12.1/css/all.min.css" rel="stylesheet" type="text/css">



        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/themes/base/jquery-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js" ></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        <script language="javascript" src="js/bootstrap.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>

        <script language="javascript" src="js/jquery.simple-color.js"></script>

        <script type="text/javascript" src="js/timepicker.js"></script>
        <script type="text/javascript" src="js/jquery.blockUI.js"></script>
        <script language="javascript" src="js/script.js"></script>


        <script language="javascript" src="js/jquery.multiselect.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.multiselect.css"/>



        <script src="mrm_fi/ckfinder.js"></script>
        <script src="mrm_ed/ckeditor.js"></script>

        

        <script>

            var lang = '{lang}';

        </script>
    </head>

    <body>
        <div id="popupelfinder"></div>
        <div class="wraper">
            <div class="viewpage">
                <div id="navbar-example" class="navbar navbar-inverse navbar-fixed-top">
                    <div class="navbar-inner">
                        <div class="container" style="width: auto; margin-left:20px;"> <a class="brand" href="?page=">Administrator</a>


                            <ul class="nav" role="navigation">
                                <li class="dropdown"> <a id="drop1" href="#" role="button" class="dropdown-toggle" data-bs-toggle="dropdown"><i class="icon-cog icon-white"></i>&nbsp;Hệ thống <b class="caret"></b></a>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?page=setting"><i class=" icon-asterisk"></i>&nbsp;Cấu hình hệ thống</a></li>

                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?page=static_lang"><i class=" icon-asterisk"></i>&nbsp;Cấu hình ngôn ngữ</a></li>            

                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?page=settingshow"><i class="icon-th"></i>&nbsp;Cấu hình hiển thị</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?page=users"><i class="icon-user"></i>&nbsp;Quản lý người sử dụng</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?page=tool_system_tools"><i class="icon-user"></i>&nbsp;System tools</a></li>

                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?page=direct"><i class="icon-user"></i>&nbsp;Cấu hình chuyển hướng</a></li>

                                    </ul>
                                </li>
                            </ul>

                            <ul class="nav pull-right">
                                
								<li class="dropdown"> <a id="drop3" href="#" role="button" class="dropdown-toggle" data-bs-toggle="dropdown"><i class="icon-cog icon-white"></i>&nbsp;Thông tin cá nhân <b class="caret"></b></a>
								
								
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?page=profile"><i class="icon-user"></i>&nbsp;Thông tin cá nhân</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?code=logout"><i class="icon-minus-sign"></i>&nbsp;Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </ul>



                        </div>
                    </div>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablecontent">
                    <tr>
                        <td valign="top" class="leftcol">


                            <div class="divider1"><span></span></div>


                            <div style="padding-left:15px;">
                                <form action="" method="get" id="changelang">
                                    <select name="lang" id="lang" style="width:190px;">
                                        <option value="default" {lang}>Tiếng Việt</option>
                                        <option value="en" {langen}>English</option>
                                    </select>
                                </form>    
                                <script>
                                    $(function () {
                                        $('#changelang').change(function () {
                                            $('#changelang').submit();
                                        });
                                    });
                                </script>
                            </div>      

                            <ul class="menuleft">
                                <li ><a href="?page=category" {category}><i class="icon-folder-open"></i>Quản lý chuyên mục</a></li>


                                <li><a href="?page=logo" {logo} ><i class="icon-globe"></i>Hệ thống logo-link-banner</a></li>
                                <li><a href="?page=static" {static} ><i class="icon-list"></i>Nội dung tĩnh</a></li>
                                <li><a href="?page=video" {video} ><i class="icon-list"></i>Video</a></li>
                                <li><a href="?page=album" {album} ><i class="icon-envelope"></i>Hình ảnh</a></li>
                                <li><a href="?page=contactInfo" {contactInfo}><i class="icon-list"></i>Trang liên hệ</a></li>
                            </ul>
                            <div class="divider1"><span></span></div>
                            <ul class="menuleft">

                                <li><a href="?page=news" {news} ><i class="icon-list-alt"></i>Trang Tin tức</a></li>
                                <li><a href="?page=info" {info} ><i class="icon-list-alt"></i>Trang Giới thiệu</a></li>
                                <li><a href="?page=du_an" {du_an} ><i class="icon-file"></i>Trang Dự án</a></li>
                                <li><a href="?page=service" {service}><i class="icon-list-alt"></i>Trang Dịch vụ</a></li>
                            </ul>	

                            <div class="divider1"><span></span></div>

                            <ul class="menuleft">
                                <li><a href="?page=product_manufacture" {manufacture} ><i class="icon-file"></i>Hãng sản xuất</a></li>
                                <li><a href="?page=product_material" {product_material} ><i class="icon-file"></i>Xuất xứ</a></li>
                                <li><a href="?page=product" {product} ><i class="icon-file"></i>Sản phẩm</a></li>

                                <li><a href="?page=price_range" {price_range}><i class="icon-file"></i>Quản lý khoảng giá</a></li>

                                <!-- 
                                <li><a href="?page=attributePro" {attributePro}><i class="icon-file"></i>Thuộc tính Sản phẩm</a></li>

                                <li><a href="?page=import_list" {import_list}><i class="icon-file"></i>List bảo hành</a></li>   
                                <li><a href="?page=faq" {faq}><i class="icon-list-alt"></i>Trang Hỏi đáp </a></li>
                                
                                
                                
                                
                                                                 
                                -->
                            </ul>
                            <div class="divider1"><span></span></div>

                            <ul class="menuleft">

                                <li><a href="?page=daily" {daily} ><i class="icon-list-alt"></i>Hệ thống phân phối</a></li>
                                <li><a href="?page=article" {article} ><i class="icon-list-alt"></i>Ý kiến khách hàng </a></li>
                                <li><a href="?page=download" {download}><i class="icon-list-alt"></i>Tài liệu - Báo cáo</a></li>
                                <li><a href="?page=tuyendung" {tuyendung}><i class="icon-list-alt"></i>Trang tuyển dụng</a></li>
                                <!--
                                
                                <li><a href="?page=tuyendung_request" {tuyendung_request}><i class="icon-envelope"></i>Nhận tin tuyển dụng</a></li>
                                <li><a href="?page=support" {support}><i class="icon-list"></i>Hỗ trợ trực tuyến</a></li>                         
                                <li><a href="?page=vn_province" {vn_province}><i class="icon-file"></i>Danh mục tỉnh thành</a></li>
                                -->

                            </ul>

                            <ul class="menuleft">
                                <!--
                                <li><a href="?page=comment" {comment}><i class="icon-list"></i>Quản lý bình luận</a></li>
                                <li><a href="?page=order" {order}><i class="icon-envelope"></i>Danh sách đơn hàng</a></li>
                                <li><a href="?page=newsletter" {newsletter}><i class="icon-envelope"></i>Đăng ký nhận tin</a></li>
                                -->

                                <li><a href="?page=contact" {contact}><i class="icon-envelope"></i>Danh sách liên hệ</a></li>

                            </ul>
                            <div class="divider1"><span></span></div>

                            <div class="c"></div></td>
                        <td valign="top" style="padding-left:5px;">
