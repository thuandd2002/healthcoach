<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');


	$File = "../" . "products.xml";
	$Handle = fopen($File, 'w');


	$Data = '<?xml version="1.0"?>
	<rss version="2.0"	xmlns:g="http://base.google.com/ns/1.0">
	<channel>
	<title>'. $CONFIG['site_name'] .'</title>
	<link>'. $site_address .'</link>
	<description> ' . $CONFIG['site_description'] . ' </description>';


	$sql = "SELECT * FROM product WHERE active=1 ORDER BY thu_tu DESC, id_product DESC";
	$db = $DB->query($sql);

	while ($rs = mysql_fetch_array($db)) {
		
		$giaban = 0;
        if (intval($rs['pricekm']) > 0) {
			$giaban = intval($rs['pricekm']);
        } else {
            if (intval($rs['price']) > 0) {
				$giaban = intval($rs['price']);
            }
        }
		
		if ($giaban > 0){
			$description = $rs['content'];
			$description = strip_tags($description);
			$description = html_entity_decode($description);
			$description = strstrim($description,50);
			$description = "Giao hàng và lắp đặt miễn phí 100%. Bảo hành chính hãng 2 năm tại nhà";

			$product_name = $rs['name'];
			$product_name = str_replace("&"," ", $product_name);
			
			$Data .= "
			<item>
				<title> ". $product_name ." </title>
				<link> ". $site_address . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url'] ." </link>
				<description>". $description ."</description>
				<g:image_link>". $site_address  . $rs['image'] ."</g:image_link>
				<g:price>". $giaban ." VND</g:price>
				<g:condition>new</g:condition>
				<g:availability>in stock</g:availability>
				<g:brand> Bep An Khang </g:brand>				
				<g:id>". $rs['id_product'] ."</g:id>
			</item>";			
			
		}
	}
	


	$Data .= '</channel> </rss>';
	

	$ok = fwrite($Handle, $Data);
	fclose($Handle);
	echo "<div class=\"alert alert-success\" style=\"text-align:center;\"><strong>Đã cập nhật xong !</strong></div>";



?>