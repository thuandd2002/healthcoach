<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("templates/info.htm");
$tpl->prepare();
langsite();
$id = intval($_GET['id']);

$idc = intval($_GET['idc']);


$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '"><i class="fa fa-home"></i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c"></div></div>');

$tpl->assignGlobal("dir_path", $dir_path);

$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("menutab", menutab($root_idc));

$tpl->assignGlobal("cat_name", $root_cat['subname']);
$tpl->assignGlobal("cat_intro", $root_cat['intro']);
$tpl->assignGlobal("cat_content", $root_cat['content']);

$tpl->assignGlobal("root_cat_link", "/" . $root_cat['url']);


$info = new Info();

$tpl->printToScreen();

class Info
{

    public function __construct()
    {
        global $DBi, $tpl, $dir_path, $idc, $id, $cache_image_path, $rs_cat, $root_idc;

        if (isset($idc)) {
            $db = Category::categoryInfo($idc);
            $tpl->newBlock("infoCatList");
            $tpl->assign("name", $db['name']);
            $tpl->assign("intro", $db['intro']);
            $tpl->assign("content", $db['content']);

            if ($db['image'])
                $tpl->assign("image", '<img  src="' . $db['image'] . '" alt="' . $db['name'] . '"  />');
          
        }
        // if ($id > 0) {
        //     $this->infoItemDetail($id);
        // } 
        // else if (Category::checkChildCat($idc)) {

        //     $tpl->newBlock("infoCatList");
        //     $db = Category::getChildCat($root_idc);

        //     foreach ($db as $rs) {

        //         if ($rs['id_category'] > 0) {

        //             if ($rs['data_type'] == 'info') {
        //                 $tpl->newBlock("info");
        //                 $tpl->assign("catname", html_entity_decode($rs['subname']));
        //                 $this->infoItem($rs['id_category']);
        //             }

        //             if ($rs['data_type'] == 'news') {
        //                 $tpl->newBlock("infoNews");
        //                 $tpl->assign("catname", html_entity_decode($rs['subname']));
        //                 $tpl->assign("catintro", $rs['intro']);
        //                 $this->infoNews($rs['id_category']);
        //             }

        //             if ($rs['data_type'] == 'info_donvi') {
        //                 $tpl->newBlock("info_donvi");
        //                 $tpl->assign("catname", html_entity_decode($rs['subname']));
        //                 $tpl->assign("catintro", $rs['intro']);
        //                 $this->info_donvi($rs['id_category']);
        //             }

        //             if ($rs['data_type'] == 'album') {
        //                 $tpl->newBlock("albumInfo");
        //                 $tpl->assign("catname", html_entity_decode($rs['subname']));
        //                 $tpl->assign("link", $dir_path . '/' . $rs['url']);
        //                 $tpl->assign("catintro", $rs['intro']);
        //                 $tpl->assign("catimage", '<img  src="' . $rs['image'] . '" alt="' . $rs['name'] . '"  />');
        //                 $this->albumInfo($rs['id_category']);
        //             }
        //         }
        //     }
        // }
        //  else {

        //     $tpl->newBlock("catDetail");

        //     $tpl->assign("catname", $rs_cat['name']);
        //     $tpl->assign("subname", $rs_cat['subname']);
        //     $tpl->assign("catintro", $rs_cat['intro']);
        //     $tpl->assign("catcontent", $rs_cat['content']);

        //     $this->infoItemList($idc);

        // }
    }

    function info_donvi($idc)
    {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM info_donvi WHERE active=1 AND id_category = $idc ORDER BY thu_tu ";
        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("info_donvi_item");
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . resizeimage1(80, 80, $rs['image']) . '" width="80" alt="' . $rs['name'] . '">');

            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", $rs['content']);

            $tpl->assign("link_detail", $rs['url']);
        }
    }

    function infoItem($idc)
    {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM info WHERE active=1 AND id_category = $idc ORDER BY thu_tu DESC ,id_info";
        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("subInfoItem");

            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", $rs['content']);
            $tpl->assign("videocode", parseVideoUrl($rs['videourl']));

            if ($rs['image'])

                $tpl->assign("background", 'background-image: url(' . $rs['image'] . ');');
        }
    }


    function infoNews($idc)
    {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);
        $sql = "SELECT * FROM news WHERE active=1 AND id_category = $idc ORDER BY thu_tu DESC ,id_news";
        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("infoNewsItem");

            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", $rs['content']);

            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $rs['image'] . '" alt="' . $rs['name'] . '"  />');
        }
    }

    function infoLeader($idc)
    {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);

        $sql = "SELECT * FROM info_leader WHERE active=1 AND id_category = $idc ORDER BY thu_tu DESC";
        $db = $DBi->query($sql);
        $i = 0;
        while ($rs = $DBi->fetch_array($db)) {
            $i++;
            $tpl->newBlock("info_leader_item");

            $tpl->assign("name", $rs['name']);
            $tpl->assign("position", $rs['position']);

            $tpl->assign("intro", $rs['intro']);

            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 450, $dir_path . '/' . $rs['image']) . '"  width="100%" alt="' . $rs['name'] . '">');
            $tpl->assign("image_url", $rs['image']);
        }
    }

    public function infoItemList($idcat)
    {
        global $DBi, $tpl, $cache_image_path, $dir_path, $id;

        $sql = "SELECT * FROM info WHERE active=1 AND id_category = $idcat ORDER BY thu_tu DESC ,id_info";
        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("infoItemList");

            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", $rs['content']);

            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $rs['image'] . '" alt="' . $rs['name'] . '" width="100%"/>');
            //$tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(600, 350, $dir_path . '/' . $rs['image'], false) . '" alt="' . $rs['name'] . '" width="100%"/>');

            $tpl->assign("fileurl", $rs['fileurl']);
            $tpl->assign("videocode", parseVideoUrl($rs['videourl']));


            if (substr($rs['url'], 0, 4) == "http")
                $tpl->assign("link_detail", $rs['url']);
            else
                $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }

    function albumInfo($idc)
    {
        global $DBi, $tpl, $dir_path, $cache_image_path, $lang, $SETTING;
        $idc = intval($idc);

        $sql = "SELECT * FROM album WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_album DESC LIMIT 10";

        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("album_item");
            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $rs['image'] . '"  width="100%" alt="' . $rs['name'] . '">');
                $tpl->assign("image_url", $rs['image']);
            }



            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", strip_tags($rs['intro']));
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);

            $images = json_decode($rs['image_list']);
            usort($images, function ($a, $b) {
                return $a->image_thu_tu > $b->image_thu_tu ? 1 : -1;
            });

            foreach ($images as $rs) {
                $tpl->newBlock("slider_info_image");
                $tpl->assign(array(
                    name => $rs->image_name,
                    thu_tu => $rs->image_thu_tu,
                    image_desc => $rs->image_desc
                ));

                $image_path = str_replace("//", "/", "/" . $rs->image_path);

                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(400, 250, $image_path) . '"  width="100%" alt="' . $rs->image_name . '">');

                $tpl->assign("bigimage", $image_path);
            }
        }
    }

    public function infoItemDetail($id)
    {
        global $DBi, $tpl, $cache_image_path, $dir_path;

        $id = intval($id);
        $sql = "SELECT * FROM info WHERE active=1 AND id_info = $id";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("infoItemDetail");
            $tpl->assign("name", $rs['name']);
            $tpl->assign("intro", $rs['intro']);
            $tpl->assign("content", $rs['content']);
            $tpl->assign("fileurl", $rs['fileurl']);
            $tpl->assign("videocode", parseVideoUrl($rs['videourl']));
            $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        }
    }
}
