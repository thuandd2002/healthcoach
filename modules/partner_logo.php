<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

function partner_logo() {
    global $DBi, $dir_path, $cache_image_path, $CONFIG, $logo;
    $tpl1 = new TemplatePower("templates/partner_logo.htm");
    $tpl1->prepare();


    $dbcat = dbMenu::selectByLD("cathome", "partner");
    foreach ($dbcat as $rscat) {
        $tpl1->newBlock("partner");
        $tpl1->assign("catname", $rscat['subname']);
        $tpl1->assign("catintro", $rscat['intro']);
        
        $sql = "SELECT * FROM partner WHERE active=1 AND id_category = $rscat[id_category] ORDER BY thu_tu, id_partner DESC";

        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {

            $tpl1->newBlock("list_partner");
            /*
              if ($rs['image'])
              $tpl1->assign("image", '<a href="' . $rs['link'] . '" target="' . $rs['target'] . '"><img src="' . $cache_image_path . resizeimage1(180, 50, $dir_path . '/' . $rs['image'], false) . '" width="100%"  alt="' . $rs['name'] . '"></a>');
             */

            if ($rs['image'])
                $tpl1->assign("image", '<a href="' . $rs['link'] . '" target="' . $rs['target'] . '"><img src="' . $rs['image'] . '" width="100%"  alt="' . $rs['name'] . '"></a>');

            $tpl1->assign("name", $rs['name']);
            $tpl1->assign("link", $rs['link']);
            $tpl1->assign("target", $rs['target']);
        }
    }

    return $tpl1->getOutputContent();
}

?>