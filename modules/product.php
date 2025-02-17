<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

$template_name = $cateinfo['template_name'];
if ($template_name)
    $tpl = new TemplatePower("templates/$template_name.htm");
else
    $tpl = new TemplatePower("templates/product.htm");

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

  include_once("modules/left_right_col.php");
  $leftcol = left_right_col();
  $tpl->assignGlobal("leftcol", $leftcol);
 */

if ($id == 0)
    $tpl->assignGlobal("slideshow", slidechild());



$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '">Trang chủ</a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');


//$root_idc = Category::get_root_category_id($idc);
//echo $root_idc;
/*
  $dbProduct = dbMenu::listSubCat($root_idc);
  $arr = explode(",", $activeid);
 */

$tpl->assignGlobal("hotline", $SETTING->hotline);
$tpl->assignGlobal("companyemail", $SETTING->companyemail);

$tpl->assignGlobal("idcat", $idc);


$objProduct = new dbProduct();
$product = new clsProduct();
$tags_news = $product->_construct();
$tpl->printToScreen();

class clsProduct {

    public function _construct() {
        global $DBi, $tpl, $dir_path, $idc, $id, $cache_image_path, $rs_cat, $root_idc;

        // $tpl->assignGlobal("slideshow", slideshow());
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

            if (Category::checkChildCat($idc) && ($rs_cat['id_category'] == $root_idc )) {

                $tpl->newBlock("productCatList");
                $this->productCatList();
            } else {

                if (Category::checkChildCat($idc)) {
                    $tpl->assignGlobal("menutab", menutab($rs_cat['id_category']));
                }

                $tpl->newBlock("productList");
                $this->productList();
            }
        }
    }

    function productCatList() {
        global $DBi, $tpl, $objProduct, $idc, $dir_path, $cache_image_path, $SETTING, $langLabel;

        $db1 = dbMenu::listSubCat($idc);
        foreach ($db1 as $rs1) {
            $tpl->newBlock("catItem");
            $tpl->assign("catname", $rs1['name']);
            $tpl->assign("catContentItem", strstrim(strip_tags($rs1['content']), 60));
            $tpl->assign("linkcat", $dir_path . '/' . $rs1['url']);
            if ($rs1['image']) {
                $image = $cache_image_path . cropimage(400, 270, $dir_path . '/' . $rs1['image'], false);

                $tpl->assign("catimage", '<img src="' . $image . '" alt="' . $rs1['name'] . '" width="100%">');
            }

            $db = $objProduct->itemList($rs1['id_category'], 8);
            $i = 0;
            foreach ($db as $rs) {
                if ($rs['id_product'] > 0) {
                    $i++;
                    $tpl->newBlock("catProductItem");

                    $tpl->assign("name", $rs['name']);
                    $tpl->assign("intro", $rs['intro']);
                    $tpl->assign("ma", $rs['ma']);
                    $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);

                    $tpl->assign("hangsx", $objProduct->getManufactureName($rs['id_manufacture']));
                    //$tpl->assign("size", $rs['size']);

                    if ($rs['icon'])
                        $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');

                    $tpl->assign("attribute", $objProduct->getAttr(intval($rs['id_category']), $rs['attr']));
                    $objProduct->showPrice($rs);

                    if ($rs['image'])
                        $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 300, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

                    $tpl->assign("ttkhuyenmai", str_replace("&nbsp;", " ", strstrim(strip_tags($rs['intro']), 20)));
                    $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
                    $tpl->assign("linkcart", $dir_path . '/' . $lang_dir . 'addcart/' . $rs['url']);
                }
            }
        }
    }

    public function productList() {
        global $DBi, $idc, $tpl, $objProduct, $dir_path, $cache_image_path;

        /*
          $s = clean_value($_GET['s']);
          if($s == 'gia-thap-den-cao'){
          $orderby = "ORDER BY CONVERT(price, UNSIGNED) ASC";
          $tpl->assignGlobal("gia_thap_den_cao","selected");
          }else if($s == 'gia-cao-den-thap'){
          $orderby = "ORDER BY CONVERT(price, UNSIGNED) DESC";
          $tpl->assignGlobal("gia_cao_den_thap","selected");
          }
         */


        $db = $objProduct->itemList($idc, 18);
        $i = 0;
        foreach ($db as $rs) {
            if ($rs['id_product'] > 0) {
                $i++;
                $tpl->newBlock("product_item");

                $tpl->assign("name", $rs['name']);
                $tpl->assign("intro", $rs['intro']);
                $tpl->assign("ma", $rs['ma']);
                $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);

                $tpl->assign("hangsx", $objProduct->getManufactureName($rs['id_manufacture']));

                //$tpl->assign("size", $rs['size']);

                if ($rs['icon'])
                    $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');

                $tpl->assign("attribute", $objProduct->getAttr(intval($rs['id_category']), $rs['attr']));
                $objProduct->showPrice($rs);

                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 300, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

                $tpl->assign("ttkhuyenmai", str_replace("&nbsp;", " ", strstrim(strip_tags($rs['intro']), 20)));
                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
                $tpl->assign("linkcart", $dir_path . '/' . $lang_dir . 'addcart/' . $rs['url']);
            }
        }

        $tpl->assignGlobal("pages", $db['pages']);
    }

    function proDetail($id) {
        global $DBi, $idc, $tpl, $objProduct, $dir_path, $cache_image_path, $SETTING, $site_address;
        $rs = $objProduct->itemDetail($id);

        $tpl->assignGlobal("hotline", $SETTING->hotline);
        if (intval($rs['id_product']) > 0) {
            $tpl->assignGlobal("name", $rs['name']);
            $tpl->assignGlobal("ma", $rs['ma']);

            $tpl->assignGlobal("hangsx", $objProduct->getManufactureName($rs['id_manufacture']));
            $tpl->assignGlobal("xuatxu", $objProduct->getMaterialName($rs['id_material']));
            $objProduct->showPrice($rs);

            $tpl->assign("linkcart", $dir_path . '/' . $lang_dir . 'addcart/' . $rs['url']);
            $tpl->assign("fileurl", $rs['fileurl']);

            if ($rs['description'])
                $tpl->assign("description", $rs['description']);
            else
                $tpl->assign("description", strstrim($rs['intro'], 100));
            $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", $rs['content']);
            $tpl->assign("contenttab0", $rs['contenttab0']);
            $tpl->assign("contenttab1", $rs['contenttab1']);

            if ($rs['image']) {
                $tpl->assign("image_first", $cache_image_path . cropimage(500, 500, $dir_path . '/' . $rs['image']));
                $tpl->assign("bigimage_first", $rs['image']);
                $tpl->assignGlobal("thumb_image_first", $cache_image_path . cropimage(100, 100, $dir_path . '/' . $rs['image']));
                $tpl->assign("image", $site_address . $cache_image_path . cropimage(500, 500, $dir_path . '/' . $rs['image']));
            }

            $tpl->assignGlobal("id_product", $rs['id_product']);
            $tpl->assign("proDetail.thumbimage", $this->sliderImage($rs['image_list']));

            $attr = $objProduct->getAttrDetail($rs['id_category'], $rs['attr']);
            foreach ($attr as $key => $val) {
                $tpl->newBlock("attr");
                $tpl->assign("attrname", $key);
                $tpl->assign("attrvalue", $val);
            }

            $tpl->assignGlobal("link_detail_pro", $site_address . $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);

            /*
            $product_ver = json_decode($rs['product_ver']);
            foreach ($product_ver as $key => $value) {
                $tpl->newBlock("phienban");
                $tpl->assign("tenphienban", $value->tenphienban);
                $tpl->assign("motaphienban", $value->motaphienban);
                $tpl->assign("giaphienban", number_format($value->giaphienban));
                $tpl->assign("gianumber", $value->gianumber);
            }
            */
            
            
            $this->sp_cungdanhmuc($rs['id_category']);
            $this->sp_lienquan($rs['spcungloai']);

            /*
            $this->showManufactory($rs['id_manufacture']);
            $this->relate_project($rs['relate_project']);
            $this->productManufactory($rs['id_manufacture']);
            */

            /*
              include_once("modules/comment.php");
              $tpl->assignGlobal("comments", getComments($id, 'product', 'id_product'));
             */
			 
			 
			//unset($_COOKIE['viewed_product']);			
			/*
			$product_viewed = array(0);
			if(!isset($_COOKIE["viewed_product"])) {
				$product_viewed[] = $id;
				setcookie("viewed_product", json_encode($product_viewed), time() + (86400 * 7), "/"); // 86400 = 1 day x 7 ngay
			} else {
				$product_viewed = json_decode( $_COOKIE['viewed_product'] );
				if (!in_array($id , $product_viewed )) {
					$product_viewed[] = $id;
					setcookie("viewed_product", json_encode($product_viewed), time() + (86400 * 7), "/"); // 86400 = 1 day x 7 ngay
				}
				$list_id_viewed = $_COOKIE['viewed_product'];
				$this->viewed_product($list_id_viewed);
			}			 
			*/ 
			 
        }
    }
	
	
    private function viewed_product($listid) {
        global $DBi, $idc, $tpl, $objProduct, $dir_path, $cache_image_path;

        if (strlen($listid) != "")
            $tpl->newBlock("viewed_product");

        $db = $objProduct->sanphamdaxem($listid);
        $i = 0;
        foreach ($db as $rs) {
            if ($rs['id_product'] > 0) {
                $tpl->newBlock("viewed_product_item");
                $tpl->assign("ma", $rs['ma']);
                $tpl->assign("name", $rs['name']);

                $tpl->assign("attribute", $objProduct->getAttr(intval($rs['id_category']), $rs['attr']));
                if ($rs['icon'])
                    $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');

                $objProduct->showPrice($rs);

                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(360, 360, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%">');

                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
				
            }
        }
    }	

    private function showManufactory($id_tacgia) {
        global $DBi, $tpl, $objProduct, $dir_path, $cache_image_path, $langLabel;
        $id_tacgia = intval($id_tacgia);
        $rs = $objProduct->getManufactureDetail($id_tacgia);
        if ($rs['id'] > 0) {
            $tpl->newBlock("tacgia");
            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", strstrim(strip_tags($rs['content']), 100));
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(310, 360, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

    private function productManufactory($id_manufacture) {
        global $DBi, $idc, $tpl, $objProduct, $dir_path, $cache_image_path;
        $id_manufacture = intval($id_manufacture);

        $db = $objProduct->product_manufactory($id_manufacture);
        $i = 0;
        foreach ($db as $rs) {
            if ($rs['id_product'] > 0) {
                $tpl->newBlock("relate_product_item");
                $tpl->assign("ma", $rs['ma']);
                $tpl->assign("name", $rs['name']);

                $tpl->assign("chuyenmuc", Category::categoryName($rs['id_category']));
                $tpl->assign("size", $rs['size']);
                if ($rs['icon'])
                    $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');

                $tpl->assign("attribute", $objProduct->getAttr(intval($rs['id_category']), $rs['attr']));
                $objProduct->showPrice($rs);

                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 300, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%">');



                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            }
        }
    }

    private function relate_project($lstID) {
        global $DBi, $id, $tpl, $dir_path, $cache_image_path, $langLabel;

        if ($lstID != "")
            $tpl->newBlock("relate_project");

        $sql = "SELECT * FROM du_an WHERE active = 1 AND id_duan IN(" . $lstID . ") ORDER BY id_duan DESC";

        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("relate_project_item");
            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("tienich", $rs['tienich']);
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(400, 280, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

    private function sp_cungdanhmuc($id_category) {
        global $DBi, $id, $tpl, $objProduct, $dir_path, $cache_image_path, $langLabel;

        $db = $objProduct->other_product($id, $id_category);
        $i = 0;
        foreach ($db as $rs) {
            if ($rs['id_product'] > 0) {
                $i++;

                $tpl->newBlock("other_products");

                $tpl->assign("name", $rs['name']);
                $tpl->assign("ma", $rs['ma']);
                if ($rs['icon'])
                    $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');
                //$tpl->assign("tacgia", $objProduct->getManufactureName($rs['id_manufacture']));
                //$tpl->assign("size", $rs['size']);
                $tpl->assign("attribute", $objProduct->getAttr(intval($rs['id_category']), $rs['attr']));
                $objProduct->showPrice($rs);

                $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);
                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 300, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            }
        }
    }

    private function sp_lienquan($listid) {
        global $DBi, $idc, $tpl, $objProduct, $dir_path, $cache_image_path;

        if (strlen($listid) != "")
            $tpl->newBlock("sp_lienquan");

        $db = $objProduct->splienquan($listid);
        $i = 0;
        foreach ($db as $rs) {
            if ($rs['id_product'] > 0) {
                $tpl->newBlock("relate_product_item");
                $tpl->assign("ma", $rs['ma']);
                $tpl->assign("name", $rs['name']);

                //$tpl->assign("tacgia", $objProduct->getManufactureName($rs['id_manufacture']));
                //$tpl->assign("size", $rs['size']);
                $tpl->assign("attribute", $objProduct->getAttr(intval($rs['id_category']), $rs['attr']));
                if ($rs['icon'])
                    $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');

                $objProduct->showPrice($rs);

                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 300, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%">');



                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            }
        }
    }

	private function sliderImage($image_list) {
        global $DBi, $tpl, $dir_path, $cache_image_path;

        $images = json_decode($image_list);
		
		usort($images, function($a, $b) { 
			return $a->image_thu_tu < $b->image_thu_tu ? -1 : 1; 
		});
		
		
        $thumbimage = '';

        foreach ($images as $rs) {
            $tpl->newBlock("slider_image");
            $tpl->assign(array(
                name => $rs->image_name,
                thu_tu => $rs->image_thu_tu,
                image_desc => $rs->image_desc
            ));
            
            $image_path = $dir_path . '/' . $rs->image_path;
            $image_path = str_replace("//", "/", $image_path);
            $image_path = str_replace("//", "/", $image_path);
            
            $tpl->assign("image", '<img  src="' . $cache_image_path . resizeimage1(600, 600, $image_path) . '" alt="' . $rs->image_name . '" title="' . $rs->image_name . '" width="100%" />');
            $tpl->assign("bigimage", '<img  src="' . $image_path . '" alt="' . $rs->image_name . '" title="' . $rs->image_name . '" width="100%" />');
            $tpl->assign("bigimage_url", $image_path );

            $thumbimage .= '<div class="swiper-slide"><img src="' . $cache_image_path . cropimage(50 * 2, 50 * 2, $image_path) . '" width="100%"/> </div>';
        }
        return $thumbimage;
    }

}

?>