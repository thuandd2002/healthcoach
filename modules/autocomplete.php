<?php
// PDO connect *********


$keyword = $_POST['keyword'];
$keyword1 = RemoveSign($_POST['keyword']);
$sql = "SELECT * FROM search_content WHERE active = 1 AND (name_unsign LIKE ('%$keyword%') OR keywords LIKE ('%$keyword%')) AND table_name ='product' ORDER BY name ASC LIMIT 0, 10";

$db = $DBi->query($sql);
$i=0;
while($rs = $DBi->fetch_array($db)){
	// put in bold the written text


	$i++;
	$country_name = str_replace($keyword, '<b>'.$keyword.'</b>', $rs['name']);
	
	if ($rs['table_name'] == "product"){
		$sql = "SELECT * FROM product WHERE active = 1 AND id_product = $rs[id_item_value]";
		$db_pro= $DBi->query($sql);
		if($rs_pro = $DBi->fetch_array($db_pro)){
			if (intval($rs_pro['pricekm']) > 0) {
				$price = " - Giá: " . number_format($rs_pro['pricekm']); 
			} else {
				$price = " - Giá: " . number_format($rs_pro['price']);
			}
		}
		
	}

	// add new option
	$link =  "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url'];
	echo '<li onclick="set_item(\''.str_replace("'", "\'", $rs['name']).'\')"><a href="'.$link.'">'.$country_name. ' ' . $price . '</a></li>';
	
	//echo url_process::getUrlCategory($rs['id_category']) . '|';
}
if($i<=0) {
	echo '<li style="padding: 10px;">Keyword not found!</li>';	
}

?>