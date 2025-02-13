<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class dbProduct {

    public function itemList($idc, $limit = 6, $filter = '', $orderby = '', $hangid = 0) {

        global $DBi, $SETTING, $dir_path, $_GET;
        $idc = intval($idc);

        if ($_GET['qr']) {

            $qr = clean_value($_GET['qr']);

            $search = " AND name LIKE '%" . $qr . "%' ";
        }
        if ($orderby != '') {
            $orderby = $orderby;
        } else {
            $orderby = 'ORDER BY thu_tu DESC, name ASC';
        }
		/*
        if ($pr > 0) {
            $db_dt = $DB->query("SELECT * FROM price_range WHERE id = $pr ");
            if ($rs_dt = mysql_fetch_array($db_dt)){
                $dt_min = intval($rs_dt['min_value']);
                $dt_max = intval($rs_dt['max_value']);
                $strWhere .= " AND ((price >= $dt_min AND price <= $dt_max) OR (pricekm >= $dt_min AND pricekm <= $dt_max)) ";
            }
        }		
		*/
		
		/*
		//OR
        if (isset($_GET['pr']) && $_GET['pr'] != '') {
            $pr = $_GET['pr'];
            $price = explode("-", $pr);
            $pricemin = intval($price[0]);
            $pricemax = intval($price[1]);
            if ($pricemin >= $pricemax) {
                $filter.= " AND CONVERT(price, UNSIGNED) >= " . $pricemax . " AND CONVERT(price, UNSIGNED) <= " . $pricemin . " ";
            } else {
                $filter.= " AND CONVERT(price, UNSIGNED) >= " . $pricemin . " AND CONVERT(price, UNSIGNED) <= " . $pricemax . " ";
            }
			
			$tpl->assignGlobal("price_filter",":<span style='color:#f00;'>$pricemin zł - $pricemax zł</span>");
			
        }		
		
		*/
		
        $data = array();

        $hang = explode("/", $_SERVER['REQUEST_URI']);
        if ($hang[1] == 'hang') {
            $hang_id = $this->getManufacture($hang[2]);
        } else {
            $hang_id = 0;
        }
        if ($hang_id > 0) {
            $sql = "SELECT * FROM product WHERE active=1 AND id_manufacture = " . intval($hang_id) . "  $filter $search $orderby";
            $db1 = paging::pagingFonten($_GET['p'], $dir_path . "/hang/" . $hang[2] . '/', $sql, 8, 200);
        } else {
            $sql = "SELECT * FROM product WHERE active=1 AND (id_category IN (" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') $filter $search $orderby";
            $db1 = paging::pagingFonten($_GET['p'], $dir_path . "/" . url_process::getUrlCategory($idc), $sql, 8, $limit);
        }

        while ($rs = $DBi->fetch_array($db1['db']))
            $data[] = $rs;

        $data['pages'] = $db1['pages'];

        return $data;
    }

    public function itemDetail($id) {

        global $DBi, $SETTING;

        $id = intval($id);

        $sql = "SELECT * FROM product WHERE id_product = $id";

        $db = $DBi->query($sql);

        $rs = $DBi->fetch_array($db);

        return $rs;
    }

    public function item_other($idc, $id) {

        global $DBi, $SETTING;

        $idc = intval($idc);

        $id = intval($id);

        $sql = "SELECT * FROM product WHERE active = 1 AND id_product <> $id AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY RAND() LIMIT 0,16";

        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {

            $data[] = $rs;
        }

        return $data;
    }

    /* public function other_product($tags, $id) {

      global $DBi, $SETTING,$idc;

      $idc = intval($idc);

      $id = intval($id);

      if($tags){
      $sql ="SELECT * FROM product
      WHERE name LIKE '%$tags%'  AND id_product <> $id AND active = 1
      ORDER BY IF( name LIKE '$tags%',0,
      IF( name LIKE '%$tags', 1, 2 ) ) LIMIT 6";
      }else{
      $sql = "SELECT * FROM product WHERE active = 1 AND  (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') AND id_product <> $id  ORDER BY id_product DESC LIMIT 0,6";
      }

      $db = $DBi->query($sql);

      while ($rs = $DBi->fetch_array($db)) {

      $data[] = $rs;

      }

      return $data;

      } */

    public function other_product($id, $id_category, $limit = 6) {
        global $DBi, $SETTING;
        $id_category = intval($id_category);
        $id = intval($id);

        $limit = intval($limit);

        $sql = "SELECT * FROM product WHERE active = 1 AND  (id_category IN(" . Category::getParentId($id_category) . ")) AND id_product <> $id  ORDER BY RAND() LIMIT 0, $limit ";

        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db))
            $data[] = $rs;

        return $data;
    }
	
	
    public function sanphamdaxem($listID) {

        global $DBi, $SETTING;
        $idp = explode(",", $listID);
        $lstID = '0';
        foreach ($idp as $id) {
            $lstID .= ',' . intval($id);
        }

        $sql = "SELECT * FROM product WHERE active = 1 AND id_product IN(" . $lstID . ")  ORDER BY FIELD(id_product,$lstID) DESC LIMIT 0,20";
		//echo $sql;
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

	

    public function splienquan($listID) {

        global $DBi, $SETTING;
        $idp = explode(",", $listID);
        $lstID = '0';
        foreach ($idp as $id) {
            $lstID .= ',' . intval($id);
        }

        $sql = "SELECT * FROM product WHERE active = 1 AND id_product IN(" . $lstID . ") ORDER BY id_product DESC LIMIT 0,10";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function product_manufactory($id_manufacture = 0) {
        global $DBi, $SETTING;

        $sql = "SELECT * FROM product WHERE active = 1 AND  (id_category IN(" . Category::getParentId($id_category) . ")) AND id_manufacture = $id_manufacture  ORDER BY RAND() ";

        $db = $DBi->query($sql);
        //$db = paging::pagingAjax($_GET['p'],"/index4.php?page=otherproduct&idc=$idc",$sql,8,8);
        while ($rs = $DBi->fetch_array($db))
            $data[] = $rs;

        return $data;
    }

    public function item_old($idc, $id) {

        global $DBi, $SETTING, $id;

        $id = intval($id);

        $idc = intval($idc);

        $sql = "SELECT * FROM product WHERE active = 1 AND  (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') AND id_product < $id  ORDER BY id_product DESC LIMIT 0,5";

        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {

            $data[] = $rs;
        }

        return $data;
    }

    function getAttr($idc, $attr) {
        global $DBi;

        $idc = intval($idc);

        $attribute = json_decode($attr);
        $sql = "SELECT * FROM category WHERE id_category = $idc";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {

            $sql1 = "SELECT g.*,p.name AS attrName, p.default_value AS defaultvalue,p.alias_name as aliasname FROM group_attribute AS g LEFT JOIN pro_attribute AS p ON(g.id_attr = p.id) WHERE g.id_group = " . intval($rs['id_attr']) . " ORDER BY g.thu_tu ASC, p.name    ";

            $str = '<ul>';
            $db1 = $DBi->query($sql1);

            while ($rs1 = $DBi->fetch_array($db1)) {

                if ($rs1['attrName']) {
                    $idattr = "$rs1[id_attr]";
                    if ($attribute->$idattr != '') {
                        $str .= "<li> <strong> " . $rs1['attrName'] . ":</strong> " .  $attribute->$idattr . "</li>";
                    }
                }
                
            }
            $str .= '</ul>';
            return $str;
        }
    }

    function getAttrDetail($idc, $attr) {
        global $DBi;
        $idc = intval($idc);
        $attribute = json_decode($attr);
        $sql = "SELECT * FROM category WHERE id_category = $idc";
        $db = $DBi->query($sql);

        if ($rs = $DBi->fetch_array($db)) {
            $sql1 = "SELECT g.*,p.name AS attrName, p.default_value AS defaultvalue,p.alias_name as aliasname FROM group_attribute AS g LEFT JOIN pro_attribute AS p ON(g.id_attr = p.id) WHERE g.id_group = " . intval($rs['id_attr']) . " ORDER BY g.thu_tu ASC, p.name";

            $db1 = $DBi->query($sql1);
            $data = array();
            while ($rs1 = $DBi->fetch_array($db1)) {

                if ($rs1['attrName']) {
                    $idattr = "$rs1[id_attr]";
                    if ($attribute->$idattr != '') {
                        $data[$rs1['attrName']] = $attribute->$idattr;
                    }
                }
            }

            return $data;
        }
    }

    private function getManufacture($alias_name) {
        global $DBi;
        $alias_name = clean_value($alias_name);
        $sql = "SELECT * FROM product_manufacture WHERE (alias_name = '" . $alias_name . "')";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            return $rs['id'];
        } else {
            return 0;
        }
    }

    public function getManufactureDetail($id) {
        global $DBi;
        $alias_name = clean_value($alias_name);
        $sql = "SELECT * FROM product_manufacture WHERE id = $id";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            return $rs;
        } else {
            return '';
        }
    }

    public function getManufactureName($id) {
        global $DBi;
        $id = intval($id);
        $sql = "SELECT * FROM product_manufacture WHERE id = $id";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            return $rs['name'];
        } else {
            return "";
        }
    }
	
    public function getMaterialName($id) {
        global $DBi;
        $id = intval($id);
        $sql = "SELECT * FROM product_material WHERE id = $id";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            return $rs['name'];
        } else {
            return "";
        }
    }	

    public function showPrice($rs) {
        global $tpl;
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
                $tpl->assign("price", $rs['price']);
            }
        }
		
		$tpl->assign("price_number", intval($rs['price']));
		
    }

}

?>