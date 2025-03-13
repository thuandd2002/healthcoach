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
    $tpl = new TemplatePower("templates/news.htm");
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

include_once("modules/menu.php");
$menuleft = menuleft();
$tpl ->assignGlobal('menu_left', $menuleft);


$tpl->assignGlobal("menutab", menutab($root_idc));

$tpl->assignGlobal("catname", $rs_cat['name']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);

if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');



$objNews = new dbNews();

$news = new clsNews();

class clsNews
{

    public function __construct()
    {
        global $DBi, $tpl, $dir_path, $idc, $id, $cache_image_path, $rs_cat, $root_idc;

        if (!$id) {

            $this->itemSlide();

            $this->itemList();
        } else {
            $this->itemDetail();
        }
    }

    public function catList()
    {

        global $DBi, $tpl, $cache_image_path, $objNews, $dir_path, $idc, $SETTING, $rs_cat;

        $db = Category::getChildCat($idc);
        $tpl->newBlock("catList");

        $i = 0;
        foreach ($db as $rs) {

            $i++;

            $tpl->newBlock("catItem");
            $tpl->assign("name", $rs['name']);

            $tpl->assign("content", $rs['content']);
            $tpl->assign("intro", $rs['intro']);

            $tpl->assign("link", $dir_path . '/' . $rs['url']);
            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(500, 350, $dir_path . '/' . $rs['image'], false) . '" alt="' . $rs['name'] . '" width="100%"/>');

            if ($i % 2 == 0)
                $tpl->newBlock("imgleft");
            else
                $tpl->newBlock("imgright");

            $tpl->assign(array(
                name => $rs['name'],
                content => $rs['content'],
                link => '/' . $rs['url'],
            ));
            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(400, 400, $dir_path . '/' . $rs['image'], false) . '" alt="' . $rs['name'] . '" width="100%"/>');
        }
    }

    public function itemSlide()
    {
        global $DBi, $tpl, $cache_image_path, $objNews, $dir_path, $idc, $SETTING, $rs_cat, $template_name;

        $tpl->newBlock("newsHot");

        $sql = "SELECT * FROM news WHERE active=1 AND hot=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_news DESC LIMIT 8"; //.;

        $db = $DBi->query($sql);
        $i = 0;
        while ($rs = $DBi->fetch_array($db)) {
            $i++;
            if ($i == 1) {
                $tpl->newBlock("newsHotBig");
                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 180, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');
            } else {
                $tpl->newBlock("newsHotItem");
                if ($rs['image'])
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 180, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');
            }
            $tpl->assign("createdate", date('d/m/Y', $rs['ngay_dang']));
            $tpl->assign("intro", strstrim(strip_tags($rs['intro']), 20));
            $tpl->assign("name", $rs['name']);
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

    public function itemList()
    {
        global $DBi, $tpl, $cache_image_path, $objNews, $dir_path, $idc, $SETTING, $rs_cat, $template_name;
        $tpl->newBlock("itemList");
        $i = 0;
        $db = $objNews->newsList($idc, 20);
        foreach ($db as $rs) {

            if (intval($rs['id_news'])) {
                $i++;
                $tpl->newBlock("newsItem");
                $tpl->assign(array(
                    name => $rs['name'],
                    intro => strip_tags($rs['intro']),
                    link_detail => $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']
                ));

                $tpl->assign("createdate", date('d/m/Y', $rs['ngay_dang']));

                if ($rs['image'])
                    $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(300, 200, $dir_path . '/' . $rs['image'], false) . '" alt="' . $rs['name'] . '" width="100%"/>');
            }
        }


        $tpl->assignGlobal("pages", $db['pages']);
    }

    public function itemDetail()
    {
        global $DBi, $objNews, $id, $idc, $tpl, $dir_path, $cache_image_path, $site_address, $rs_cat;

        $tpl->newBlock("itemDetail");
        $tpl->assign("link", $dir_path . '/' . $rs_cat['url']);
        $rs = $objNews->newsDetail($id);

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
                $tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(380, 240, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" class="image-news" width="100%"/>');
            if ($rs['description'])
                $tpl->assign("description", strip_tags($rs['description']));
            else
                $tpl->assign("description", strip_tags($rs['intro']));


            $tpl->assign("link_detail", $site_address . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }

        if (intval($rs['form_name']) == 1)
            $tpl->newBlock("itemForm");

        //Tac gia
        $rs_author = $objNews->getAuthor($rs['id_tacgia']);

        $tpl->assign("tacgia", $rs_author['name']);
        $tpl->assign("tacgia_url", $rs_author['url']);

        $tpl->newBlock("founderItem");
        $tpl->assign("founderName", $rs_author['name']);
        $tpl->assign("founderChucdanh", $rs_author['chucdanh']);
        $tpl->assign("founderText", $rs_author['intro']);
        $tpl->assign("thongtinkhac", $rs_author['thongtinkhac']);
        if ($rs_author['image'])
            $tpl->assign("founderImage", '<img  src="' . $cache_image_path . cropimage(500, 500, $dir_path . '/' . $rs_author['image']) . '" alt="' . $rs_author['name'] . '" width="100%" />');
        $tpl->assign("founderLink", $rs_author['url']);
        //

        $news_other = $objNews->news_other();
        foreach ($news_other as $rse) {
            if ($rse['id_news'] > 0) {
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
