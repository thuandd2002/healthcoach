<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com

error_reporting(E_ERROR);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/order.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$status_post = clean_value($_GET['statusupdate']);
if (strlen($status_post) > 0) {
    $status_post = intval($status_post);
    $sql = "UPDATE orders SET status=$status_post WHERE id_order=$id";
    $DBi->query($sql);
}
if (($_GET['code'] == '01') && $id) {
    $tpl->newBlock("viewcart");
    $sql = "Select * from orders where id_order= $id ORDER by id_order DESC";
    $a = $DBi->query($sql);
    $info = array();
    if ($b = $DBi->fetch_array($a)) {
        $session = $b['session'];
        $tpl->assign("id_order", $b['id_order']);
        $tpl->assign("name", $b['name']);
        $tpl->assign("phone", $b['tel']);
        $tpl->assign("code", $b['code']);
        $tpl->assign("email", $b['email']);
        $tpl->assign("address", $b['address']);
        $tpl->assign("content", $b['content']);
        if ($b['payment_type'] == 1)
            $tpl->assign("payment_type", "Chuyển khoản");
        elseif ($b['payment_type'] == 2)
            $tpl->assign("payment_type", "TT trực tuyến");
        else
            $tpl->assign("payment_type", "Khác - COD");
        $tpl->assign("transStatus", $b['transStatus']);
        $tpl->assign("TransactionNo", $b['TransactionNo']);
        $tpl->assign("ResponseCode", $b['ResponseCode']);
        $tpl->assign("BankCode", $b['BankCode']);
        $tpl->assign("PayDate", $b['PayDate']);
        $tpl->assign("OrderInfo", $b['OrderInfo']);
        $tpl->assign("total", number_format($b['total']));
        $tpl->assign("status" . $b['status'], "selected='selected'");
        $tpl->assign("createdate", date('d/m/Y H:i', $b['createdate']));
        $tpl->assign("ip", $b['customer_ip']);
        $tpl->assign("loc", $b['customer_loc']);
    }
    $DBi->query("UPDATE orders SET xem=1 WHERE id_order=$id");
}
// xoa don hang
if ($_GET['code'] == '02') {
    $sql = "DELETE FROM orders WHERE id_order=$id";
    $DBi->query($sql);
    Message::showMessage("success", "Đã xóa xong !");
}
if ($_GET['code'] == '03') {
    $keyword = $_POST['keyword'];
    $keyword = ereg_replace("#", "", $keyword);
    $dk = " AND name LIKE '%" . $keyword . "%' OR code LIKE '%" . $keyword . "%' OR email LIKE '%" . $keyword . "%' OR phone LIKE '%" . $keyword . "%' ";
    showlist($dk);
} else {
    showlist();
}
$tpl->printToScreen();
function showlist($dk = '') {
    global $DBi, $tpl;
    $tpl->newBlock("showList");
    $tu_ngay = clean_value($_GET['fd']);
    if (strlen($tu_ngay) > 0) {
        $tpl->assign("tu_ngay", $tu_ngay);
        $tu_ngay = string_to_microtime($tu_ngay);
        $dk .= " AND createdate >= $tu_ngay ";
    }
    $den_ngay = clean_value($_GET['td']);
    if (strlen($den_ngay) > 0) {
        $tpl->assign("den_ngay", $den_ngay);
        $den_ngay = string_to_microtime($den_ngay) + (24 * 60 * 60);
        $dk .= " AND createdate <= $den_ngay ";
    }
    $status = clean_value($_GET['st']);
    if ($status == '')
        $status = -1;
    $tpl->assign("status$status", "selected");
    $tpl->assign("status", $status);
    if ($status >= 0) {
        $dk .= " AND status = $status ";
    }
    $memberid = intval($_GET['member']);
    if ($memberid > 0)
        $dk .= " AND username = $memberid ";
    $sql = "Select * from orders WHERE 1=1 $dk ORDER BY id_order DESC";
    $a = paging::pagingAdmin($_GET['p'], "?page=order", $sql, 8, 50);
    $info = array();
    $i = 0;
    while ($b = $DBi->fetch_array($a['db'])) {
        $i++;
        $tpl->newBlock("list_order");
        $tpl->assign("tt", $i);
        $tpl->assign("id_order", $b['id_order']);
        $tpl->assign("name", $b['name']);
        $tpl->assign("code", $b['code']);
        if ($b['payment_type'] == 1)
            $tpl->assign("payment_type", "Chuyển khoản");
        elseif ($b['payment_type'] == 2)
            $tpl->assign("payment_type", "TT trực tuyến");
        else
            $tpl->assign("payment_type", "Khác - COD");
        $tpl->assign("transStatus", $b['transStatus']);
        $tpl->assign("total", number_format($b['total']));
        $tpl->assign("time", date("d/m/Y | H:i", $b['createdate']));
        $tpl->assign("createdate", date("d/m/Y | H:i", $b['createdate']));
        if ($b['xem'] == 1)
            $tpl->assign("normal", "normal");
        else
            $tpl->assign("normal", "bold");
        if ($b['status'] == 0)
            $tpl->assign("status", "<span style='color:#0000ff'> CHỜ DUYỆT  </span>");
        if ($b['status'] == 1)
            $tpl->assign("status", "<span style='color:#138f18'> THÀNH CÔNG </span>");
        if ($b['status'] == 2)
            $tpl->assign("status", "<span style='color:#ff00ff'>ĐÃ HỦY </span>");
        if ($b['status'] == 3)
            $tpl->assign("status", "<span style='color:#ff9900'> Đang xử lý </span>");
        if ($b['status'] == 31)
            $tpl->assign("status", "<span style='color:#ff9900'> Đã gửi</span>");
        if ($b['status'] == 32)
            $tpl->assign("status", "<span style='color:#ff9900'> Đã nhận hàng</span>");
        if ($b['status'] == 33)
            $tpl->assign("status", "<span style='color:#ff0000'> TỪ CHỐI</span>");
        $tpl->assign("linkdel", "?page=order&id=$b[id_order]&code=02&member=$memberid");
        $tpl->assign("link", "?page=order&id=$b[id_order]&code=01&member=$memberid");
    }
    $tpl->assignGlobal('pages_items', $a['pages']);
}
function getLinkPro($id) {
    global $DBi;
    $id = intval($id);
    $sql = "SELECT * FROM product WHERE id_product = $id";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        return url_process::getUrlCategory($rs['id_category']) . $rs['url'];
    }
}
?>