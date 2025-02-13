<?php

error_reporting(E_ERROR);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

function slideShow() {
    global $DBi, $dir_path, $cache_image_path, $CONFIG, $logo, $language, $mobile_temp;
    $tpl1 = new TemplatePower("templates/slidehome.htm");

    $tpl1->prepare();
    langsite($tpl1);
    $tpl1->assignGlobal('dir_path', $dir_path);
    $id = intval($_GET['id']);

    $idc = intval($_GET['idc']);
    $tpl1->newBlock("show_slideshow");
    if ($mobile_temp != "")
        $sql = "SELECT * FROM category WHERE active = 1 $language AND vitri LIKE '%:slidemobile:%' ORDER BY thu_tu ASC, name ASC";
    else
        $sql = "SELECT * FROM category WHERE active = 1 $language AND vitri LIKE '%:slideshow:%' ORDER BY thu_tu ASC, name ASC";

    $db = $DBi->query($sql);

    if ($rs = $DBi->fetch_array($db)) {
        $dblg = $logo->logoList($rs['id_category'],10);

        foreach ($dblg as $rslg) {
            if ($rslg['image']) {
                $tpl1->newBlock("slide_home_item");
                $tpl1->assign("name", $rslg['name']);
                if (strlen($rslg['comment']) > 7) {
                    $tpl1->assign("description", $rslg['comment']);
                }
                $tpl1->assign("image", '<img src="' . $rslg['image'] . '" alt="' . $rslg['name'] . '" width="100%" style="display:block"/>');
                $tpl1->assign("link", $rslg['link']);
                $tpl1->assign("target", $rslg['target']);
            }
        }
    }

    return $tpl1->getOutputContent();
}

function slidechild() {
    global $DBi, $dir_path, $language, $idc,$cache_image_path, $CONFIG, $logo, $catname;

    $tpl1 = new TemplatePower("templates/slidehome.htm");
    $tpl1->prepare();
    $tpl1->assignGlobal("dir_path", $dir_path);
    
    $tpl1->newBlock("slidechild");
    $tpl1->assignGlobal("catname", $catname);
    $sql = "SELECT * FROM sys_image WHERE id_category = $idc";
    $db_img = $DBi->query($sql);
    $i = 0;
    while ($rslg = $DBi->fetch_array($db_img)) {
        if ($rslg['image']) {
            if ($i == 1)
                $tpl1->newBlock("pic_mobile");
            else
                $tpl1->newBlock("piccat");

            $srcimg = str_replace("//", "/", $dir_path . '/' . $rslg['image']);
            $tpl1->assign("image", '<img src="' . $srcimg . '" alt="' . $rslg['name'] . '" width="100%"/>');
            $tpl1->assign("name", $rslg['name']);
            $tpl1->assign("link", $rslg['link']);
            $tpl1->assign("target", $rslg['target']);
        }

        $i++;
    }

    return $tpl1->getOutputContent();
}

?>