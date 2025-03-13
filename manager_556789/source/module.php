<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/module.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$module = new Module;
$module->_int();
$tpl->printToScreen();


class Module {
    private $table = 'module';
    private $id_item = 'id_module';
    private $par_page = 'module';
    public function _int() {
        global $DBi, $tpl;
        $tpl->assignGlobal("par_page", $this->par_page);
        $code = $_GET['code'];
        switch ($code) {
            case "showAddNew":
                $this->showAddNew();
                break;
            case "showUpdate":
                $this->showUpdate();
                break;
            case "save":
                $this->save();
                break;
            case "update":
                $this->update();
                break;
            case "ordering":
                $this->ordering();
                break;
        }
        $this->showList();
    }
    private function showAddNew() {
        global $DBi, $tpl, $lang, $dklang;
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save');
    }
    private function showUpdate() {
        global $DBi, $tpl, $lang, $dklang, $id;
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id);
        $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . " = " . $id;
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $tpl->assign("name", $rs['name']);
            $tpl->assign("gia_tri", $rs['gia_tri']);
            $tpl->assign("filefontend", $rs['filefontend']);
            $tpl->assign("thu_tu", $rs['thu_tu']);
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
        }
    }
    private function showList() {
        global $DBi, $tpl, $lang, $dklang;
        $tpl->newBlock("showList");
        $sql = "SELECT * FROM " . $this->table . " ORDER BY thu_tu ASC, id_module ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("list");
            $tpl->assign("name", $rs['name']);
            $tpl->assign("gia_tri", $rs['gia_tri']);
            
            $tpl->assign("thu_tu", $rs['thu_tu']);
            $tpl->assign("id", $rs[$this->id_item]);
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&id=' . $rs[$this->id_item]);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitemmodule&id=' . $rs[$this->id_item]);
        }
    }
    private function ordering() {
        global $DBi, $tpl, $lang, $dklang;
        $thu_tu = $_POST['thu_tu'];
        if ($thu_tu) {
            foreach ($thu_tu as $tt => $val) {
                $DBi->query("UPDATE " . $this->table . " SET thu_tu=" . $val . " WHERE " . $this->id_item . "=" . $tt);
            }
            Message::showMessage("success", "Cập nhật thứ tự thành công !");
        }
    }
    private function save() {
        global $DBi, $tpl, $lang, $dklang;
        $data = $this->getData();
        if ($data) {
            
            $lastid = $DBi->insertTableRow($this->table, $data);
            if ($lastid > 0)
                Message::showMessage("success", "Thêm mới thành công !");
            else
                Message::showMessage("success", "Không thực hiện được !");
        }
    }
    private function update() {
        global $DBi, $tpl, $lang, $dklang, $id;
        $id = intval($id);
        $data = $this->getData();
        if ($data) {

            $DBi->updateTableRow($this->table, $data, $this->id_item, $id);
            Message::showMessage("success", "Sửa chữa thành công !");
        }
    }
    private function getData() {
        global $DBi, $tpl;
        $a = array();
        $a['name'] = compile_post('name');
        $a['gia_tri'] = compile_post('gia_tri');
        $a['filefontend'] = compile_post('filefontend');
        $a['active'] = intval(compile_post('active'));
        $a['thu_tu'] = intval(compile_post('thu_tu'));
        return $a;
    }
}
?>