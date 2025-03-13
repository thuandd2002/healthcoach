<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$tpl = new TemplatePower("templates/partner.htm");

$tpl->prepare();

langsite();

$catname = $root_cat['name'];

$tpl->assignGlobal("dir_path", $dir_path);
$tpl->assignGlobal("site_address", $site_address);

$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '">Trang chủ</i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div></div>');

/*
  include_once("modules/left_right_col.php");
  $leftcol = left_right_col();
  $tpl->assignGlobal("leftcol", $leftcol);

  $tpl->assignGlobal("menutab", menutab($root_idc));
 */

$tpl->assignGlobal("cat_name", $rs_cat['subname']);
$tpl->assignGlobal("cat_link", $dir_path . '/' . $rs_cat['url']);
$tpl->assignGlobal("cat_intro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
$tpl->assignGlobal("cat_content", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');


$myObj = new clsPartner();

class clsPartner{

    public function __construct() {
        global $DBi, $tpl, $dir_path, $idc, $id, $cache_image_path, $rs_cat, $root_idc;

        if (!$id) {
            if (Category::checkChildCat($idc)) {
                
                $this->catList();
            } else {
                $this->itemList($idc);
            }
        } else {
            $this->itemDetail();
        }

        
    }

    public function catList() {
        
        global $DBi, $tpl, $cache_image_path, $objService, $dir_path, $idc, $SETTING, $rs_cat;
        $db = Category::getChildCat($idc);
        $tpl->newBlock("catList");
        $i = 0;
        foreach ($db as $rs) {
            $i++;
            
            $tpl->newBlock("catItem");
            $tpl->assign("catname", $rs['subname']);
            $tpl->assign("catcontent", $rs['content']);
            $tpl->assign("catintro", $rs['intro']);
            $tpl->assign("catlink", $dir_path . '/' . $rs['url']);
            if ($i>1)
                $tpl->assign("style", "background:#FFF;");
                
            
            $this->itemList($rs['id_category']);
            
            
        }
    }

    public function itemList($idcat = 0) {
        global $DBi, $tpl, $cache_image_path, $dir_path;

        $tpl->newBlock("itemList");
        $sql = "SELECT * FROM partner WHERE active=1 AND id_category IN(" . Category::getParentId($idcat) . ") ORDER BY thu_tu DESC, id_partner DESC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("partnerITem");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . resizeimage1(200, 120, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');

            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

    public function itemDetail() {
        global $DBi, $id, $idc, $tpl, $dir_path, $cache_image_path, $site_address, $rs_cat;

        $sql = "SELECT * FROM partner WHERE active=1 AND id_partner = $id ";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("itemDetail");

            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(500, 500, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');

            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", $rs['content']);
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

}

$tpl->printToScreen();
?>
