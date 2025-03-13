<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

$tpl = new TemplatePower("templates/footer$mobile_temp.htm");

$tpl->prepare();
$tpl->assignGlobal("dir_path", $dir_path);
langsite();


$tpl->assignGlobal('bottompage', str_replace($topa, $topb, $CONFIG['bottompage']));

$tpl->assign("_ROOT.hotlinesupport", $SETTING->hotlinesupport);
$tpl->assign("_ROOT.addresssupport", $SETTING->addresssupport);
$tpl->assign("_ROOT.emailsupport", $SETTING->emailsupport);
$tpl->assignGlobal("hotline", $SETTING->hotline);
$tpl->assignGlobal("emailsupport", $SETTING->emailsupport);
$tpl->assignGlobal(array(
    facebook => $SETTING->facebook,
    youtube => $SETTING->youtube,
    blog => $SETTING->blog,
    twitter => $SETTING->twitter,
    fanpage => $SETTING->fanpage,
    companyname => $SETTING->companyname,
    companyaddress => $SETTING->companyaddress,
    companyphone => $SETTING->companyphone,
    companyemail => $SETTING->companyemail,
    companywebsite => $SETTING->companywebsite,
    instagram => $SETTING->instagram
));
// copyright 

$footer_db = dbStatic::textFooter();

foreach ($footer_db as $footer) {
    $tpl->newBlock("footerItem");
    $tpl->assign("footername", $footer['name']);
    $tpl->assign("textfooter", $footer['content']);
}




$copyright = dbStatic::copyright();
$tpl->assignGlobal("copyright", $copyright['content']);


$tpl->assign("_ROOT.boxmenufooter1", boxmenufooter(1));
$tpl->assign("_ROOT.boxmenufooter2", boxmenufooter(2));

$tpl->assign("_ROOT.boxmenufooter3", boxmenufooter(3));


$tpl->assign("_ROOT.menufooter", menufooter());
$tpl->assign("_ROOT.menuMobile", menuMobile());
/*
if (strtolower(compile_post('addnewsletter')) == "save") {
    $newsletter = trim(strtolower(compile_post('newsletter')));
    $db = $DBi->query("SELECT * FROM newsletter WHERE email =  '$newsletter' ");
    if ($DBi->num_rows($db) > 0)
        alert("Bạn đã đăng ký thành công"); // "Đăng ký thành công !";
    else {
        $db = $DBi->query("INSERT INTO newsletter(name,email) VALUES ('NEWS LETTER','$newsletter')");
        alert("Đăng ký thành công"); // "Đăng ký thành công !";
    }
}
*/

if ($_SESSION['cart_arr'])
    $cart_arr = $_SESSION['cart_arr'];
$quantity = 0;
foreach ($cart_arr as $rs) {
    $soluong = intval($rs['quantity']);
    $quantity += $soluong;
}

$tpl->assignGlobal("quantity", intval($quantity));


$db_pop = dbMenu::selectByLocation('popup');
foreach ( $db_pop as $rs_pop ) {
	if ($rs_pop['data_type'] == 'logo') {
		
		$sql = "SELECT * FROM logo WHERE active=1 AND id_category = $rs_pop[id_category] ORDER BY thu_tu DESC LIMIT 1";
		$db_logo = $DBi->query($sql);
		while($rs_logo = $DBi->fetch_array($db_logo)){
			
			if ($rs_logo['image']) {
				
				if (!isset($_SESSION['popshowed']))
					$_SESSION['popshowed'] = 0;


				if (intval($_GET['popshowed']) >= 1){
					$_SESSION['popshowed'] = 3;
					$_SESSION['showPop'] = time();
				}

				$time_pop = time() - intval($_SESSION['showPop']);

				if ($_SESSION['popshowed'] < 3){
					$tpl->newBlock("showPopUp");
					$_SESSION['popshowed'] = intval($_SESSION['popshowed']) + 1;
					
				}elseif ($time_pop > 60*10){
					$tpl->newBlock("showPopUp");
					$_SESSION['showPop'] = time();
					$_SESSION['popshowed'] = 0;
				}
				
				$tpl->assign("image", '<img src="' . $rs_logo['image'] . '" width="100%" alt="' . $rs_logo['name'] . '" style="display: block;" />');
				$tpl->assign("link", $rs_logo['link'] );
				
			}
		}
	}
}



$tpl->printToScreen();
?>