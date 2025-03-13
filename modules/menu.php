<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

function menubar() {
    global $DBi, $dir_path, $lang_dir, $cache_image_path, $CONFIG, $logo, $activeid, $page;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("menubar");

    $tpl1->assignGlobal("lang_dir", $lang_dir);
    $tpl1->assignGlobal("dir_path", $dir_path);
    langsite($tpl1);
    $menu = new dbMenu;
    $menu_items = $menu->menuBar();
    $arr = explode(',', $activeid);

    $i = 0;
    foreach ($menu_items as $rs) {
        if ($rs['id_category'] > 0) {

            $i++;
            $tpl1->newBlock("item_barmenu");

            if (($rs['data_type'] == 'home' && ($page == 'home' || $page == ''))) {
                $tpl1->assign('homeactive', "active");
            }

            $tpl1->assign("name", strip_tags($rs['name']));
            if (intval($rs['target']) == 1)
                $tpl1->assign("target", "target='_blank'");

            if (intval($rs['mega_menu'] > 0))
                $tpl1->assign("mega_menu_li", 'style="position: initial;"');

            if (in_array($rs['id_category'], $arr))
                $tpl1->assign("active", "active");
            $tpl1->assign("imageadv", trim_url_image($dir_path . '/' . $rs['imageadv']));

            if (substr($rs['url'], 0, 2) == "//" || substr($rs['url'], 0, 4) == "http")
                $tpl1->assign("link", $rs['url']);
            else
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
			
			if($rs['url'] == "#")
				$tpl1->assign("link", "javascript:void(0)");
			

            $submenu = $menu->listSubCat($rs['id_category']);

            if (count($submenu) > 0) {
                $tpl1->assign("arrow", '<i class="fa fa-angle-down" aria-hidden="true"></i>');

                if (intval($rs['mega_menu'] > 0)) {
                    $tpl1->assign("mega_menu_li", "position:initial;");

                    $tpl1->newBlock("has_mega_menu");
                    foreach ($submenu as $rs1) {
                        if ($rs1['id_category'] > 0) {
                            $tpl1->newBlock("mega_menu_item");
                            $tpl1->assign("imageadv", '<img  src="' . $rs1['imageadv'] . '" width="100%"/>');

                            $tpl1->assign("name1", strip_tags($rs1['name']));
                            //$tpl1->assign("link1", $dir_path . '/' . $rs1['url']);
                            if (substr($rs1['url'], 0, 2) == "//" || substr($rs1['url'], 0, 4) == "http")
                                $tpl1->assign("link1", $rs1['url']);
                            else
                                $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);
                        }
                    }
                }else {
                    $tpl1->newBlock("has_sub_menu");
                    foreach ($submenu as $rs1) {
                        if ($rs1['id_category'] > 0) {

                            $tpl1->newBlock("submenudrop");

                            if (in_array($rs1['id_category'], $arr))
                                $tpl1->assign("active1", "active");
                            $tpl1->assign("name1", strip_tags($rs1['name']));
                            if (intval($rs1['target']) == 1)
                                $tpl1->assign("target1", "target='_blank'");

                            if (substr($rs1['url'], 0, 2) == "//" || substr($rs1['url'], 0, 4) == "http")
                                $tpl1->assign("link1", $rs1['url']);
                            else
                                $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);

                            $submenu2 = $menu->listSubCat($rs1['id_category']);
                            if (count($submenu2) > 0) {
                                $tpl1->newBlock("has_sub_menu2");
                                foreach ($submenu2 as $rs2) {
                                    $tpl1->newBlock("submenudrop2");

                                    if (intval($rs2['target']) == 1)
                                        $tpl1->assign("target2", "target='_blank'");

                                    $tpl1->assign("name2", $rs2['name']);
                                    $tpl1->assign("link2", $dir_path . '/' . $rs2['url']);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return $tpl1->getOutputContent();
}

function leftbar() {
    global $DBi, $dir_path, $lang_dir, $cache_image_path, $CONFIG, $logo, $activeid, $page;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("lelftbar");

    $tpl1->assignGlobal("lang_dir", $lang_dir);
    $tpl1->assignGlobal("dir_path", $dir_path);
    langsite($tpl1);
    $menu = new dbMenu;
    $menu_items = $menu->barLeftRight(0, "leftbar");
    $arr = explode(',', $activeid);

    $menu_items = array_reverse($menu_items);

    foreach ($menu_items as $rs) {
        if ($rs['id_category'] > 0) {

            $tpl1->newBlock("lelftbar_item");

            $tpl1->assign("name", strip_tags($rs['name']));
            if (intval($rs['target']) == 1)
                $tpl1->assign("target", "target='_blank'");

            if (intval($rs['mega_menu'] > 0))
                $tpl1->assign("mega_menu_li", 'style="position: relative;"');

            if (in_array($rs['id_category'], $arr))
                $tpl1->assign("active", "active");


            if (substr($rs['url'], 0, 2) == "//" || substr($rs['url'], 0, 4) == "http")
                $tpl1->assign("link", $rs['url']);
            else
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
			
			if($rs['url'] == "#")
				$tpl1->assign("link", "javascript:void(0)");
			


            $submenu = $menu->listSubCat($rs['id_category']);

            if (count($submenu) > 0 && $rs['data_type'] != "info") {
                $tpl1->newBlock("lelftbar_sub");

                if (intval($rs['mega_menu'] > 0))
                    $tpl1->assign("mega_menu", "mega-menu");
                else
                    $tpl1->assign("mega_menu", "submnu1");

                foreach ($submenu as $rs1) {
                    if ($rs1['id_category'] > 0) {

                        $tpl1->newBlock("lelftbar_subitem");

                        if (in_array($rs1['id_category'], $arr))
                            $tpl1->assign("active1", "active");
                        $tpl1->assign("name1", strip_tags($rs1['name']));
                        if (intval($rs1['target']) == 1)
                            $tpl1->assign("target1", "target='_blank'");

                        if (substr($rs1['url'], 0, 2) == "//" || substr($rs1['url'], 0, 4) == "http")
                            $tpl1->assign("link1", $rs1['url']);
                        else
                            $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);
                    }
                }
            }
        }
    }

    return $tpl1->getOutputContent();
}

function rightbar() {
    global $DBi, $dir_path, $lang_dir, $cache_image_path, $CONFIG, $logo, $activeid, $page;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("rightbar");

    $tpl1->assignGlobal("lang_dir", $lang_dir);
    $tpl1->assignGlobal("dir_path", $dir_path);
    langsite($tpl1);
    $menu = new dbMenu;
    $menu_items = $menu->barLeftRight(0, "rightbar");
    $arr = explode(',', $activeid);

    foreach ($menu_items as $rs) {
        if ($rs['id_category'] > 0) {

            $tpl1->newBlock("rightbar_item");

            $tpl1->assign("name", strip_tags($rs['name']));
            if (intval($rs['target']) == 1)
                $tpl1->assign("target", "target='_blank'");

            if (intval($rs['mega_menu'] > 0))
                $tpl1->assign("mega_menu_li", 'style="position: initial;"');

            if (in_array($rs['id_category'], $arr))
                $tpl1->assign("active", "active");



            if (substr($rs['url'], 0, 2) == "//" || substr($rs['url'], 0, 4) == "http")
                $tpl1->assign("link", $rs['url']);
            else
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
			
			if($rs['url'] == "#")
				$tpl1->assign("link", "javascript:void(0)");
			

            $submenu = $menu->listSubCat($rs['id_category']);

            if (count($submenu) > 0) {
                $tpl1->newBlock("rightbar_sub");

                if (intval($rs['mega_menu'] > 0))
                    $tpl1->assign("mega_menu", "mega-menu");
                else
                    $tpl1->assign("mega_menu", "submnu1");

                foreach ($submenu as $rs1) {
                    if ($rs1['id_category'] > 0) {

                        $tpl1->newBlock("rightbar_subitem");

                        if (in_array($rs1['id_category'], $arr))
                            $tpl1->assign("active1", "active");
                        $tpl1->assign("name1", strip_tags($rs1['name']));
                        if (intval($rs1['target']) == 1)
                            $tpl1->assign("target1", "target='_blank'");

                        if (substr($rs1['url'], 0, 2) == "//" || substr($rs1['url'], 0, 4) == "http")
                            $tpl1->assign("link1", $rs1['url']);
                        else
                            $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);
                    }
                }
            }
        }
    }

    return $tpl1->getOutputContent();
}

function menutop() {
    global $DBi, $dir_path, $CONFIG, $activeid;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("topmenu1");
    $menu = new dbMenu;
    $menutop = $menu->menuTop();
    $arr = explode(',', $activeid);
    $i = 0;
    foreach ($menutop as $rs) {
        if ($rs['id_category'] > 0) {
            $i++;
            $tpl1->newBlock("item_topmenu1");
            if ($i > 1)
                $tpl1->assign("line", "|");
            $tpl1->assign("name", strip_tags($rs['name']));
            if (in_array($rs['id_category'], $arr))
                $tpl1->assign("active", "active");
            $tpl1->assign("link", $dir_path . '/' . $rs['url']);
            if ($rs['data_type'] == 'sitemap')
                $tpl1->assign("icon", '<i class="fa fa-sitemap"></i> ');
            if ($rs['data_type'] == 'contact')
                $tpl1->assign("icon", '<i class="fa fa-envelope-o"></i> ');
        }
    }
    return $tpl1->getOutputContent();
}



function menutab($idcat) {
    global $DBi, $dir_path, $CONFIG, $activeid, $idc;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();

	$tpl1->newBlock("menutab");
	$arr = explode(",", $activeid);
	
	$root_cat = Category::categoryInfo($idcat);
	$tpl1->assign("link_all", $dir_path . '/' . $root_cat['url']);
	
	if ($idc == $root_cat['id_category']) {
		$tpl1->assign("actived", "actived");
	}
	
    $dbCat = dbMenu::listSubCat($idcat);

    foreach ($dbCat as $rsCat) {
        $tpl1->newBlock("menutabItem");
        $tpl1->assign("name", strip_tags($rsCat['name']));
        $tpl1->assign("link", $dir_path . '/' . $rsCat['url']);

        if (in_array($rsCat['id_category'], $arr)) {
            $tpl1->assign("actived", "actived");
        }
    }

    return $tpl1->getOutputContent();
}


function menuleft() {
    global $DBi, $dir_path, $CONFIG, $activeid, $idc;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();

    $root_idc = Category::get_root_category_id($idc);
    $root_cat = Category::categoryInfo($root_idc);

    if (intval($root_idc) > 0){
		$dbCat = dbMenu::listSubCat($root_idc);
		$tpl1->newBlock("menu_left");
	}
        

    

    $arr = explode(",", $activeid);

    $tpl1->assign("cat_name", strip_tags($root_cat['name']));
    $tpl1->assign("cat_link", $dir_path . '/' . $root_cat['url']);

    if (substr($root_cat['url'], 0, 2) == "//" || substr($root_cat['url'], 0, 4) == "http")
        $tpl1->assign("cat_link", $root_cat['url']);
    else
        $tpl1->assign("cat_link", $dir_path . '/' . $root_cat['url']);

    $dbCat = dbMenu::listSubCat($root_idc);

    foreach ($dbCat as $rsCat) {

        $tpl1->newBlock("menu_left_item");
        $tpl1->assign("name", strip_tags($rsCat['name']));
        $tpl1->assign("link", $dir_path . '/' . $rsCat['url']);

        if (in_array($rsCat['id_category'], $arr))
            $tpl1->assign("actived", "actived");

        $dbSubCat = dbMenu::listSubCat($rsCat['id_category']);
        if (count($dbSubCat) > 0) {
            $tpl1->assign("has_sub_icon", '<i class="fa fa-chevron-down show-sub-menu" id=mnu_' . $rsCat[id_category] . ' ></i> ');


            $tpl1->newBlock("sub_menu_left");
            $tpl1->assign("subId", "mnu_$rsCat[id_category]");
        }
        foreach ($dbSubCat as $rsSubCat) {
            $tpl1->newBlock("sub_menu_left_item");
            $tpl1->assign("name", $rsSubCat['name']);
            $tpl1->assign("link", $dir_path . '/' . $rsSubCat['url']);
            if (in_array($rsSubCat['id_category'], $arr))
                $tpl1->assign("actived", "actived");
        }
    }





    return $tpl1->getOutputContent();
}

function menuFooter() {

    global $DBi, $dir_path, $CONFIG, $activeid;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("menufooter");
    $menu = new dbMenu;
    $menutop = $menu->menuFooter();
    $arr = explode(',', $activeid);
    $i = 0;
    foreach ($menutop as $rs) {
        if ($rs['id_category'] > 0) {
            $tpl1->newBlock("item_menu");
            $i++;
            $tpl1->assign("name", strip_tags($rs['name']));
            if (in_array($rs['id_category'], $arr))
                $tpl1->assign("active", "active");
            $tpl1->assign("link", $dir_path . '/' . $rs['url']);
        }
    }
    return $tpl1->getOutputContent();
}

function boxmenufooter($col = 0) {
    global $DBi, $dir_path, $CONFIG, $activeid;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $menu = new dbMenu;
    $mnu = $menu->footerMenuCol("boxmenufooter", $col);

    foreach ($mnu as $rs) {
        if ($rs['id_category'] > 0) {

            $tpl1->newBlock("footercol");

            $tpl1->assign("idcat", $rs['id_category']);

            $tpl1->assign("name", strip_tags($rs['name']));

            if (substr($rs['url'], 0, 2) == "//" || substr($rs['url'], 0, 4) == "http")
                $tpl1->assign("link", $rs['url']);
            else
                $tpl1->assign("link", $dir_path . '/' . $rs['url']);
			
			if($rs['url'] == "#")
				$tpl1->assign("link", "javascript:void(0)");
			


            $db1 = $menu->listSubCat($rs['id_category']);
            foreach ($db1 as $rs1) {
                if ($rs1['id_category'] > 0) {
                    $tpl1->newBlock("subcol");
                    $tpl1->assign("name1", $rs1['name']);

                    if (substr($rs1['url'], 0, 2) == "//" || substr($rs1['url'], 0, 4) == "http")
                        $tpl1->assign("link1", $rs1['url']);
                    else
                        $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);
                }
            }
        }
    }
    return $tpl1->getOutputContent();
}

function menuRight() {
    global $DBi, $dir_path, $cache_image_path, $CONFIG, $logo, $activeid;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("menuright");
    $menu = new dbMenu;
    $arr = explode(",", $activeid);
    $db = $menu->selectByLocation("menuleft");


    foreach ($db as $rs) {
        if ($rs['id_category'] > 0) {
            $tpl1->newBlock("item_menu_right");
            $tpl1->assign("name", strip_tags($rs['name']));
            $tpl1->assign("link", $dir_path . '/' . $rs['url']);
            $db1 = $menu->listSubCat($rs['id_category']);
            foreach ($db1 as $rs1) {
                if ($rs1['id_category'] > 0) {
                    $tpl1->newBlock("r_level1");

                    $tpl1->assign('name1', strip_tags($rs1['name']));
                    $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);
                    if (in_array($rs1['id_category'], $arr)) {
                        $tpl1->assign("active", "active");
                        $db2 = $menu->listSubCat($rs1['id_category']);
                        if (count($db2) > 0) {
                            $tpl1->newBlock("show_r_level2");
                            foreach ($db2 as $rs2) {
                                if ($rs2['id_category'] > 0) {
                                    $tpl1->newBlock("r_level2");
                                    $tpl1->assign('name2', $rs2['name']);
                                    $tpl1->assign("link2", $dir_path . '/' . $rs2['url']);
                                    if (in_array($rs2['id_category'], $arr)) {
                                        $tpl1->assign("active1", "active");
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return $tpl1->getOutputContent();
}

function menuProduct($idc_product) {
    global $DBi, $dir_path, $cache_image_path, $CONFIG, $logo, $activeid, $root_idc, $idc;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("menu_product");
    $menu = new dbMenu;
    $arr = explode(",", $activeid);
    $sql = "SELECT * FROM category WHERE active =  1 AND vitri LIKE '%:menubar:%' AND data_type = 'product' ORDER BY thu_tu ASC";
    $dbPro = $DBi->query($sql);


    if ($rsPro = $DBi->fetch_array($dbPro)) {
        $tpl1->assign("name", $rsPro['name']);
        $tpl1->assign("link", $dir_path . '/' . $rsPro['url']);
        $idc_product = intval($rsPro['id_category']);
    }

    $db = $menu->listSubCat($idc_product);
    foreach ($db as $rs) {

        $tpl1->newBlock("item_menu_pro");
        $tpl1->assign("name", $rs['name']);
        $tpl1->assign("link", $dir_path . '/' . $rs['url']);

        if ($idc != $root_idc)
            $tpl1->assign("actived", "deactived");

        if (in_array($rs['id_category'], $arr))
            $tpl1->assign("actived", "actived");



        $db1 = $menu->listSubCat($rs['id_category']);

        foreach ($db1 as $rs1) {
            if ($rs1['id_category'] > 0) {
                $tpl1->newBlock("r_level1");

                $tpl1->assign('name1', $rs1['name']);
                $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);
                if (in_array($rs1['id_category'], $arr))
                    $tpl1->assign("actived1", "actived");
            }
        }
    }

    return $tpl1->getOutputContent();
}

function menuMobile() {
    global $DBi, $dir_path, $CONFIG, $activeid, $language;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();
    $tpl1->newBlock("showmenumobile");
    $sql = "SELECT * FROM category WHERE active=1 AND (vitri LIKE '%:menubar:%' OR  vitri LIKE '%:menufooter:%' OR vitri LIKE '%:menutop:%')  $language ORDER BY thu_tu ASC, name ASC";
    $db = $DBi->query($sql);
    while ($rs = $DBi->fetch_array($db)) {
        $tpl1->newblock("m_level1");
        $tpl1->assign(array(
            name => strip_tags($rs['name']),
            link => $dir_path . "/" . $rs['url']
        ));
        if (substr($rs['url'], 0, 2) == "//" || substr($rs['url'], 0, 4) == "http")
            $tpl1->assign("link", $rs['url']);
        else
            $tpl1->assign("link", $dir_path . '/' . $rs['url']);
		
		if($rs['url'] == "#")
			$tpl1->assign("link", "javascript:void(0)");
		
		
        $sql1 = "SELECT * FROM category WHERE active=1 AND parentid = $rs[id_category] ORDER BY thu_tu ASC, name ASC";
        $db1 = $DBi->query($sql1);
        if ($DBi->num_rows($db1) > 0) {
            $tpl1->newBlock("showlevel2");
            while ($rs1 = $DBi->fetch_array($db1)) {
                $tpl1->newBlock("m_level2");
                $tpl1->assign(array(
                    name1 => strip_tags($rs1['name']),
                    link1 => $dir_path . '/' . $rs1['url']
                ));

                if (substr($rs1['url'], 0, 2) == "//" || substr($rs1['url'], 0, 4) == "http")
                    $tpl1->assign("link1", $rs1['url']);
                else
                    $tpl1->assign("link1", $dir_path . '/' . $rs1['url']);

                $sql2 = "SELECT * FROM category WHERE active=1 AND parentid = $rs1[id_category] ORDER BY thu_tu ASC, name ASC";
                $db2 = $DBi->query($sql2);
                if ($DBi->num_rows($db2) > 0) {
                    $tpl1->newBlock("showlevel3");
                    while ($rs2 = $DBi->fetch_array($db2)) {
                        $tpl1->newBlock("m_level3");
                        $tpl1->assign(array(
                            name2 => $rs2['name'],
                            link2 => $dir_path . '/' . $rs2['url']
                        ));
                        $sql3 = "SELECT * FROM category WHERE active=1 AND parentid = $rs2[id_category] ORDER BY thu_tu ASC, name ASC";
                        $db3 = $DBi->query($sql3);
                        if ($DBi->num_rows($db3) > 0) {
                            $tpl1->newBlock("showlevel4");
                            while ($rs3 = $DBi->fetch_array($db3)) {
                                $tpl1->newBlock("m_level4");
                                $tpl1->assign(array(
                                    name3 => $rs3['name'],
                                    link3 => $dir_path . '/' . $rs3['url']
                                ));
                            }
                        }
                    }
                }
            }
        }
    }
    return $tpl1->getOutputContent();
}

function menu_left() {
    global $DBi, $dir_path, $idc, $lang_dir, $lang, $language, $cache_image_path, $CONFIG, $activeid;
    $tpl1 = new TemplatePower("templates/menu.htm");
    $tpl1->prepare();

    langsite();
    $tpl1->assignGlobal("lang", $lang);
    $tpl1->assignGlobal("lang_dir", $lang_dir);

    $root_id = -1;
    $root_id = Category::get_root_category_id($idc);

    $root_cat = Category::categoryInfo($root_id);
    $menu = new dbMenu;
    $arr = explode(',', $activeid);
    if (intval($root_id) <= 0)
        return;

    $menu_pro = $menu->listSubCat($root_id);

    if (count($menu_pro) > 0) {
        $tpl1->newBlock("menu_left");
        $tpl1->assign("cat_name", strip_tags($root_cat['name']));
        $tpl1->assign("cat_link", $dir_path . '/' . $root_cat['url']);
        foreach ($menu_pro as $rs) {
            $tpl1->newBlock("menu_left_item");
            $tpl1->assign("name", strip_tags($rs['name']));
            $tpl1->assign("link", $dir_path . '/' . $rs['url']);
            if ($idc == $rs['id_category'])
                $tpl1->assign("active", "active");
        }
    }else if ($root_cat['data_type'] == 'info') {
        $tpl1->newBlock("menu_left");
        $tpl1->assign("cat_name", $root_cat['name']);
        $tpl1->assign("cat_link", $dir_path . '/' . $root_cat['url']);
        $sqli = "SELECT * FROM info WHERE active=1 AND id_category = $root_id ORDER BY thu_tu ASC, name ASC";
        $dbi = $DBi->query($sqli);
        while ($rsi = $DBi->fetch_array($dbi)) {
            $tpl1->newBlock("menu_left_item");

            $tpl1->assign("name", $rsi['name']);
        }
    }
    return $tpl1->getOutputContent();
}

?>