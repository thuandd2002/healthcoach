<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$template_name = $cateinfo['template_name'];
if ($template_name)
    $tpl = new TemplatePower("templates/$template_name.htm");
else
    $tpl = new TemplatePower("templates/du_an.htm");
$tpl->prepare();


$tpl->assignGlobal("dir_path", $dir_path);
$tpl->assignGlobal("site_address", $site_address);
$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '"> ' . $langLabel['_home'] . ' </a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');
langsite();

include_once('modules/db.provider/db.duan.php');
$objDuan = new dbDuAn();

$tpl->assignGlobal("menutab", menutab($root_idc));

include_once("modules/left_right_col.php");
$leftcol = left_right_col();
$tpl->assignGlobal("leftcol", $leftcol);

$tpl->assignGlobal("catname", $rs_cat['name']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);
if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');
if ($rs_cat['image'])
    $tpl->assignGlobal("catimage", '<img  src="' . $rs_cat['image'] . '" />');
if ($rs_cat['image'])
    $tpl->assignGlobal("catimageurl", $rs_cat['image']);
if (strlen($rs_cat['content_text']) > 7)
    $tpl->assignGlobal("content_text", $rs_cat['content_text']);


$DA = new clsDuAn;
$tpl->printToScreen();

class clsDuAn {

    function __construct() {
        global $DBi, $tpl, $dir_path, $cache_image_path, $SETTING, $objDuan, $idc, $id;
        if ($id > 0) {
            $tpl->newBlock("detail");
            $this->detail($id);
        } else {
            $tpl->newBlock("lstcat");
            $this->lstDuAn($idc);
        }
    }

    function lstDuAn($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $SETTING, $objDuan;
        $db = $objDuan->itemList($idc);
        foreach ($db as $rs) {
            if ($rs['id_duan'] > 0) {
                $tpl->newBlock("lstDuAn");
                $tpl->assign("name", $rs['name']);
                $tpl->assign("intro", strip_tags($rs['intro']));

                /*
                  $tpl->assign("sophong",$rs['sophong']);
                  $tpl->assign("dientich",$rs['dientich']);
                 */
                if ($rs['image']) {
                    $image = $cache_image_path . cropimage(576, 387, $dir_path . '/' . $rs['image']);
                    $tpl->assign("image", '<img  src="' . $image . '" alt="' . $rs['name'] . '" width="100%">');
                }

                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            }
        }
    }
    
    function detail($id) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $SETTING, $objDuan, $idc;
        $rs = $objDuan->itemDetail($id);
        $tpl->assign("name", $rs['name']);
        $tpl->assign("intro", $rs['intro']);
        $tpl->assign("content", $rs['content']);
        $tpl->assign("tienich", $rs['tienich']);
        
		$tpl->assignGlobal("thumbimage", $this->sliderImage($rs['image_list']));
		
        $db = $objDuan->item_other($idc,$rs['id_duan']);
		
        foreach ($db as $rs) {
                $tpl->newBlock("itemOther");
                $tpl->assign("name", $rs['name']);
                $tpl->assign("intro", $rs['intro']);
                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(400, 280, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            
        }
        
        
        
        
    }    

    private function sliderImage($image_list) {
        global $DBi, $tpl, $dir_path, $cache_image_path;

        $images = json_decode($image_list);
        
        usort($images, function($a, $b) { 
                return $a->image_thu_tu > $b->image_thu_tu ? 1 : -1; 
        }); 		

        $thumbimage = '';

        foreach ($images as $rs) {
            $tpl->newBlock("slider_image");
            $tpl->assign(array(
                name => $rs->image_name,
                thu_tu => $rs->image_thu_tu,
                image_desc => $rs->image_desc
            ));

            $tpl->assign("image", '<img  src="' . $cache_image_path . resizeimage1(1000, 600, $dir_path . '/' . $rs->image_path) . '" alt="' . $rs->image_name . '" title="' . $rs->image_name . '" width="100%" />');

            $tpl->assign("bigimage", $site_address .  $rs->image_path);

            $thumbimage .= '<div class="swiper-slide"><img src="' . $cache_image_path . cropimage(100 * 2, 60 * 2, $dir_path . '/' . $rs->image_path) . '" width="100%"/> </div>';
        }
        return $thumbimage;
    }    
    

}

?>