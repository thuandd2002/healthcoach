<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
error_reporting(0);



if ($_POST['code'] == 'save') {

    if ($_SESSION['imagesercurity'] == strtolower(compile_post('sercurity'))) {

        $id_tuyendung = compile_post('id_tuyendung');
        $a = array();
        $a['name'] = compile_post('td_name');
        $a['phone'] = compile_post('td_phone');
        $a['email'] = compile_post('td_email');
        $a['address'] = compile_post('td_address');
        $a['message'] = compile_post('td_message');
        $a['subject'] = compile_post('td_subject');
        $a['createdate'] = time() + $CONFIG['time_offset'];
        $a['xem'] = 0;
        $a['url'] = $site_address . $id_tuyendung;

        /* Tai file */

        $file_ok = 1;
        $ext = findexts($_FILES['td_file']['name']);
        $ran = md5(microtime());
        $ran2 = $ran . ".";
        $filePath = "/uploaded/tuyendung/";
        $filePath = $filePath . $ran2 . $ext;

        $target = $_SERVER['DOCUMENT_ROOT'] . $filePath;

        $uploaded_size = $_FILES['td_file']['size'];
        if ($uploaded_size > 3200000) {
            $msg .= "Dung lượng file vượt quá quy định (3MB) ! <br/>";
            $file_ok = 0;
        }
        if ($uploaded_size == 0) {
            $msg .= "File đính kèm bị lỗi ! <br/>";
            $file_ok = 0;
        }

        if (!($ext == "doc" || $ext == "docx" || $ext == "pdf")) {
            $msg .= "File không đúng định dạng !. <br/> ";
            $file_ok = 0;
        }

        if ($file_ok == 0) {
            $msg .= "File đính kèm của bạn không được tải lên. <br/>";
        } else {
            if (move_uploaded_file($_FILES['td_file']['tmp_name'], $target)) {
                $a['file'] = $filePath;
                $file_ok = 1;
            } else {
                $msg .= "Xảy ra lỗi khi tải file lên máy chủ. <br/>";
                $file_ok = 0;
            }
        }

        if ($file_ok == 1) {
            $lastid = $DBi->insertTableRow('tuyendung_request', $a);
        } else {
            echo $msg;
        }

        if ($lastid > 0)
            echo '1';
        else
            echo 'Lỗi không gửi được, bấm F5 để làm lại !';
    }else {

        echo '-1';
    }
} else {

    $id = intval($_GET['id']);
    $idc = intval($_GET['idc']);
    $template_name = $cateinfo['template_name'];
    if ($template_name)
        $tpl = new TemplatePower("templates/$template_name.htm");
    else
        $tpl = new TemplatePower("templates/tuyendung.htm");
    $tpl->prepare();

    langsite();
    /*
    $tpl->assignGlobal("menutab", menutab($idc));
    */
    $tpl->assignGlobal("dir_path", $dir_path);
    $tpl->assignGlobal("site_address", $site_address);

    include_once("modules/left_right_col.php");
    $leftcol = left_right_col();
    $tpl->assignGlobal("leftcol", $leftcol);

    $tpl->assignGlobal("slideshow", slidechild());

    
    $tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '">Trang chủ</a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');

    $tpl->assignGlobal("catname", $rs_cat['name']);
    $tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);
    
    $tpl->assignGlobal("catcontent", $rs_cat['content']);

    include_once("modules/db.provider/db.tuyendung.php");
    $td = new dbTuyendung();


    if ($id <= 0) {
        tdCatList();
    } else {
        tdDetail();
    }

    $tpl->printToScreen();
}


function tdCatList() {

    global $DBi, $tpl, $cache_image_path, $td, $dir_path, $idc, $SETTING, $clsUrl, $rs_cat;

    $db = $td->newsList($idc, 20);

    
    $tpl->newBlock("itemList");
    $tpl->assignGlobal("cat_name", $rs_cat['name']);
    if ($rs_cat['image'])
        $tpl->assignGlobal("image", '<img src="' . $rs_cat['image'] . '" alt="' . $rs_cat['name'] . '" width="100%" />');
    if (strlen($rs_cat['content']) > 7)
        $tpl->assignGlobal("cat_content", '<div style="padding-bottom:20px">' . $rs_cat['content'] . '</div>');
    $i = 0;
    $ids = "0";

    foreach ($db as $rs) {
        if ($rs['id_tuyendung'] > 0) {

            $ids .= ",$rs[id_tuyendung]";
            $tpl->newBlock("newsItem");

            $i++;
            $tpl->assign("stt", str_pad($i, 2, "0", STR_PAD_LEFT));
            $tpl->assign(array(
                name => $rs['name'],
                soluong => $rs['soluong'],
                noilamviec => $rs['noilamviec'],
                donvi => $rs['donvi'],
                ngayhethan => date('d/m/Y', $rs['ngayhethan']),
                content => ($rs['content']),
                link_detail => $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']
            ));

            $tpl->assign("intro", strstrim(strip_tags($rs['intro']), 30));
            
            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(420, 270, $dir_path . '/' . $rs['image'], true) . '" alt="' . $rs['name'] . '" width="100%" />');

            $tpl->assign("createdate", '<div class="createdate">' . date('d/m/Y', $rs['ngay_dang']) . '</div>');
        }
    }

    $tpl->assignGlobal("pages", $db['pages']);
}

function tdDetail() {

    global $DBi, $td, $id, $idc, $tpl, $dir_path, $cache_image_path, $clsUrl, $rs_cat;

    $tpl->newBlock("itemDetail");
    $tpl->assignGlobal("cat_name", $rs_cat['name']);
    $rs = $td->newsDetail($id);
    if ($rs) {
        $tpl->assign(array(
            name => $rs['name'],
            id_tuyendung => $rs['id_tuyendung'],
            intro => $rs['intro'],
            content => $rs['content'],
            link_detail => $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']
        ));

        if ($rs['showdate'] == 1)
            $tpl->assign("createdate", '<div class="createdate">' . date('d/m/Y H:i', $rs['ngay_dang']) . '</div>');
        $newsold = $td->news_new($idc, $id);
        if (count($newsold) > 0) {
            foreach ($newsold as $rse) {
                if ($rse['id_tuyendung'] > 0) {
                    $tpl->newBlock("lstOther");
                    $tpl->assign("name", $rse['name']);
                    $tpl->assign("link_detail", $dir_path . "/" . url_process::getUrlCategory($rse['id_category']) . $rse['url']);
                    $tpl->assign("createdate", '<span class="createdate">(' . date('d/m/Y', $rs['ngay_dang']) . ')</span>');
                }
            }
        }
        $newsold = $td->news_old($idc, $id);
        if (count($newsold) > 0) {
            foreach ($newsold as $rse) {
                if ($rse['id_tuyendung'] > 0) {
                    $tpl->newBlock("lstOther");
                    $tpl->assign("name", $rse['name']);
                    $tpl->assign("link_detail", $dir_path . "/" . url_process::getUrlCategory($rse['id_category']) . $rse['url']);
                    $tpl->assign("createdate", '<span class="createdate">(' . date('d/m/Y', $rs['ngay_dang']) . ')</span>');
                }
            }
        }
    }
}

?>