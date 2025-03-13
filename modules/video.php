<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("templates/video.htm");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
langsite();

include_once("modules/left_right_col.php");
$leftcol = left_right_col();
$tpl->assignGlobal("leftcol", $leftcol);

$tpl->assignGlobal("menutab", menutab($root_idc));


$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '"><i class="fa fa-home"></i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');

$tpl->assignGlobal("catname", strip_tags($rs_cat['name']));
$tpl->assignGlobal("catintro", $rs_cat['intro']);
$tpl->assignGlobal("catcontent", $rs_cat['content']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);

if ($root_id > 0) {
    $dbcat = dbMenu::listSubCat($root_id);
    foreach ($dbcat as $rsc) {
        if ($rsc['id_category'] > 0) {
            $tpl->newBlock("listsubcat");
            $tpl->assign("name", strip_tags($rsc['name']));
            $tpl->assign("link", $dir_path . '/' . $rsc['url']);
            if ($idc == $rsc['id_category'])
                $tpl->assign("active", "active");
        }
    }
}
$tpl->assignGlobal("dir_path", $dir_path);
$info = new Video();
$info->__contruct();
$tpl->printToScreen();

class Video {


    public function __contruct() {
        global $idc, $id, $DBi;
        if ($id <= 0) {
            $this->cellVideo();
        } else {


            $this->videoDetail($id);
        }
    }

    private function cellVideo() {
        global $DBi, $tpl, $idc, $SETTING, $dir_path, $cache_image_path, $rs_cat;
        $tpl->newBlock("catList");
        $sql = "SELECT * FROM video WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%')  $language ORDER BY thu_tu DESC, id_video DESC";

        //echo $sql;
        $db = paging::pagingFonten($_GET['p'], $dir_path . "/" . url_process::getUrlCategory($idc), $sql, 6, 9);
        $i = 0;
        while ($rs = $DBi->fetch_array($db['db'])) {

            $tpl->newBlock("cellvideo");

            $i++;
            $tpl->assign("name", $rs['name']);
            $tpl->assign("link_detail", $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            
			$parse = parse_url($rs['video']);
            if ($parse['host'] == 'youtube.com' || $parse['host'] == 'youtu.be') {
				if ($rs['image']) {
					$tpl->assign("image", '<img src="' . $cache_image_path . cropimage(480, 360, $dir_path . '/' . $rs['image']) . '" width="100%"  />');
				} else {
					$tpl->assign("image", '<img src="http://img.youtube.com/vi/' . parseVideoUrl($rs['video']) . '/0.jpg" width="100%" />');
				}							
			}else{
				$tpl->assign("image", '<img src="' . $cache_image_path . cropimage(480, 360, $dir_path . '/' . $rs['image']) . '" width="100%"  />');
			}

        }
        $tpl->assignGlobal("pages", $db['pages']);
    }

    private function videoDetail() {
        global $DBi, $tpl, $idc, $dir_path, $id, $cache_image_path;
        $sql = "SELECT * FROM video WHERE active = 1 AND id_video = $id";
        $tpl->newBlock("itemDetail");

        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $tpl->assign("name", $rs['name']);
            $tpl->assign("content", $rs['content']);

            $parse = parse_url($rs['video']);
            if ($parse['host'] == 'youtube.com' || $parse['host'] == 'youtu.be') {
                $tpl->newBlock("youtube");
                $tpl->assign("video", $rs['video']);
                $tpl->assign("videocode", parseVideoUrl($rs['video']));
                $tpl->assign("image", 'http://img.youtube.com/vi/' . parseVideoUrl($rs['video']) . '/0.jpg');
            } else {
                $tpl->newBlock("localvideo");
                $tpl->assign("video", $dir_path . '/' . $rs['video']);
                $tpl->assign("image", $cache_image_path . resizeimage(480, 360, $dir_path . '/' . $rs['image']));
            }
        }
        $this->otherVideo();
    }

    private function otherVideo() {
        global $DBi, $tpl, $idc, $dir_path, $id, $cache_image_path;
        $tpl->newBlock("othervideo");
        $sql = "SELECT * FROM video WHERE active=1 AND id_video<>$id AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, id_video DESC ";
        $db = paging::pagingFonten($_GET['p'], $dir_path . "/" . url_process::getUrlCategory($idc), $sql, 8, 6);
        //$db = $DBi->query($sql);
        $i = 0;
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list1");
            $i++;
            $tpl->assign("name", $rs['name']);
            $tpl->assign("content", strstrim(strip_tags($rs['content']), 10));
            $tpl->assign("link_detail", $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            $parse = parse_url($rs['video']);
            if ($parse['host'] == 'youtube.com' || $parse['host'] == 'youtu.be') {
                if ($rs['image']) {
                    $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, 200, $dir_path . '/' . $rs['image']) . '" width="100%"  />');
                } else {
                    $tpl->assign("image", '<img src="http://img.youtube.com/vi/' . parseVideoUrl($rs['video']) . '/0.jpg"  width="100%"  />');
                }
            } else {
                $tpl->assign("image", '<img src="' . $cache_image_path . cropimage(300, '200', $dir_path . '/' . $rs['image']) . '" width="100%"  />');
            }
        }
        $tpl->assignGlobal("pages", $db['pages']);
    }

}

?>