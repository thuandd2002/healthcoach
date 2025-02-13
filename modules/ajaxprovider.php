<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

switch ($_GET['code']) {

    case "getDistrict":
        $id = $_GET['id'];
        $selectedid = $_GET['selectedid'];
        echo locationProvider::bindDistrict($id, $selectedid);
        break;

    case "loadMoreProduct":
        $pagenum = $_GET['pagenum'];
        $idcat = $_GET['idcat'];

        loadMoreProduct($idcat, $pagenum * 20);

        break;
		
	case "star_rate":
        $id = intval($_GET['id']);
        $tb = clean_value($_GET['tb']);
        $id_tb = clean_value($_GET['id_tb']);
        $my_rate = intval($_GET['my_rate']);
        echo Rating::star_rate($tb, $id_tb, $id, $my_rate);
        break;
    
    case "get_avg_rate":
        $id = intval($_GET['id']);
        $tb = clean_value($_GET['tb']);
        $id_tb = clean_value($_GET['id_tb']);
        echo Rating::get_avg_rate($tb, $id_tb, $id);
        break;
    
    case "get_rate_count":
        $id = intval($_GET['id']);
        $tb = clean_value($_GET['tb']);
        $id_tb = clean_value($_GET['id_tb']);
        echo Rating::get_rate_count($tb, $id_tb, $id);
        break;	
		
		
}


class Rating {

    public function star_rate($tb, $id_tb, $id, $my_rate) {
        global $DBi;

        if ($id == 0)
            return 0;

        if ($my_rate > 0) {

            $ip = $_SERVER['REMOTE_ADDR'];
			
			$sql = "SELECT createdate FROM rating WHERE table_name = '$tb' AND id_table = '$id_tb' AND id_value = $id AND ip='$ip' ORDER BY id LIMIT 1 ";
			$db = $DBi->query($sql);
			if ($rs = $DBi->fetch_array($db)) {
				$createdate = intval($rs['createdate']);
			}
			$time_delay = 60*5; //5 phut moi duoc rate 1 lan
			if ((time() - $createdate) < $time_delay)
				return -1;

            $data = array();
            $data['table_name'] = $tb;
            $data['id_table'] = $id_tb;
            $data['id_value'] = $id;
            $data['rate'] = $my_rate;
            $data['ip'] = $ip;
            $data['createdate'] = time();

            $result_str = $DBi->insertTableRow("rating", $data);
        }
		
		//$result_str = $tb . '--' . $id_tb . '--' . $id . '--' . $my_rate . '--IP:' . $ip;
		
		
        return $result_str;
    }

    public function get_avg_rate($tb, $id_tb, $id) {
        global $DBi;

        if ($id == 0)
            return 0;

        $sql = "SELECT AVG(rate) as star_rate FROM rating WHERE table_name = '$tb' AND id_table = '$id_tb' AND id_value = $id ";

        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $result_str = round($rs['star_rate'], 1);
        }

        return $result_str;
    }

    public function get_rate_count($tb, $id_tb, $id) {
        global $DBi;

        if ($id == 0)
            return 0;

        $sql = "SELECT COUNT(rate) as rate_count FROM rating WHERE table_name = '$tb' AND id_table = '$id_tb' AND id_value = $id ";
        
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $result_str = intval($rs['rate_count']);
        }

        return $result_str;
    }

}




function loadMoreProduct($idc, $limFrom = 0) {
    global $DBi, $CONFIG, $cache_image_path;

    $limFrom = intval($limFrom);
    $limTo = 20;

    $tpl = new TemplatePower("templates/ajaxprovider.htm");
    $tpl->prepare();

    $tpl->newBlock("productList");

    $sql = "SELECT * FROM product WHERE active=1 AND (id_category IN (" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, name ASC LIMIT $limFrom, $limTo";

    $db = $DBi->query($sql);

    while ($rs = $DBi->fetch_array($db)) {

        $tpl->newBlock("product_item");

        $tpl->assign("name", $rs['name']);
        $tpl->assign("intro", $rs['intro']);
        $tpl->assign("ma", $rs['ma']);
        $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);

        if ($rs['icon'])
            $tpl->assign("icon", '<div class="' . $rs['icon'] . '">' . $rs['texticon'] . '</div>');

        if (intval($rs['pricekm']) > 0) {
            $tpl->assign("price", number_format($rs['pricekm']) . ' đ');
            $tpl->assign("pricekm", number_format($rs['price']) . ' đ');

            $discount = 0;
            $pricekm = intval($rs['pricekm']);
            $price = intval($rs['price']);
            $km = $price - $pricekm;
            $discount = intval(floatval($km / $price) * 100);
            if ($discount > 0)
                $tpl->assign("discount-tags", "<div class='discount-tags'>-$discount%</div>");
        } else {
            if (intval($rs['price']) > 0) {
                $tpl->assign("price", number_format($rs['price']) . ' đ');
            } else {
                if (intval($rs['price']) == 0) {
                    
                } else {
                    $tpl->assign("price", $rs['price']);
                }
            }
        }

        if ($rs['image'])
            $tpl->assign("image", '<img src="' . $cache_image_path . resizeimage1(400, 400, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" width="100%" >');


        $tpl->assign("ttkhuyenmai", str_replace("&nbsp;", " ", strstrim(strip_tags($rs['intro']), 20)));
        $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
        $tpl->assign("linkcart", $dir_path . '/' . $lang_dir . 'addcart/' . $rs['url']);

        $product_ver = json_decode($rs['product_ver']);

        foreach ($product_ver as $key => $value) {
            $tpl->newBlock("mausac");
            $tpl->assign("tenphienban", $value->tenphienban);
            $tpl->assign("motaphienban", $value->motaphienban);
        }
    }

    $tpl->printToScreen();
}

class locationProvider {

    public function bindDistrict($provinceid, $selectedid) {
        global $DBi;

        $provinceid = intval($provinceid);
        $sql = "SELECT * FROM vn_district WHERE provinceid = $provinceid";
        $db = $DBi->query($sql);

        $result_str = '<option value="">----Chọn quận huyện----</option>';

        while ($rs = $DBi->fetch_array($db)) {
            if ($selectedid == $rs['districtid'])
                $result_str.= '<option value="' . $rs['districtid'] . '" selected >' . $rs['name'] . '</option>';
            else
                $result_str.= '<option value="' . $rs['districtid'] . '">' . $rs['name'] . '</option>';
        }
        return $result_str;
    }

}

?>