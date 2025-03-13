<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$template_name = $cateinfo['template_name'];
if ($template_name)
    $tpl = new TemplatePower("templates/$template_name.htm");
else
    $tpl = new TemplatePower("templates/article.htm");
$tpl->prepare();
langsite();
$tpl->assignGlobal("dir_path", $dir_path);
$tpl->assignGlobal("site_address", $site_address);
$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '"><i class="fa fa-home"></i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');

$tpl->assignGlobal("catname", $rs_cat['name']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);
if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');
include_once('modules/db.provider/db.article.php');
$article = new dbArticle();
if (!$id) {
    itemList();
} else {
    itemDetail();
}
$tpl->printToScreen();

function itemList() {
    global $DB, $tpl, $cache_image_path, $article, $dir_path, $idc, $SETTING;
    $db = $article->itemList($idc, 18);
    $tpl->newBlock("itemList");
    $i = 0;
    $ids = "0";
    foreach ($db as $rs) {
        if ($rs['id_article'] > 0) {
            $ids .= ",$rs[id_article]";
            $tpl->newBlock("newsItem");


            $tpl->assign(array(
                id => $rs['id_article'],
                name => $rs['name'],
                author_name => $rs['author_name'],
                author_info => $rs['author_info'],
                intro => strip_tags($rs['intro']),
                newsdate => date("H:i d/m/Y", $rs['ngay_dang']),
                content => ($rs['content']),
                link_detail => $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']
            ));
            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(200, 200, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" />');


            $i++;
        }
    }
    $tpl->assign("newsCat.page", $db['pages']);
}

function itemDetail() {
    global $DB, $article, $id, $idc, $tpl, $dir_path, $cache_image_path;
    $tpl->newBlock("itemDetail");
    $rs = $article->itemDetail($id);
    if ($rs) {
        $tpl->assign(array(
            name => $rs['name'],
            author_name => $rs['author_name'],
            author_info => $rs['author_info'],
            intro => $rs['intro'],
            content => $rs['content'],
        ));

        if ($rs['image'])
            $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(200, 200, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" />');
        $newsold = $article->item_other($idc, $id);
        if (count($newsold) > 0) {
            foreach ($newsold as $rse) {
                if ($rse['id_article'] > 0) {
                    $tpl->newBlock("lstOther");
                    $tpl->assign("name", $rse['name']);
                    $tpl->assign("author_name", $rse['author_name']);
                    $tpl->assign("author_info", $rse['author_info']);
                    $tpl->assign("link_detail", $dir_path . "/" . url_process::getUrlCategory($rse['id_category']) . $rse['url']);
                }
            }
        }
    }
}

?>