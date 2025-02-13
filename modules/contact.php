<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');


$tpl = new TemplatePower("templates/contact.htm");
$tpl->prepare();
$idc = intval($_GET['idc']);
langsite();


$tpl->assignGlobal("dir_path", $dir_path);
$tpl->assignGlobal("site_address", $site_address);
$catname = $rs_cat['name'];
$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '">Trang chủ</a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');


$tpl->assignGlobal("catname", $rs_cat['name']);
$tpl->assignGlobal("catcontent", $rs_cat['content']);
$tpl->assignGlobal("intro", $rs_cat['intro']);

$tpl->assignGlobal("leftcol", $leftcol);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);
if ($rs_cat['image']) {
    $tpl->assignGlobal("image", '<img  src="' . $cache_image_path . resizeimage(1200, 600, $dir_path . '/' . $rs_cat['image']) . '" alt="' . $rs_cat['name'] . '" style="max-width:100%" />');
}

$sql = "SELECT * FROM contactinfo WHERE active=1 $language ";


$db = $DBi->query($sql);
if ($rs = $DBi->fetch_array($db)) {
    $tpl->assignGlobal("contactname", $rs['name']);
    $tpl->assignGlobal("contentcontact", $rs['content']);
}
$db_contact = dbStatic::getInWhere("contact");
//var_dump($db_contact);
foreach ($db_contact as $rs_contact) {
    $tpl->newBlock("contactItem");
    $tpl->assign("name", $rs_contact['name']);
    $tpl->assign("content", $rs_contact['content']);
}
$tpl->printToScreen();


?>