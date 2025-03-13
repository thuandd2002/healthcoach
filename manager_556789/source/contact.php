<?php
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/contact.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$module = new Contact;
$module->_int();
$tpl->printToScreen();
class Contact {
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
        $sql = "SELECT * FROM contact ORDER BY createdate DESC";
        $db = paging::pagingAdmin($_GET['p'], '?page=contact', $sql, 8, 40);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list");
            if ($rs['xem'] == 0) {
                $tpl->assign("name", '<strong>' . $rs['name'] . '</strong>');
            } else {
                $tpl->assign("name", $rs['name']);
            }
            $tpl->assign("link", '?page=contact&code=view&id=' . $rs['id_contact']);
            $tpl->assign("linkdel", "?page=contact&code=delete&id=" . $rs['id_contact']);
        }
        $tpl->assign("showList.pages", $db['pages']);
    }
    private function viewContact() {
        global $DBi, $tpl, $id;
        $sql = "SELECT * FROM contact WHERE id_contact = $id";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("view");
            if ($rs['xem'] == 0) {
                $tpl->assign("name", '<strong>' . $rs['name'] . '</strong>');
            } else {
                $tpl->assign("name", $rs['name']);
            }
            $tpl->assign("createdate", date('d/m/Y H:i', $rs['createdate']));
            $tpl->assign("content", $rs['content']);
        }
        $DBi->query("UPDATE contact SET xem=1 WHERE id_contact=$id");
    }
    private function Delete() {
        global $DBi, $tpl, $id;
        $DBi->query("DELETE FROM contact WHERE id_contact = $id");
    }
}
?>