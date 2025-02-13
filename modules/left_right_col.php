<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

$tpl1;

function left_right_col() {

    global $DBi, $dir_path, $lang_dir, $tpl1, $cache_image_path, $CONFIG, $page;

    $tpl1 = new TemplatePower("templates/left_right_col.htm");

    $tpl1->prepare();


    $tpl1->assignGlobal("lang", $lang);
    $tpl1->assignGlobal("lang_dir", $lang_dir);

    langsite($tpl1);
    $dbMenu = new dbMenu();

    $tpl1->assignGlobal("menuleft", menuleft());
	
    //$tpl1->assignGlobal("menuProduct", menuProduct());



    $dbright = $dbMenu->selectByLocation('inright');

    foreach ($dbright as $rs) {
        if ($rs['id_category'] > 0) {

            if ($rs['data_type'] == 'logo') {

                $tpl1->newBlock("advRight");
                $tpl1->assign("catname", $rs['name']);
				
                advRightSlide($tpl1, $rs['id_category']);
            }

            if ($rs['data_type'] == 'video') {

                $tpl1->newBlock("video");
                $tpl1->assign("catname", $rs['name']);
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
                $tpl1->assign('catimage', '<img src="' . $cache_image_path . cropimage(32, 32, $dir_path . '/' . $rs['image']) . '"  >');
                videoLeft($rs['id_category']);
            }

            if ($rs['data_type'] == 'news') {
                $tpl1->newBlock("news");
                
                $tpl1->assign("catname", $rs['name']);
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
                $tpl1->assign("id_category", $rs['id_category']);
                $tpl1->assign('catimage', '<img src="' . $cache_image_path . cropimage(32, 32, $dir_path . '/' . $rs['imageadv']) . '"  >');
                newsRight($rs['id_category']);
            }

            if ($rs['data_type'] == 'tuvan') {
                $tpl1->newBlock("tuvan");
                $tpl1->assign("catname", $rs['name']);
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
                $tpl1->assign("id_category", $rs['id_category']);
                $tpl1->assign('catimage', '<img src="' . $cache_image_path . cropimage(32, 32, $dir_path . '/' . $rs['imageadv']) . '"  >');
                tuvanRight($rs['id_category']);
            }

            if ($rs['data_type'] == 'product') {
                $tpl1->newBlock("right");
                $tpl1->newBlock("product");
                $tpl1->assign("catname", $rs['name']);
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
                $tpl1->assign("id_category", $rs['id_category']);
                $tpl1->assign('catimage', '<img src="' . $cache_image_path . cropimage(32, 32, $dir_path . '/' . $rs['image']) . '"  >');
                productRight($rs['id_category']);
            }
        }
    }


    support_online();

    return $tpl1->getOutputContent();
}

function advRight($tpl1, $idc) {

    global $DBi, $cache_image_path, $dir_path;
    $idc = intval($idc);
    $lg = new dbLogo;
    $dblg = $lg->logoList($idc);

    foreach ($dblg as $rs) {
        $tpl1->newBlock("advRight");
        if ($rs['image']) {
            $tpl1->assign("image", '<a href="' . $rs['link'] . '" target="' . $rs['target'] . '"><img src="' . $rs['image'] . '" width="100%" alt="' . $rs['name'] . '"></a>');
        } else {
            $tpl1->assign("image", $rs['comment']);
        }
    }
}

function advRightSlide($tpl1, $idc) {

    global $DBi, $tpl1, $cache_image_path, $dir_path;
    $idc = intval($idc);
    $lg = new dbLogo;
    $dblg = $lg->logoList($idc);


    foreach ($dblg as $rs) {
        $tpl1->newBlock("advRightSlide");
        if ($rs['image']) {
            $tpl1->assign("image", '<a href="' . $rs['link'] . '" target="' . $rs['target'] . '"> <img src="' . $rs['image'] . '" width="100%" alt="' . $rs['name'] . '"/></a>');
        } else {
            $tpl1->assign("image", $rs['comment']);
        }
    }
}

function newsRight($idc) {

    global $DBi, $tpl1, $cache_image_path, $dir_path, $SETTING, $tags_news;
    $idc = intval($idc);
    $news = new dbNews();

    $tpl1->assign("news.idcat", $idc);

    $dbnews = $news->newsList($idc, 4);

    $i = 0;
    foreach ($dbnews as $rs) {
        if ($rs['id_news'] > 0) {
            $i++;
            $tpl1->newBlock("itemnews");
            $tpl1->assign("createdate", '<div class="createdateleft">' . date('d/m/Y', $rs['ngay_dang']) . '</div>');
            if ($rs['image']) {
                $tpl1->assign('image', '<img src="' . $cache_image_path . cropimage(130, 80, $dir_path . '/' . $rs['image']) . '" width="100%" alt="' . $rs['name'] . '" class="image-news-left">');
            }
            $tpl1->assign("newsname", $rs['name']);
            $tpl1->assign("intro", strip_tags($rs['intro']));
            $tpl1->assign('link_detail', $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }
}

function tuvanRight($idc) {

    global $DBi, $tpl1, $cache_image_path, $dir_path, $SETTING, $tags_news;
    $idc = intval($idc);
    $tuvan = new dbTuVan();

    $dbnews = $tuvan->itemList($tags_news, 5);

    $i = 0;
    foreach ($dbnews as $rs) {
        if ($rs['id_tuvan'] > 0) {
            $i++;
            $tpl1->newBlock("item_tuvan");
            $tpl1->assign("createdate", '<div class="createdateleft">' . date('d/m/Y', $rs['ngay_dang']) . '</div>');
            if ($rs['image']) {
                $tpl1->assign('image', '<img src="' . $cache_image_path . cropimage(103, 78, $dir_path . '/' . $rs['image']) . '" width="100%" alt="' . $rs['name'] . '" class="image-news-left">');
            }
            $tpl1->assign("name", $rs['name']);
            $tpl1->assign("intro", $rs['intro']);
            $tpl1->assign('link_detail', $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }
}

function newsSlidesRight($idc) {

    global $DBi, $tpl1, $cache_image_path, $dir_path, $SETTING;
    $idc = intval($idc);
    $news = new dbNews();
    $dbnews = $news->newsList($idc, 10);
    $i = 0;
    foreach ($dbnews as $rs) {
        if ($rs['id_news'] > 0) {
            $i++;
            $tpl1->newBlock("slides_news_item");
            if ($rs['image'])
                $tpl1->assign('image', '<img src="' . $cache_image_path . resizeimage1(320, 210, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%">');


            $tpl1->assign("newsname", $rs['name']);
            $tpl1->assign('link_detail', $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }
}

function articleSlidesRight($idc) {
    global $DBi, $tpl1, $cache_image_path, $dir_path, $SETTING;
    $idc = intval($idc);
    $article = new dbArticle();
    $db = $article->itemList($idc, 10);
    $i = 0;
    foreach ($db as $rs) {
        if ($rs['id_article'] > 0) {
            $i++;
            $tpl1->newBlock("slides_article_item");
            if ($rs['image'])
                $tpl1->assign('image', '<img src="' . $cache_image_path . cropimage(160, 160, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%">');


            $tpl1->assign("name", $rs['name']);
            $tpl1->assign("intro", $rs['intro']);
            $tpl1->assign("author_name", $rs['author_name']);
            $tpl1->assign("author_info", $rs['author_info']);

            $tpl1->assign('linkdetail', $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }
}

function photoLeft($idc) {
    global $DBi, $tpl1, $dir_path, $cache_image_path;
    $sql = "SELECT * FROM category WHERE active=1 AND id_category = $idc ORDER BY thu_tu DESC, name ASC LIMIT 1";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        $tpl1->newBlock("photo");
        $tpl1->assign("name", $rs['name']);
        $tpl1->assign("link", $dir_path . '/' . $rs['url']);
        if ($rs['image']) {
            $tpl1->assign("image", '<img src="' . $cache_image_path . cropimage(230, 152, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '">');
        }
    }
}

function videoLeft($idc) {
    global $DBi, $tpl1, $dir_path, $cache_image_path;
    $idc = intval($idc);

    $sql = "SELECT * FROM video WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_video DESC LIMIT 5"; 
    $db = $DBi->query($sql);
    $n = 0;
    while ($rs = $DBi->fetch_array($db)) {
        $n++;
        if ($n == 1) {
            $tpl1->newBlock("youtube");
            $tpl1->assign("video", $rs['video']);
            $tpl1->assign("videocode", parseVideoUrl($rs['video']));

            if ($rs['image'])
                $image_src =  $cache_image_path . cropimage(600, 489, $dir_path . '/' . $rs['image']);
            else
                $image_src = 'https://img.youtube.com/vi/' . parseVideoUrl($rs['video']) . '/0.jpg';
            
            $tpl1->assign("image", '<img src="' . $image_src . '" width="100%"  alt="' . $rs['name'] . '"  style="display:block">');                    
                
            $tpl1->assign("name", $rs['name']);
            $tpl1->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        } else {
            $tpl1->newBlock("other_video");
            $tpl1->assign("name", $rs['name']);
            $tpl1->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            $tpl1->assign("image", 'http://img.youtube.com/vi/' . parseVideoUrl($rs['video']) . '/0.jpg');
        }
    }
}

function productRight($idc) {
    global $DBi, $tpl1, $dir_path, $cache_image_path, $langLabel;
    $idc = intval($idc);
    $sql = "SELECT * FROM product WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR  groupcat IN(" . $idc . ")) ORDER BY thu_tu DESC, name ASC LIMIT 5";
    $db = $DBi->query($sql);
    while ($rs = $DBi->fetch_array($db)) {
        $tpl1->newBlock("itemproduct");
        $tpl1->assign("name", $rs['name']);
        if ($rs['image']) {
            $tpl1->assign("image", '<img src="' . $cache_image_path . resizeimage1(200, 300, $dir_path . $rs['image']) . '" alt="' . $rs['name'] . '" class="image-product-left">');
        }
        $tpl1->assign('link_detail', $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        $tpl1->assign("intro", strstrim(strip_tags($rs['intro']), 10));

        if (intval($rs1['pricekm']) > 0) {
            $tpl1->assign("price", $_giakm . number_format($rs1['pricekm']) . ' đ');
            $tpl1->assign("pricekm", $_giasp . number_format($rs1['price']) . ' đ');
        } else {
            if (intval($rs1['price']) > 0)
                $tpl1->assign("price", $_giasp . number_format($rs1['price']) . ' đ');
            else
                $tpl1->assign("price", $rs1['price']);
        }


        if (intval($rs['pricekm']) > 0) {
            $tpl1->assign("price", $langLabel['_giakm'] . number_format($rs['pricekm']) . ' đ');
            $tpl1->assign("pricekm", $langLabel['_giasp'] . number_format($rs['price']) . ' đ');
        } else {
            if (intval($rs['price']) > 0) {
                $tpl1->assign("price", $langLabel['_giasp'] . number_format($rs['price']) . ' đ');
            } else {
                if (intval($rs['price']) == 0) {
                    
                } else {
                    $tpl1->assign("price", $rs['price']);
                }
            }
        }
    }
}

function support_online() {
    global $DBi, $tpl1, $cache_image_path, $dir_path, $SETTING, $language;
    $db = $DBi->query("SELECT * FROM yahoo WHERE active = 1 $language ORDER BY thu_tu");

    $tpl1->assign("emailsupport", $SETTING->emailsupport);
    $tpl1->assign("yahoosupport", $SETTING->yahoosupport);
    $tpl1->assign("skypesupport", $SETTING->skypesupport);

    while ($rs = $DBi->fetch_array($db)) {
        $tpl1->newBlock("support_item");

        $tpl1->assign("sky", $rs["sky"]);
        $tpl1->assign("nic", $rs["nic"]);
        $tpl1->assign("name", $rs["name"]);
        $tpl1->assign("phone", $rs["phone"]);
    }
}

?>