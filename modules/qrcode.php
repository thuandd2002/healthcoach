<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("templates/qrcode.htm");
$tpl->prepare();

langsite();

$id = intval($_GET['id']);
$idc = intval($_GET['idc']);


$tpl->assignGlobal("dir_path", $dir_path);


$tpl->assignGlobal("pathpage", '<div class="crumb"> <div class="grid"> <a href="/' . $lang_dir . '"> ' . $langLabel['_home'] . ' </a> <i class="fa fa-angle-right"></i> Tra cứu sản phẩm </div></div>');

$tpl->assignGlobal("slideshow", slidechild());

$tpl->assignGlobal("catname", $rs_cat['name']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);

if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');




$code = clean_value($_REQUEST['code']);

$serial = compile_post('qrcode');

$thongtinsanpham_arr = checkAPI($serial);

$SerialNo = $thongtinsanpham_arr->SerialNo;

if (strlen($SerialNo) > 1) {


    $tpl->assignGlobal("thongtinsanpham", "display: block;");

    $tpl->assign("SerialNo", $SerialNo);
    $tpl->assign("LotNo", $thongtinsanpham_arr->LotNo);
    $tpl->assign("ItemName", $thongtinsanpham_arr->ItemName);
    $tpl->assign("ItemNo", $thongtinsanpham_arr->ItemNo);
    $tpl->assign("Spec", $thongtinsanpham_arr->Spec);
    $tpl->assign("UnitName", $thongtinsanpham_arr->UnitName);
    $tpl->assign("CreateDate", $thongtinsanpham_arr->CreateDate);
    $tpl->assign("UsefulTime", $thongtinsanpham_arr->UsefulTime);
    $tpl->assign("WorkTime", $thongtinsanpham_arr->WorkTime);
    $tpl->assign("ValiDate", $thongtinsanpham_arr->ValiDate);
    $tpl->assign("RegDate", $thongtinsanpham_arr->RegDate);
} else {

    $tpl->assignGlobal("khongthay", "display: block;");
}




$tpl->printToScreen();
?>