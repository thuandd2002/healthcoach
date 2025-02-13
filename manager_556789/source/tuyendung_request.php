<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/tuyendung_request.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$module = new TuyenDung;
$module->_int();
$tpl->printToScreen();

class TuyenDung {
    public function _int() {
        global $DBi, $tpl;
        if ($_GET['code'] == 'view') {
            $this->viewContact();
        }
        if ($_GET['code'] == 'delete') {
            $this->Delete();
        }
        $this->listContact();
    }
    
    private function listContact() {
        global $DBi, $tpl;
        $tpl->newBlock("showList");
        $sql = "SELECT * FROM tuyendung_request ORDER BY createdate DESC";
        $db = paging::pagingAdmin($_GET['p'], '?page=tuyendung_request', $sql, 8, 40);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list");
            if ($rs['xem'] == 0) {
                $tpl->assign("name", '<strong>' . $rs['name'] . '</strong>');
            } else {
                $tpl->assign("name", $rs['name']);
            }
            $tpl->assign("subject", $rs['subject']);
            $tpl->assign("createdate", date('d/m/Y H:i', $rs['createdate']));
            $tpl->assign("link", '?page=tuyendung_request&code=view&id=' . $rs['id']);
            $tpl->assign("linkdel", "?page=tuyendung_request&code=delete&id=" . $rs['id']);
        }
        $tpl->assign("showList.pages", $db['pages']);
    }
    private function viewContact() {
        global $DBi, $tpl, $id;
        $sql = "SELECT * FROM tuyendung_request WHERE id = $id";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("view");
            if ($rs['xem'] == 0) {
                $tpl->assign("name", '<strong>' . $rs['name'] . '</strong>');
            } else {
                $tpl->assign("name", $rs['name']);
            }
            $tpl->assign("createdate", date('d/m/Y H:i', $rs['createdate']));
            $tpl->assign("subject", $rs['subject']);
            $tpl->assign("phone", $rs['phone']);
            $tpl->assign("address", $rs['address']);
            $tpl->assign("email", $rs['email']);
            $tpl->assign("message", $rs['message']);
            $tpl->assign("file", $rs['file']);
            $tpl->assign("content", $rs['content']);
        }
        $DBi->query("UPDATE tuyendung_request SET xem=1 WHERE id=$id");
    }
    private function Delete() {
        global $DBi, $tpl, $id;
        $DBi->query("DELETE FROM tuyendung_request WHERE id = $id");
    }
}
?>