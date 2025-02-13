<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

error_reporting(E_ERROR);

$objCart = new clsCart();
$cart_arr = array();
if ($_SESSION['cart_arr'])
    $cart_arr = $_SESSION['cart_arr'];



if ($_REQUEST['code'] == 'save') {

    saveCart();
} elseif (clean_value($_REQUEST['code']) == "update") {

    $tpl = new TemplatePower("templates/cart_update.htm");
    $tpl->prepare();
    langsite();

    $id_prod = intval($_GET['uid']);
    $soluong = intval($_GET['uqty']);

    $objCart->update_quantity($id_prod, $soluong);

    $_SESSION['cart_arr'] = $cart_arr;

    $objCart->cart_item_list($cart_arr);

    $tpl->printToScreen();
} elseif (clean_value($_REQUEST['code']) == "del") {
    $tpl = new TemplatePower("templates/cart_update.htm");
    $tpl->prepare();
    langsite();
    $itemremove = intval($_GET['uid']);
    if ($itemremove > 0)
        $objCart->remove_item($itemremove);

    $_SESSION['cart_arr'] = $cart_arr;
    $objCart->cart_item_list($cart_arr);
    $tpl->printToScreen();
}elseif (clean_value($_REQUEST['code']) == "add") { //Add ajax
    $idp = intval($_GET['idp']);
    $uri = intval($_GET['uri']);
    $quantity = intval($_GET['qty']);
    if ($quantity == 0)
        $quantity = 1;


    if ($_SESSION['cart_arr'])
        $cart_arr = $_SESSION['cart_arr'];

    if ($idp > 0)
        $rs_product = $objCart->getProductById($idp);
    else
        $rs_product = $objCart->getProductInfo($uri);

    if (intval($rs_product['id_product']) > 0)
        $objCart->add_item($rs_product, $quantity);

    $_SESSION['cart_arr'] = $cart_arr;

    foreach ($cart_arr as $rs) {
        $soluong = intval($rs['quantity']);
        $quantity += $soluong;
    }
    echo $quantity;
} else {

    $tpl = new TemplatePower("templates/cart.htm");

    $tpl->prepare();
    langsite();
    /*
      $generalproduct = $static->generalproduct();
      if (strlen($generalproduct["content"]) > 10)
      $tpl->assignGlobal("generalproduct", $generalproduct["content"]);
      $tpl->assignGlobal("call_buy",$SETTING->call_buy);
     */

    $idp = intval($_GET['idp']);
    if ($_SESSION['cart_arr'])
        $cart_arr = $_SESSION['cart_arr'];

    if ($idp > 0)
        $rs_product = $objCart->getProductById($idp);
    else
        $rs_product = $objCart->getProductInfo($uri);


    $quantity = intval($_GET['qty']);
    if ($quantity == 0)
        $quantity = 1;

    if (intval($rs_product['id_product']) > 0)
        $objCart->add_item($rs_product, $quantity);

    $_SESSION['cart_arr'] = $cart_arr;
    $objCart->cart_item_list($cart_arr);

    $tpl->printToScreen();
}

class clsCart {

    private $numberpage = 8;
    private $numberitempage = 15;

    public function __construct() {
        global $DB, $tpl, $dir_path, $SETTING;
    }

    public function add_item($rs_product, $quantity) {
        global $DB, $idc, $tpl, $dir_path, $cache_image_path, $cart_arr, $_GET;
        $color = clean_value($_GET['k']);
        $size = clean_value($_GET['s']);



        $id_product = intval($rs_product['id_product']);

        if ($id_product > 0) {
            if (doubleval($rs_product['pricekm']) > 0)
                $price = $rs_product['pricekm'];
            else
                $price = doubleval($rs_product['price']);

            /*
            $product_ver = json_decode($rs_product['product_ver']);
            foreach ($product_ver as $key => $value) {
                if ($color == $value->tenphienban)
                    $price = $value->giaphienban;
            }
            */
            

            $product_item = array(
                id_product => $id_product,
                name => $rs_product['name'],
                image => $rs_product['image'],
                don_vi => $rs_product['don_vi'],
                id_category => $rs_product['id_category'],
                url => $rs_product['url'],
                price => $price,
                size => $size,
                color => $color,
                quantity => $quantity,
            );
            $cart_arr["$id_product"] = $product_item;
        }
    }

    public function update_quantity($id_product, $new_quantity) {
        global $cart_arr;

        foreach ($cart_arr as $key => $value) {
            if ($key == $id_product) {
                $cart_arr[$key]['quantity'] = $new_quantity;
            }
        }
    }

    public function remove_item($id_product) {
        global $cart_arr;

        unset($cart_arr["$id_product"]);
    }

    public function cart_item_list($cart_arr) {
        global $cache_image_path, $tpl;


        $giohang_tongtien = 0;
        $i = 0;
        $reversed = array_reverse($cart_arr);
        foreach ($reversed as $rs) {
            $tpl->newBlock("giohang_row");
            $i++;
            $tpl->assign("stt", $i);
            $tpl->assign("id_product", $rs['id_product']);
            $tpl->assign("giohang_name", $rs['name']);
            $tpl->assign("giohang_soluong", $rs['quantity']);
            $tpl->assign("giohang_price", number_format($rs['price']));
            $tpl->assign("giohang_image", '<img  src="' . $cache_image_path . cropimage(100, 100, $dir_path . '/' . $rs['image'], false) . '" align="left" />');
            $tpl->assign("link_detail", '/' . url_process::getUrlCategory($rs['id_category']) . $rs['url']);
            $tpl->assign("size", $rs['size']);
            $tpl->assign("color", $rs['color']);
            $tpl->assign("donvitinh", $rs['don_vi']);
            $thanhtien = doubleval($rs['price']) * intval($rs['quantity']);
            $tpl->assign("giohang_thanhtien", number_format($thanhtien));
            $giohang_tongtien += $thanhtien;
        }

        $tpl->assignGlobal("giohang_tongtien", number_format($giohang_tongtien));
    }

    public function getProductInfo($url_product) {
        global $DBi;

        $url_product_arr = explode('/', $url_product);
        $url_product = end($url_product_arr);

        $pos = strpos($url_product, "?");
        if ($pos > 0)
            $url_product = substr($url_product, 0, $pos);

        if (strlen($url_product) > 3) {

            $sql = "SELECT * FROM product WHERE active = 1 AND url = '$url_product'";

            $db = $DBi->query($sql);
            $rs = $DBi->fetch_array($db);

            return $rs;
        }
    }

    public function getProductById($id_product) {
        global $DBi;

        if ($id_product > 0) {

            $sql = "SELECT * FROM product WHERE active = 1 AND id_product = $id_product";

            $db = $DBi->query($sql);
            $rs = $DBi->fetch_array($db);
            return $rs;
        }
    }

}

/* End class cart */

function saveCart() {
    global $DB, $DBi, $CONFIG;


    if (strtolower($_SESSION['imagesercurity']) == strtolower(compile_post('sercurity'))) {

        $a = array();

        $a['name'] = compile_post('yourname');
        $a['email'] = compile_post('email');
        $a['phone'] = compile_post('phone');
        $a['address'] = compile_post('address');
        $a['other_request'] = compile_post('other_request');

        $a['masothue'] = compile_post('masothue');
        $a['tencongty'] = compile_post('tencongty');
        $a['diachicongty'] = compile_post('diachicongty');



        $a['createdate'] = time();

        $message = '

    <table width="100%" border="1" cellspacing="0" cellpadding="0">

         <tr>
                   <td height="30" colspan="2" align="left" valign="middle"><strong> Thông tin khách hàng: </strong></td>
        </tr>

                 <tr>
                   <td height="30" align="left" style="width:200px;" valign="middle">Họ tên:</td>
                   <td height="30" align="left" valign="middle"><strong>' . $a['name'] . '</strong></td>
          </tr>

                 <tr>
                   <td height="30" align="left" valign="middle">E-mail:</td>
                   <td height="30" align="left" valign="middle"><strong>' . $a['email'] . '</strong></td>
          </tr>
                 <tr>
                   <td height="30" align="left" valign="middle">Điện thoại:</td>
                   <td height="30" align="left" valign="middle"><strong>' . $a['phone'] . '</strong></td>
          </tr>

         <tr>
                   <td height="30" align="left" valign="middle">Địa chỉ:</td>
                   <td height="30" align="left" valign="middle"><strong>' . $a['address'] . '</strong></td>
          </tr>
          <tr>
                   <td height="30" align="left" valign="middle"><strong>Yêu cầu khác</strong>: </td>
                   <td height="30" align="left" valign="middle"><i>' . $a['other_request'] . '</i></td>
          </tr>
          
 <tr>
                   <td height="30" colspan="2" align="left" valign="middle"><strong> Thông tin xuất hóa đơn: </strong></td>
        </tr>
<tr>
                   <td height="30" align="left" valign="middle"><strong>Mã số thuế</strong>: </td>
                   <td height="30" align="left" valign="middle"><i>' . $a['masothue'] . '</i></td>
          </tr>
          
<tr>
                   <td height="30" align="left" valign="middle"><strong>Tên công ty</strong>: </td>
                   <td height="30" align="left" valign="middle"><i>' . $a['tencongty'] . '</i></td>
          </tr>
          
<tr>
                   <td height="30" align="left" valign="middle"><strong>Địa chỉ công ty</strong>: </td>
                   <td height="30" align="left" valign="middle"><i>' . $a['diachicongty'] . '</i></td>
          </tr>

      </table>';

        if ($_SESSION['cart_arr'])
            $cart_arr = $_SESSION['cart_arr'];

        $product_msg .= ' <br/>
            <strong>Danh sách sản phẩm:</strong>
            <br/>
            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr>
                  <th width="5%" align="center">STT</th>
                  <th align="center">Tên sản phẩm</th>
                  <th width="12%" align="center">Giá bán</th>
                  <th width="10%" align="center">Số lượng</th>
                  <th width="12%" align="center">Thành tiền</th>
                </tr>
                ';


        $cart_reversed = array_reverse($cart_arr);
        $tt = 0;
        foreach ($cart_reversed as $rs) {

            $product_msg .= '<tr>
                <td align="center">' . ($tt + 1) . '</td>
                <td>' . $rs['name'] . ' </td>
                <td>' . number_format($rs['price']) . ' / ' . $rs['don_vi'] . '</td>                    
                <td>' . $rs['quantity'] . '</td>
                <td align="right">' . number_format($rs['quantity'] * $rs['price']) . '</td>
              </tr>';

            $giohang_tongtien = $giohang_tongtien + doubleval($rs['quantity'] * $rs['price']);

            $tt++;
        }

        $product_msg .= '<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td align="right"><strong>Tổng tiền</strong></td>
			<td align="right"><strong>' . number_format($giohang_tongtien, 0) . '</strong></td>
		  </tr>
		</table>';

        //$customer_ip = ip_info("Visitor", "ip");
        //$customer_loc =  ip_info("Visitor", "Address");

        $c = array();

        $session = md5(uniqid(rand()));
        $_SESSION['scid'] = $session;

        $c['session'] = $session;

        //$c['name'] = "Order from " . $data['name'] . " (IP: $customer_ip - Location: $customer_loc )";
        $c['name'] = "Thông tin đặt hàng từ " . $a['name'];
        $c['email'] = $a['email'];
        if (intval($memberid) > 0)
            $c['username'] = $memberid;
        else
            $c['username'] = 0;

        $c['content'] = $message . $product_msg;
        $c['email'] = $a['email'];
        $c['phone'] = $a['phone'];
        $c['address'] = $a['address'];
        $c['total'] = $giohang_tongtien;
        $c['createdate'] = time();
        //$c['customer_ip'] = $customer_ip;
        //$c['customer_loc'] = $customer_loc;


        $id_order = $DBi->insertTableRow('orders', $c);
        $_SESSION['id_order'] = $id_order;

        echo "1";

        $_SESSION['cart_arr'] = array();
        if (isset($_SESSION['cart_arr'])) {
            unset($_SESSION['cart_arr']);
        }


        $subject = "Thông tin đặt hàng từ " . $a['name'] . " - " . date('d/m/Y H:i', $a['createdate']);

        try {
            sendmail($CONFIG['site_email'], $subject, $message . $product_msg , $site_address);
        } catch (exception $e) {
            echo "1";
        }
    } else {
        echo "-1";
    }
}

?>