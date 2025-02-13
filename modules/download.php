<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$template_name = $cateinfo['template_name'];
if ($template_name)
    $tpl = new TemplatePower("templates/$template_name.htm");
else
    $tpl = new TemplatePower("templates/download.htm");
$tpl->prepare();

langsite();

$tpl->assignGlobal("dir_path", $dir_path);
$tpl->assignGlobal("site_address", $site_address);
$tpl->assignGlobal("slideshow", slidechild());

$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '">Trang chủ</i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c"></div></div>');

/*
include_once("modules/left_right_col.php");
$leftcol = left_right_col();
$tpl->assignGlobal("leftcol", $leftcol);
*/

$tpl->assignGlobal("menutab", menutab($root_idc));

$tpl->assignGlobal("catname", $root_cat['name']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);

if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');


include_once('modules/db.provider/db.download.php');
$objDownload = new dbDownload();

$download = new clsDownload();

class clsDownload {

    public function __construct() {
        global $DBi, $tpl, $dir_path, $idc, $id, $cache_image_path, $rs_cat, $root_idc;

        if (!$id) {
            $tpl->newBlock("itemList");
            $this->itemList();
        } else {
            $this->itemDetail();
        }
    }



    public function itemList() {
        global $DBi, $tpl, $cache_image_path, $objDownload, $dir_path, $idc, $SETTING, $rs_cat, $template_name;
        
        $i = 0;
        $db = $objDownload->itemList($idc, 9);
        foreach ($db as $rs) {

            if (intval($rs['id_download'])) {
                $i++;
                $tpl->newBlock("downloadItem");
                $tpl->assign(array(
                    name => $rs['name'],
                    intro => strip_tags($rs['intro']),
                    link_detail => $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']
                ));

                $tpl->assign("createdate", date('d/m/Y', $rs['ngay_dang']));
                $tpl->assign("files", $rs['files'] );

                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(320, 420, $dir_path . '/' . $rs['image']) . '" width="100%" alt="' . $rs['name'] . '">');
                
            }
        }


        $tpl->assignGlobal("pages", $db['pages']);
        
    }

    public function itemDetail() {
        global $DBi, $objDownload, $id, $idc, $tpl, $dir_path, $cache_image_path, $site_address, $rs_cat;

        $tpl->newBlock("itemDetail");
        $tpl->assign("link", $dir_path . '/' . $rs_cat['url']);
        $rs = $objDownload->newsDetail($id);

        if ($rs) {
            $tpl->assign(array(
                name => $rs['name'],
                intro => $rs['intro'],
                content => $rs['content'],
            ));

            $tpl->assign("ngay_dang", '<div class="ngay_dang"><i class="fa fa-calendar" aria-hidden="true"></i> ' . date('d/m/Y', $rs['ngay_dang']) . '</div>');
            $tpl->assign("createdate", gmdate(DATE_W3C, $rs['ngay_dang']));

            $tpl->assign("link_detail", $site_address . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            if ($rs['image'])
                $tpl->assign("image", $cache_image_path . cropimage(600, 400, $dir_path . '/' . $rs['image']));
            if ($rs['description'])
                $tpl->assign("description", strip_tags($rs['description']));
            else
                $tpl->assign("description", strip_tags($rs['intro']));


            $tpl->assign("link_detail", $site_address . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }

        if (intval($rs['form_name']) == 1)
            $tpl->newBlock("itemForm");

        $news_other = $objDownload->news_other();
        foreach ($news_other as $rse) {
            if ($rse['id_download'] > 0) {
                $tpl->newBlock("lstOther");
                $tpl->assign("name", $rse['name']);
                $tpl->assign("intro", strstrim(strip_tags($rse['intro']), 20));
                $tpl->assign("link_detail", $dir_path . "/" . url_process::getUrlCategory($rse['id_category']) . $rse['url']);
                if ($rse['image'])
                    $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(380, 240, $dir_path . '/' . $rse['image']) . '" alt="' . $rse['name'] . '" class="image-news" width="100%"/>');
                if ($rse['showdate'] == 1) {
                    $tpl->assign("createdate", '<span class="createdate">(' . date('d/m/Y', $rse['ngay_dang']) . ')</span>');
                }
            }
        }
    }

}

$tpl->printToScreen();
?>
