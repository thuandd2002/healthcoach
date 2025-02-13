<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

function inHome() {
    //Hien thi cac Category co vi tri la inhome
    global $DBi, $dir_path, $cache_image_path, $CONFIG, $language, $mobile_temp;
    $tpl1 = new TemplatePower("templates/inhome.htm");
    $tpl1->prepare();
    langsite($tpl1);
    $id = intval($_GET['id']);
    $idc = intval($_GET['idc']);

    $sql = "SELECT * FROM category WHERE active=1 AND vitri LIKE '%:inhome:%' ORDER BY thu_tu ASC, name ASC";
   
    $db_cat = $DBi->query($sql);
    $i == 0;
    while ($rs_cat = $DBi->fetch_array($db_cat)) {
        $i++;
        $tpl1->newBlock("cell_cat_home");
        if ($i%2 == 0)
            $tpl1->assign("flex-column-reverse", "flex-column-reverse");
        
        $tpl1->assign("catname", $rs_cat['name']);
        $tpl1->assign("idcat", $rs_cat['id_category']);
        $tpl1->assign("catintro", strip_tags($rs_cat['intro']));
        $tpl1->assign("catcontent", strip_tags($rs_cat['content']));
        $tpl1->assign("linkcat", $dir_path . '/' . $rs_cat['url']);
        
        if ($rs_cat['image'])
            $tpl1->assign("catimage", '<img src="' . $cache_image_path . cropimage(600, 400, $dir_path . '/' . $rs_cat['image']) . '" alt="' . $rs_cat['name'] . '" width="100%" >');

        if ($rs_cat['imageadv'])
            $tpl1->assign("catimageadv", '<img src="' . $rs_cat['imageadv'] . '" width="100%" >');

        
        $sql = "SELECT * FROM category WHERE active=1 AND parentid = $rs_cat[id_category] ORDER BY thu_tu ASC, name ASC";
        
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl1->newBlock("cell_sub_cat");
            $tpl1->assign("name", $rs['name']);
            $tpl1->assign("intro", strstrim(strip_tags($rs['intro']),30));
            $tpl1->assign("link", $dir_path . '/' . $rs_cat['url']);
            
            if ($rs['image'])
                $tpl1->assign("image", '<img src="' . $cache_image_path . cropimage(600, 400, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');
            
            if ($rs['imageadv'])
                $tpl1->assign("imageadv", '<img src="' . $rs['imageadv'] . '" width="100%" >');
        }
        
        
        
    }

    return $tpl1->getOutputContent();
}

function subInHome() {
    //Hien thi tieu de Category co vi tri la inhome và cac Category con
    global $DBi, $dir_path, $cache_image_path, $CONFIG, $language, $mobile_temp;
    $tpl1 = new TemplatePower("templates/inhome.htm");
    $tpl1->prepare();
    langsite($tpl1);
    $id = intval($_GET['id']);
    $idc = intval($_GET['idc']);

    $sql = "SELECT * FROM category WHERE active=1 AND vitri LIKE '%:inhome:%' $language ORDER BY thu_tu ASC, name ASC";

    $db_cat = $DBi->query($sql);

    while ($rs_cat = $DBi->fetch_array($db_cat)) {

        $tpl1->assignGlobal("catname", $rs_cat['subname']);
        $tpl1->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);
        $tpl1->assignGlobal("catintro", $rs_cat['intro']);

        $db = dbMenu::listSubCat($rs_cat['id_category']);
        foreach ($db as $rs) {

            $tpl1->newBlock("cell_cat_home");
            $tpl1->assign("name", $rs['name']);
            $tpl1->assign("intro", strstrim(strip_tags($rs['intro']), 30));
            $tpl1->assign("link", $dir_path . '/' . $rs['url']);
            if ($rs['image'])
                $tpl1->assign("image", '<img src="' . $cache_image_path . cropimage(600, 400, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');

            if ($rs['imageadv'])
                $tpl1->assign("imageadv", '<img src="' . $rs['imageadv'] . '" width="100%" >');
        }
    }

    return $tpl1->getOutputContent();
}

?>