<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');


function rating($tb = 'news', $id_tb = 'id_news', $id = 0) {
    global $DBi, $dir_path, $cache_image_path, $CONFIG;

    $tpl1 = new TemplatePower("templates/rating.htm");
    $tpl1->prepare();

    langsite($tpl1);

    $tpl1->assign("id", $id);
    $tpl1->assign("tb", $tb);
    $tpl1->assign("id_tb", $id_tb );

    

    return $tpl1->getOutputContent();
}



?>