<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
if ($mobile_temp != "")
    $tpl = new TemplatePower("templates/header$mobile_temp.htm");
else
    $tpl = new TemplatePower("templates/header.htm");

$tpl->prepare();

$idc = intval($_GET['idc']);

$id = intval($_GET['id']);

$tpl->assignGlobal("dir_path", $dir_path);

langsite();

$tpl->assignGlobal("lang", $lang);
$tpl->assignGlobal("lang_dir", $lang_dir);

if ($lang == 'en')
    $tpl->assignGlobal("lang_flag", '<a href="/" class="lang-flag vi"> <img src="/images/flag-vi.png"/> </a>');
else
    $tpl->assignGlobal("lang_flag", '<a href="/en/" class="lang-flag en"> <img src="/images/flag-en.png"/> </a>');


if ($lang == 'en') {
    $tpl->assignGlobal("enactive", 'active');
    $tpl->assignGlobal("flaglang", '<a class="langmobile" href="/">Tiếng Việt</a>');
} else {
    $tpl->assignGlobal("vnactive", 'active');
    $tpl->assignGlobal("flaglang", '<a class="langmobile" href="/en/">English</a>');
}

$arr_back_id = Get_Id_Cat_Back($idc);

$arr_back = explode(",", $arr_back_id);

include_once('modules/db.provider/db.menu.php');
include_once('modules/db.provider/db.logo.php');
include_once("modules/db.provider/db.product.php");
include_once('modules/db.provider/db.news.php');
include_once('modules/db.provider/db.service.php');

include_once("modules/slidehome.php");

$logo = new dbLogo();


include("modules/db.provider/db.static.php");

$static = new dbStatic();



$tpl->assignGlobal("hotline", $SETTING->hotline);
$tpl->assignGlobal("companyemail", $SETTING->companyemail);
$tpl->assignGlobal("companyname", $SETTING->companyname);
$tpl->assignGlobal("companyaddress", $SETTING->companyaddress);


$tpl->assignGlobal(array(
    facebook => $SETTING->facebook,
    twitter => $SETTING->twitter,
    linkedin => $SETTING->linkedin,
    fanpage => $SETTING->fanpage
));


// $meta = $getUrl->get_meta_item($cateinfo['data_type']);


if ($meta['image']){
	$tpl->assignGlobal("site_image", '<meta property="og:image" name="og:image" content="' . $site_address . $meta['image'] . '" data-app>');
	$tpl->assignGlobal("site_image_alt", '<meta property="og:image:alt" name="og:image:alt" content="' . $site_address . $meta['image'] . '" data-app>');
}
    
else{
	$tpl->assignGlobal("site_image", '<meta property="og:image" name="og:image" content="' . $site_address . '/uploaded/logo/logo.png" data-app>');
	$tpl->assignGlobal("site_image_alt", '<meta property="og:image:alt" name="og:image:alt" content="' . $site_address . '/uploaded/logo/logo.png" data-app>');
}



if ($_GET['p'] > 1) {

    $ptitle = " - trang " . $_GET['p'];
}

if ($page == 'product' && $idc <= 0) {

    $meta['title'] = $CONFIG['site_name'] . ' - ' . $_GET['qr'];
} elseif ($page == 'product' && $idc > 0 && $_GET['qr']) {

    $meta['title'] = $meta['title'] . ' : ' . $_GET['qr'];
} elseif ($page == 'cart') {
    
}


$uri = $_SERVER['REQUEST_URI'];


if ($cateinfo['keywords']) {
    $site_keywords = $cateinfo['keywords'];
}


if ($_GET['p'] > 1) {
    $ptitle = " - page " . $_GET['p'];
}

if ($page == 'home' || $page == '') {
    $sql1 = "SELECT * FROM category WHERE data_type='home' $language";
    $db1 = $DBi->query($sql1);
    if ($rs1 = $DBi->fetch_array($db1)) {
        if ($rs1['title']) {
            $site_name = $rs1['title'] . $ptitle;
        } else {
            $site_name = $rs1['name'] . $ptitle;
        }
        if ($rs1['description']) {
            $site_description = $rs1['description'] . $ptitle;
        } else {
            $site_description = $CONFIG['site_name'] . $ptitle;
        }
        if ($rs1['keywords']) {
            $site_keywords = $rs1['keywords'] . $ptitle;
        } else {
            $site_keywords = $CONFIG['site_keywords'] . $ptitle;
        }
    }
} elseif ($page == 'search') {
    $site_name = $keywords . " - " . $CONFIG['site_name'] . $p1title;
} else {
    if ($meta['title']) {
        $site_name = $meta['title'] . $ptitle;
    } else {
        $site_name = $CONFIG['site_name'] . $ptitle;
    }
    if ($meta['description']) {
        $site_description = $meta['description'] . $ptitle;
    } else {
        $site_description = $CONFIG['site_description'] . $ptitle;
    }
    if ($meta['keywords']) {
        $site_keywords = $meta['keywords'] . $ptitle;
    } else {
        $site_keywords = $CONFIG['site_keywords'] . $ptitle;
    }

    if ($meta['header_tag'])
        $tpl->assignGlobal("header_tag", html_entity_decode($meta['header_tag']));
	
}
/*
  if ($page == 'staticview') {
  $iw = clean_value($_GET['iw']);
  $sql = "SELECT * FROM static WHERE active=1 AND inwhere ='" . $iw . "'";
  $db = $DBi->query($sql);
  if ($rs = $DBi->fetch_array($db)) {
  $staticview_name = $rs['name'];
  $staticview_content = $rs['content'];
  }
  $tpl->assignGlobal("site_name", $staticview_name . ' - ' . $site_name);
  } else {

  }
 */
$tpl->assignGlobal("site_name", $site_name);

$tpl->assignGlobal("site_description", $site_description);
if ($site_keywords == '') {
    $site_keywords = $CONFIG['site_keywords'];
}
$tpl->assignGlobal("site_keywords", $site_keywords);
$topa = array('&#39;');
$topb = array("'");
$tpl->assignGlobal('toppage', str_replace($topa, $topb, $CONFIG['toppage']));
$tpl->assignGlobal('bodypage', str_replace($topa, $topb, $CONFIG['bodypage']));


if ($_GET['qr']) {
    $tpl->assignGlobal("keywords", $_GET['qr']);
}
if ($lang == 'en') {
    $tpl->assignGlobal("langcode", "EN");
    $tpl->assignGlobal("langname", "English");
} else {
    $tpl->assignGlobal("langcode", "VN");
    $tpl->assignGlobal("langname", "Tiếng Việt");
}

$activeid = Get_Id_Cat_Back($idc);
$tpl->assignGlobal("urlpage", $site_address . $_SERVER['REQUEST_URI']);
//	logo
$rslg = $logo->logo();
if ($rslg['id_logo'] > 0) {
    $tpl->assign("_ROOT.logo", '<a href="/' . $lang_dir . '"><img src="' . $rslg['image'] . '" alt="' . $rslg['name'] . '" style="max-width:100%; margin:0 auto"  /></a>');
    $logosite = $rslg['image'];
}
/*
$rslg = $logo->banner();
if ($rslg['id_logo'] > 0) {
    $tpl->assign("_ROOT.banner", '<a href="/' . $lang_dir . '"><img src="' . $rslg['image'] . '" alt="' . $rslg['name'] . '" style="max-width:100%" /></a>');
}
*/

include_once("modules/menu.php");
include_once("modules/left_right_col.php");

$tpl->assign("_ROOT.menutop", menutop());

$tpl->assign("_ROOT.menubar", menubar());


$tpl->assign("_ROOT.qr", $_GET['qr']);



$root_idc = Category::get_root_category_id($idc);
$root_cat = Category::categoryInfo($root_idc);

$rs_cat = Category::categoryInfo($idc);


$tpl->assignGlobal("site_url", $site_address . $_SERVER['REQUEST_URI']);



if (intval($_GET['p']) > 1) {
	$tpl->assignGlobal("canonical_url",'<link rel="canonical" href="'. $site_address . "/" . $rs_cat['url'] .'" />');
}else{
	$tpl->assignGlobal("canonical_url", '<link rel="canonical" href="'.  $site_address .  parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH) .'" />'  );	
}



if ($page == 'cart') {
	$tpl->assignGlobal("no_index",'<meta name="robots" content="noindex, nofollow">');
	
}

$tpl->printToScreen();
?>