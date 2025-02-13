<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("templates/home$mobile_temp.htm");
$tpl->prepare();

$tpl->assignGlobal("dir_path", $dir_path);
langsite();
$objProduct = new dbProduct();

$dbHome = new dbMenu;
$home = new clsHome;

$tpl->printToScreen();

class clsHome {

    function __construct() {
        global $DBi, $idc, $tpl, $dir_path, $cache_image_path, $SETTING, $dbHome;

        $tpl->assignGlobal("slideshow", slideshow());
        
        $db = $dbHome->selectByLocation('hothome');
        foreach ($db as $rs) {

            if ($rs['id_category'] > 0) {
                
                if ($rs['data_type'] == 'logo') {
                    
                }
                if ($rs['data_type'] == 'product') {

                }
                if ($rs['data_type'] == 'news') {
                    
                }

                if ($rs['data_type'] == 'info') {
                    $tpl->newBlock("infoHot");
					$tpl->assign("catname", $rs['catname']);
                    $tpl->assign("subname", html_entity_decode($rs['subname']));
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    $this->infoHot($rs['id_category']);
                }

            }
        }        
        
        $db = $dbHome->selectByLocation('cathome');
        foreach ($db as $rs) {

            if ($rs['id_category'] > 0) {
                if ($rs['data_type'] == 'logo') {
                    $tpl->newBlock("advhome");
                    $this->advHome($rs['id_category']);
                }
                if ($rs['data_type'] == 'album') {
                    $tpl->newBlock("albumHome");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("catintro", $rs['intro']);
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("idcat", $rs['id_category']);
                    $this->albumHome($rs['id_category']);
                }
                if ($rs['data_type'] == 'video') {
                    $tpl->newBlock("video");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("catintro", $rs['intro']);
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $this->videoHome($rs['id_category']);
                }
                if ($rs['data_type'] == 'product') {
                    $tpl->newBlock("product");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    /*
                    $menusub = $dbHome->listSubCat($rs['id_category']);
                    if (count($menusub) > 0) {
                        foreach ($menusub as $rs_sub) {
                            $tpl->newBlock("product_sub");
                            $tpl->assign("id_cat", $rs_sub['id_category']);
                            $tpl->assign("sub_catname", $rs_sub['name']);
                            $tpl->assign("sub_link", $dir_path . '/' . $rs_sub['url']);
                            $tpl->assign("sub_image", '<img src="' . $cache_image_path . cropimage(300, 250, $dir_path . '/' . $rs_sub['imageadv']) . '"  width="100%">');
                            $this->proHome($rs_sub['id_category']);
                        }
                    } else {
                        $this->proHome($rs['id_category']);
                    }
                    */
                    $this->proHome($rs['id_category']);
                }
                if ($rs['data_type'] == 'news') {
                    $tpl->newBlock("news");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    $this->newsHome($rs['id_category']);
                }

                if ($rs['data_type'] == 'info') {
                    $tpl->newBlock("info");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    if ($rs['image'])
                        $tpl->assign("catimage", '<img src="' . $rs['image'] . '" width="100%"  alt="' . $rs['name'] . '"  style="display:block"  >');
                    $this->infoHome($rs['id_category']);
                }
                if ($rs['data_type'] == 'service') {
                    $tpl->newBlock("serviceHome");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    $this->serviceHome($rs['id_category']);
                }
                if ($rs['data_type'] == 'article') {
                    $tpl->newBlock("article");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    $this->articleHome($rs['id_category']);
                }
                
                if ($rs['data_type'] == 'du_an') {
                    $tpl->newBlock("du_an");
                    $tpl->assign("catname", html_entity_decode($rs['subname']));
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    $this->duanHome($rs['id_category']);
                }                

                if ($rs['data_type'] == 'product_manufacture') {
                    $tpl->newBlock("manufactureHome");
                    $tpl->assign("catname", $rs['name']);
                    $tpl->assign("link", $dir_path . '/' . $rs['url']);
                    $tpl->assign("catintro", $rs['intro']);
                    $this->manufactureHome($rs['id_category']);
                }
            }
        }

        
        
        
        include_once("modules/inhome.php");
        $tpl->assignGlobal("inhome", inHome());
         
        /*
          $tpl->assignGlobal("menuProduct", menuProduct());
          $this->support_online();
         */
        
        include_once("modules/partner_logo.php");
        $tpl->assignGlobal("s_partner", partner_logo());
        
    }

    private function infoHot($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $SETTING;
        include_once('db.provider/db.info.php');
        $info = new dbInfo();
        $db = $info->itemList($idc, 10);
        foreach ($db as $rs) {
            if ($rs['id_info'] > 0) {
                $tpl->newBlock("infoHotItem");
                $tpl->assign(array(
                    name => $rs['name'],
                    intro => $rs['intro'] )
                );

                if ($rs['image']) {
                    //$tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 220, $dir_path . '/' . $rs['image']) . '" width="100%"  alt="' . $rs['name'] . '"  style="display:block" class="image-info-home" >');
					
					$tpl->assign("image", '<img src="' . $rs['image'] . '"  alt="' . $rs['name'] . '"  style="display:inline-block" class="image-info-home" >');
                    $tpl->assign("image_url", $rs['image']);
                }
                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            }
        }
    }    
    private function infoHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $SETTING;
        include_once('db.provider/db.info.php');
        $info = new dbInfo();
        $db = $info->itemList($idc, 1);
        foreach ($db as $rs) {
            if ($rs['id_info'] > 0) {
                $tpl->assign(array(
                    name => $rs['name'],
                    intro => $rs['intro'],
                    content => $rs['content'])
                );

                if ($rs['image']) {
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(385, 282, $dir_path . '/' . $rs['image']) . '" width="100%"  alt="' . $rs['name'] . '"  style="display:block" class="image-info-home" >');
                    $tpl->assign("image_url", $rs['image']);
                }
                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            }
        }
    }

    function videoHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $SETTING;
        $idc = intval($idc);
        
        $sql = "SELECT * FROM video WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_video DESC LIMIT 3"; 
        
        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("youtube");
            //$tpl->assign("video", $rs['video']);
            $tpl->assign("videocode", parseVideoUrl($rs['video']));

            if ($rs['image'])
                $image_src =  $cache_image_path . cropimage(600, 420, $dir_path . '/' . $rs['image']);
            else
                $image_src = 'https://img.youtube.com/vi/' . parseVideoUrl($rs['video']) . '/0.jpg';
            
            
            $tpl->assign("image", '<img src="' . $image_src . '" width="100%"  alt="' . $rs['name'] . '"  style="display:block">');
            
            $tpl->assign("name", $rs['name']);
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            
        }
    }

    function proHome($idc) {
        global $DBi, $tpl, $cache_image_path, $dir_path, $SETTING, $langLabel, $objProduct;
        
        $idc = intval($idc);
        $tpl->assign("id_cat", $idc);

        $db = $objProduct->itemList($idc, 10, $filter, $orderby);
        $i = 0;
        foreach ($db as $rs) {
            if ($rs['id_product'] > 0) {
                $i++;
                $tpl->newBlock("product_item");
                $tpl->assign("name", $rs['name']);
                $tpl->assign("ma", $rs['ma']);
                //$tpl->assign("tacgia", $pro->getManufactureName($rs['id_manufacture']));
                
                $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);
                
                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 210, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');
                
                if ($rs['icon'])
                    $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');
                
                $tpl->assign("link_cart", $dir_path . '/' . $lang_dir . 'addcart/' . $rs['url']);
                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
                /*
                $attr = $objProduct->getAttrDetail($rs['id_category'], $rs['attr']);
                foreach ($attr as $key => $val) {
                    $tpl->newBlock("attr");
                    $tpl->assign("attrname", $key);
                    $tpl->assign("attrvalue", $val);
                }
                */
                $tpl->assign("attribute",$objProduct->getAttr(intval($rs['id_category']),$rs['attr']));
                
                $objProduct->showPrice($rs);
                
                
                
            }
        }
    }

    function advHome($idc) {
        global $DBi, $tpl, $cache_image_path, $dir_path;
        $idc = intval($idc);
        $lg = new dbLogo;
        $dblg = $lg->logoList($idc);
        foreach ($dblg as $rs) {
            $tpl->newBlock("advItem");
            if ($rs['image']) {
                $tpl->assign("image", '<a href="' . $rs['link'] . '" target="' . $rs['target'] . '"><img src="' . $rs['image'] . '" width="100%" alt="' . $rs['name'] . '"></a>');
            } else {
                $tpl->assign("image", $rs['comment']);
            }
        }
    }

    function newsHot($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM news WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_news DESC LIMIT 5"; //.;
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("newshotItem");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 200, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');
            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", strstrim(strip_tags($rs['intro'], 15)));
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

    function newsHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM news WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_news DESC LIMIT 3"; 
        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("news_item");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(390, 250, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');
            $tpl->assign("createdate", date('d/m/Y', $rs['ngay_dang']));
            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", strip_tags($rs['intro']));
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
        /*
          while ($rs = $DBi->fetch_array($db)) {
          $i++;
          if ($i == 1) {
          $tpl->newBlock("bignews");
          if ($rs['image'])
          $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 180, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');
          } else {
          $tpl->newBlock("news_item");
          if ($rs['image'])
          $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 180, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');
          }
          $tpl->assign("createdate", date('d/m/Y', $rs['ngay_dang']));
          $tpl->assign("intro", strstrim(strip_tags($rs['intro']), 20));
          $tpl->assign("name", $rs['name']);
          $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
          }
         */
    }

    function serviceHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM service WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_service DESC LIMIT 4"; //.;
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("serviceItem");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(600, 400, $dir_path . '/' . $rs['image']) . '" width="100%" alt="' . $rs['name'] . '">');
            if ($rs['imageadv'])
                $tpl->assign("icon", '<img src="' . $rs['imageadv'] . '"  alt="' . $rs['name'] . '">');
            $tpl->assign("intro", strstrim(strip_tags($rs['intro']), 20));

            $tpl->assign("name", $rs['name']);
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

    function articleHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM article WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_article DESC LIMIT 5"; //.;
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("articleItem");
            $tpl->assign(array(
                id => $rs['id_article'],
                name => $rs['name'],
                author_name => $rs['author_name'],
                author_info => $rs['author_info'],
                link_detail => $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']
            ));
            $tpl->assign("intro", strip_tags($rs['intro']));
            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(311, 311, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" />');
        }
    }
    
    

    function duanHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM du_an WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%')  ORDER BY thu_tu DESC LIMIT 4";
        $db = $DBi->query($sql);
        $i = 0;
        while ($rs = $DBi->fetch_array($db)) {
            $i++;
            
            $tpl->newBlock("duanItem");
            
            if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 150, $dir_path . '/' . $rs['image']) . '" width="100%" alt="' . $rs['name'] . '">');
            
            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", strstrim(strip_tags($rs['intro']), 30));
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            
        }
    }

    function albumHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM album WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_album DESC LIMIT 3"; 
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("albumItem");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(600, 400, $dir_path . '/' . $rs['image']) . '" width="100%" alt="' . $rs['name'] . '">');
            $tpl->assign("name", $rs['name']);
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
			$this->sliderAlbumImage($rs['image_list']);
        }
    }
	
    private function sliderAlbumImage($image_list) {
        global $DBi, $tpl, $dir_path, $cache_image_path;
        $images = json_decode($image_list);
        usort($images, function($a, $b) {
            return $a->image_thu_tu > $b->image_thu_tu ? 1 : -1;
        });

        foreach ($images as $rs) {
            $tpl->newBlock("album_item_image");
            $tpl->assign(array(
                name => $rs->image_name,
                thu_tu => $rs->image_thu_tu,
                image_desc => $rs->image_desc
            ));

            $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(400, 320, $dir_path . '/' . $rs->image_path) . '" alt="' . $rs->image_name . '" title="' . $rs->image_name . '" width="100%" />');

            $tpl->assign("bigimage_url", $cache_image_path . resizeimage(1200, 1200, $dir_path . '/' . $rs->image_path));
        }
        $tpl->assignGlobal("item_paged", $db['pages']);
    }	

    function support_online() {
        global $DBi, $tpl, $cache_image_path, $dir_path, $SETTING, $language;
        $db = $DBi->query("SELECT * FROM yahoo WHERE active = 1 $language ORDER BY thu_tu");
        $tpl->assign("emailsupport", $SETTING->emailsupport);
        $tpl->assign("yahoosupport", $SETTING->yahoosupport);
        $tpl->assign("skypesupport", $SETTING->skypesupport);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("support_item");
            $tpl->assign("sky", $rs["sky"]);
            $tpl->assign("nic", $rs["nic"]);
            $tpl->assign("name", $rs["name"]);
            $tpl->assign("phone", $rs["phone"]);
        }
    }

    function manufactureHome($idc) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM product_manufacture WHERE active=1 AND id_category IN(" . Category::getParentId($idc) . ") ORDER BY thu_tu";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("manufactureItem");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(180, 100, $dir_path . '/' . $rs['image']) . '" width="100%" alt="' . $rs['name'] . '">');
            $tpl->assign("name", $rs['name']);
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }



}

?>