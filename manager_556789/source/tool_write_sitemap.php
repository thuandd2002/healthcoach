<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$table_array = array(
    'news' => 'id_news',
    'info' => 'id_info',
    'product' => 'id_product',
    'du_an' => 'id_duan',
	'service' => 'id_service',
    'album' => 'id_album',
	'video' => 'id_video'
);
$data_type_not_write = array(
    'logo'
);
write_sitmap();

function write_sitmap() {
    global $DBi, $CONFIG, $lang, $table_array, $data_type_not_write, $site_address;
    if ($CONFIG['dir_path'] == '')
        $rootpath = '/';
    else
        $rootpath = $CONFIG['dir_path'];
    $File = "../" . "sitemap.xml";
    $Handle = fopen($File, 'w');
    $Data = '<?xml version="1.0" encoding="UTF-8"?>
		<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
			<url>
				<loc>' . $site_address . '</loc>
				<lastmod>' . date('c',  time()  ) . '</lastmod>
				<priority>1.00</priority>
			</url>';
			
			
    $Data .= getUrlCategory($data_type_not_write);
    foreach ($table_array as $key => $val) {
        $Data .= getUrlItem($key, $val);
    }

    $Data .= '
</urlset>
	';
    $ok = fwrite($Handle, $Data);
    fclose($Handle);
    echo "<div class=\"alert alert-success\" style=\"text-align:center;\"><strong>Đã cập nhật xong !</strong></div>";
}


function getUrlItem($table, $id) {
    global $DBi, $site_address, $dir_path, $clsUrl;
    $sql = "SELECT * FROM $table WHERE active=1 ORDER BY $id DESC";
    $db = $DBi->query($sql);
    $str = '';
    while ($rs = $DBi->fetch_array($db)) {
        $cat_url = url_process::getUrlCategory($rs['id_category']);
        if ($cat_url != '') {
			
			if (substr($rs['url'], 0, 4) != "http"){
				
				$str .= '<url>';
				$str .= '<loc>' . $site_address . $dir_path . '/' . $cat_url . $rs['url'] . '</loc>';
				$str .= '<lastmod>' . date('c', $rs['last_modify'] ) . '</lastmod>
					<priority>0.90</priority>';
				$str .= '</url> ';
			}
        }
    }
    return $str;
}

function getUrlCategory($data_type_not_write) {
    global $DBi, $site_address, $dir_path;
    $sql = "SELECT * FROM category WHERE active=1 ORDER BY name ASC";
    $db = $DBi->query($sql);
    $str = '';
    while ($rs = $DBi->fetch_array($db)) {
        if (!in_array($rs['data_type'], $data_type_not_write)) {
            if ($rs['url'] != '') {
				
				if (substr($rs['url'], 0, 4) != "http"){
					$str .= '<url>';
					$str .= '<loc>' . $site_address . $dir_path . '/' . $rs['url'] . '</loc>';
					$str .= '<lastmod>' . date('c', $rs['last_modify'] ) . '</lastmod>
					<priority>1.00</priority>';
					$str .= '</url>';
					
				}
            }
        }
    }
    return $str;
}



?>