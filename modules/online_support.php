<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');


function online_support() {
    global $DBi, $dir_path, $cache_image_path, $CONFIG, $logo;
	
	
    $tpl1 = new TemplatePower("templates/online_support.htm");
    $tpl1->prepare();

	$dbSupport = dbMenu::selectByLD("","support");

	foreach ($dbSupport as $rsSupport) {
		
		$tpl1->newBlock($pre_block_name."nhanvien_support");
		$tpl1->assign("catid", $rsSupport['id_category']);
		$tpl1->assign("catname", $rsSupport['subname']);			
		$tpl1->assign("catintro", $rsSupport['intro']);			
	
		$db = $DBi->query("SELECT * FROM yahoo WHERE active = 1 AND id_category = $rsSupport[id_category] ORDER BY thu_tu");

		while ($rs = $DBi->fetch_array($db)) {
			$tpl1->newBlock("support_item");
			
			$tpl1->assign("name", $rs["name"]);
			
			$tpl1->assign("sky", $rs["sky"]);
			$tpl1->assign("nick", $rs["nick"]);
			
			$tpl1->assign("zalo", $rs["zalo"]);
			
			
			$tpl1->assign("phone", $rs["phone"]);
			$tpl1->assign("email", $rs["email"]);
			
			if ($rs['image'])
				$tpl1->assign("image", '<img src="' . $cache_image_path . cropimage(300, 300, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%">');
			
		}			
	}



    return $tpl1->getOutputContent();
}

?>