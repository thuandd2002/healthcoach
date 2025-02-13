<?php

//defined( '_VALID_NVB' ) or die( 'Direct Access to this location is not allowed.' );

error_reporting(E_ERROR);



$_SESSION['IsAuthorized'] = 'binhnv';

$tpl = new TemplatePower("skin/header.tpl");

$tpl->prepare();

foreach ($modules_views as $myview) {
    $myview = str_replace(".php", "", $myview);
    $tpl->assignGlobal($myview, "style='display:block;'");
}


if ($_GET['lang'] == 'en')
    $_SESSION["lang"] = 'en';
elseif ($_GET['lang'] == 'cn')
    $_SESSION["lang"] = 'cn';
elseif ($_GET['lang'] == 'kr')
    $_SESSION["lang"] = 'kr';
elseif ($_GET['lang'] == 'default')
    $_SESSION["lang"] = '';


if ($_SESSION['lang'] == 'en') {
    $lang = $_SESSION['lang'];
    $lang_dir = 'en/';
    $language = " AND category.lang = 'en' ";
} elseif ($_SESSION['lang'] == 'cn') {
    $lang = $_SESSION['lang'];
    $lang_dir = 'cn/';
    $language = " AND category.lang = 'cn' ";
} elseif ($_SESSION['lang'] == 'kr') {
    $lang = $_SESSION['lang'];
    $lang_dir = 'kr/';
    $language = " AND category.lang = 'kr' ";
} else {
    $lang = '';
    $lang_dir = '';
    $language = " AND (category.lang <> 'en' AND category.lang <> 'cn' AND category.lang <> 'kr' )";
}



if ($lang == 'en') {
    $languageWhere = " AND lang='en' ";
} elseif ($lang == 'cn') {
    $languageWhere = " AND lang='cn' ";
} elseif ($lang == 'kr') {
    $languageWhere = " AND lang='kr' ";
} else {
    $languageWhere = " AND (lang<>'en' AND lang<>'cn' AND lang<>'kr' ) ";
}



$tpl->assignGlobal('lang', $lang);


$tpl->assign("lang" . $lang, "selected");

$tpl->assignGlobal("loginadminname", $_SESSION["addminname"]);

$tpl->assignGlobal("loginusername", $_SESSION["session_username"]);

$tpl->assignGlobal("site_name", $CONFIG["site_name"]);


include_once ('./dataprovider/search_content.php');
$search_obj = new search_content();

include_once ('./dataprovider/db_sys_image.php');
$objSysImage = new dbSysImage();

$tpl->printToScreen();
?>