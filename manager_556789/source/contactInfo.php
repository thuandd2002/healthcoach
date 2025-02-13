<?php
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/contactInfo.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);


$module = new ContactInfo();
$module->_int();
$tpl->printToScreen();


class ContactInfo {
    private $page = "Thông tin liên hệ";
    private $item = "thông tin";
    private $table = "contactinfo";
    private $id_item = "id";
    private $par_page = "contactInfo";
    private $data_type = 'contactinfo';
    public function _int() {
        global $tpl, $id, $pid, $imagedir, $dir_path;
        $tpl->assignGlobal('pathpage', $pathpage);
        $tpl->assignGlobal("item", $this->item);
        $tpl->assignGlobal("table", $this->table);
        $tpl->assignGlobal("id_item", $this->id_item);
        $tpl->assignGlobal("par_page", $this->par_page);
        $tpl->assignGlobal("pid", $pid);
        $tpl->assignGlobal("dir_path", $dir_path);
        $tpl->assignGlobal("imagedir", $imagedir);
        $code = $_GET['code'];
        switch ($code) {
            case "showUpdate":
                $this->showUpdate();
                break;
            case "save":
                $this->save();
                break;
            case "update":
                $this->update($id);
                break;
            case "deletemulti":
                $this->deleteMultiItem();
                break;
        }
        $this->showUpdate();
    }
    private function showUpdate() {
        global $DBi, $tpl, $languageWhere, $dir_image, $tree, $pid;
        $tpl->newBlock("AddNew");
        $sql = "SELECT * FROM " . $this->table . " WHERE 1=1 $languageWhere  ";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $tpl->assign("name", $rs['name']);
            $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $rs['id']);
            $tpl->assign("content", ClEditor::Editor("content", $rs['content']));
            $link_delete_image = "index4.php?page=actionajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $data['latitude'] = compile_post('latitude');
            $data['longitude'] = compile_post('longitude');
            $data['title'] = compile_post('maptitle');
            $data['address'] = compile_post('mapaddress');
            $tpl->assign(array(
                latitude => $rs['latitude'],
                longitude => $rs['longitude'],
                maptitle => $rs['title'],
                mapaddress => $rs['address'],
            ));
        }
    }
    private function showList() {
        global $DBi, $tpl, $languageWhere, $pid, $site_address, $dir_path, $dir_image, $tree;
        $tpl->newBlock("showList");
        if (intval($_GET['p']) < 1)
            $p = 1;
        else
            $p = intval($_GET['p']);
        $tpl->assign("pid", $pid);
        $tpl->assign("par_page", $this->par_page);
        $tpl->assign("action", "");
        $sql = "SELECT * FROM " . $this->table . " WHERE 1=1  $languageWhere  ORDER BY " . $this->id_item . " DESC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                id => $rs[$this->id_item],
            ));
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&id=' . $rs[$this->id_item]);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitem&id=' . $rs[$this->id_item] . '&table=' . $this->table . '&id_item=' . $this->id_item);
        }
    }
    private function save() {
        global $DBi, $tpl, $lang, $dklang;
        $data = $this->getData();
        if ($data) {
            
            $lastid = $DBi->insertTableRow($this->table, $data);
            
            Message::showMessage("success", "Thêm mới thành công !");
        }
    }
    private function update($id) {
        global $DBi, $tpl, $lang, $dklang;
        $id = intval($id);
        $data = $this->getData();
        if ($data) {
            
            $DBi->updateTableRow($this->table, $data, $this->id_item, $id);
            
            Message::showMessage("success", "Sửa chữa thành công !");
        }
    }
    private function deleteMultiItem() {
        global $DBi;
        $multi = $_POST['delmulti'];
        if ($multi) {
            foreach ($multi as $mtId) {
                $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . "=" . $mtId;
                $db = $DBi->query($sql);
                if ($rs = $DBi->fetch_array($db)) {
                    deleteimage($rs['image']);
                }
                $DBi->query("DELETE FROM " . $this->table . " WHERE " . $this->id_item . "=" . $mtId);
                Message::showMessage("success", "Đã xóa xong !");
            }
        }
    }
    function getData($update = 0, $id = 0) {
        global $my;
        $id = intval($id);
        $data = array();
        $data['name'] = compile_post('name');
        $data['latitude'] = compile_post('latitude');
        $data['longitude'] = compile_post('longitude');
        $data['title'] = compile_post('maptitle');
        $data['address'] = compile_post('mapaddress');
        $data['content'] = $_POST['content'];
        $data['active'] = intval(compile_post('active'));
        return $data;
    }
}
?>