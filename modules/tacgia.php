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
    $tpl = new TemplatePower("templates/tacgia.htm");
$tpl->prepare();

langsite();

$catname = $root_cat['name'];

$tpl->assignGlobal("dir_path", $dir_path);
$tpl->assignGlobal("site_address", $site_address);
$tpl->assignGlobal("slideshow", slidechild());


$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '">Trang chủ</i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');


include_once("modules/left_right_col.php");
$leftcol = left_right_col();
$tpl->assignGlobal("leftcol", $leftcol);

$tpl->assignGlobal("menutab", menutab($root_idc));

$tpl->assignGlobal("catname", $rs_cat['subname']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);

if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');



$tg = new clsTacgia();

class clsTacgia {

    public function __construct() {
        global $DBi, $tpl, $dir_path, $idc, $id, $cache_image_path, $rs_cat, $root_idc;

        if (!$id) {
            $this->itemList();
        } else {
            $this->itemDetail();
        }
    }


    public function itemList() {
        global $DBi, $tpl, $cache_image_path, $dir_path, $idc, $SETTING, $rs_cat;

        $tpl->newBlock("itemList");

        $sql = "SELECT * FROM tacgia WHERE active=1 AND id_category IN(" . Category::getParentId($idc) . ") ORDER BY thu_tu DESC, id_tacgia DESC"; 
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("tacgiaITem");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(500, 500, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');

            $tpl->assign("createdate", date('d/m/Y', $rs['ngay_dang']));
            $tpl->assign("name", $rs['name']);
			$tpl->assign("chucdanh", $rs['chucdanh']);
            $tpl->assign("intro", $rs['intro'] );
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
			
        }


    }

    public function itemDetail() {
        global $DBi, $id, $idc, $tpl, $dir_path, $cache_image_path, $site_address, $rs_cat;

        
        $sql = "SELECT * FROM tacgia WHERE active=1 AND id_tacgia = $id "; 
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
			
			$tpl->newBlock("itemDetail");
			

            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(500, 500, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');

            $tpl->assign("createdate", date('d/m/Y', $rs['ngay_dang']));
            $tpl->assign("name", $rs['name']);
			$tpl->assign("chucdanh", $rs['chucdanh']);			
			$tpl->assign("intro", $rs['intro'] );
			$tpl->assign("content", $rs['content']  );
			$tpl->assign("thongtinkhac", $rs['thongtinkhac']);
			
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
		
		
    }

}

$tpl->printToScreen();
?>
