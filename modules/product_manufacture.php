<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

$tpl = new TemplatePower("templates/product_manufacture.htm");

$tpl->prepare();
$tpl->assignGlobal("dir_path", $dir_path);

$tpl->assignGlobal("lang", $lang);
$tpl->assignGlobal("lang_dir", $lang_dir);

$tpl->assignGlobal("site_address", $site_address);

langsite();

$id = intval($_GET['id']);

if ($_GET['idcgr']) {
    $idc = intval($_GET['idcgr']);
} else {
    $idc = intval($_GET['idc']);
}

/*
$tpl->assignGlobal("menubar", menubar());
include_once("modules/left_right_col.php");
$leftcol = left_right_col();
$tpl->assignGlobal("leftcol", $leftcol);
*/

$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("menutab", menutab($idc));

$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '"><i class="fa fa-home"></i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');

$objProduct = new dbProduct();
$product = new clsProductManufactory();
$tags_news = $product->_construct();
$tpl->printToScreen();

class clsProductManufactory {

    public function _construct() {
        global $DBi, $tpl, $dir_path, $idc, $id, $cache_image_path, $rs_cat;


        $tpl->assignGlobal("cat_title", $rs_cat['name']);
        $tpl->assignGlobal("cat_intro", '<div style="padding:10px 0px">' . $rs_cat['intro'] . '</div>');
        $tpl->assignGlobal("cat_content", '<div style="padding:10px 0px">' . $rs_cat['content'] . '</div>');

        if ($rs_cat['image'] != "")
            $tpl->assignGlobal("cat_image", $rs_cat['image']);
        else
            $tpl->assignGlobal("cat_image", $rs_cat['imageadv']);

        $tpl->assignGlobal("cat_link", $rs_cat['url']);
        $tpl->assignGlobal("cat_description", $rs_cat['description']);
        $tpl->assignGlobal("create_date", date('d/m/Y', $rs_cat['last_modify']));



        if ($id > 0) {
            $tpl->newBlock("proDetail");
            $this->proDetail($id);
        } else {
            $tpl->newBlock("product_manufacture");
            $this->product_manufacture();
        }
    }

    public function product_manufacture() {
        global $DBi, $idc, $tpl, $objProduct, $dir_path, $cache_image_path, $SETTING, $langLabel, $language, $root_idc;


        $sql = "SELECT * FROM product_manufacture WHERE active=1 AND id_category IN(" . Category::getParentId($idc) . ") ORDER BY thu_tu DESC";
        $db = $DBi->query($sql);


        //$db = $objProduct->itemList($idc, 50);

        $i = 0;
        while ($rs = $DBi->fetch_array($db)) {

            $i++;
            $tpl->newBlock("product_manufacture_item");

            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", strstrim(strip_tags($rs['content']),100) ) ;
            
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(310, 360, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }



        //$tpl->assignGlobal("pages", $db['pages']);
    }

    function proDetail($id) {
        global $DBi, $idc, $tpl, $objProduct, $dir_path, $cache_image_path, $static, $SETTING, $langLabel, $site_address, $lang_dir;

        $sql = "SELECT * FROM product_manufacture WHERE active=1 AND id = $id";
        $db_manu = $DBi->query($sql);

        while ($rs_manu = $DBi->fetch_array($db_manu)) {
            $tpl->assign("catname", $rs_manu['name']);
            $tpl->assign("catintro", $rs_manu['intro']);
            $tpl->assign("catcontent", $rs_manu['content']);
            if ($rs_manu['image'])
                $tpl->assign("catimage", '<img src="' . $cache_image_path . cropimage(310, 360, $dir_path . '/' . $rs_manu['image']) . '" alt="' . $rs_manu['name'] . '" width="100%" >');

            $sql = "SELECT * FROM product WHERE active=1 AND id_manufacture = $id ORDER BY id_product DESC";
            $db = $DBi->query($sql);

            while ($rs = $DBi->fetch_array($db)) {
                $tpl->newBlock("product_item");

                $tpl->assign("name", $rs['name']);
                $tpl->assign("intro", $rs['intro']);
                $tpl->assign("ma", $rs['ma']);
                $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);
                $tpl->assign("chuyenmuc", Category::categoryName($rs['id_category']));
                $tpl->assign("size", $rs['size']);
                if ($rs['icon'])
                    $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');

                $objProduct->showPrice($rs);

                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(400, 270, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

                $tpl->assign("ttkhuyenmai", str_replace("&nbsp;", " ", strstrim(strip_tags($rs['intro']), 20)));
                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
                $tpl->assign("linkcart", $dir_path . '/' . $lang_dir . 'addcart/' . $rs['url']);

            }
        }
    }

}

?>