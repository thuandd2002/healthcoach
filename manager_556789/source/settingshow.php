<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);
error_reporting(E_ERROR);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/settingshow.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$module = new SettingShow();
$module->_int();
$tpl->printToScreen();

class SettingShow extends cat_tree {
    private $page = "Cấu hình hiển thị";
    private $item = "Cấu hình";
    private $table = "settingshow";
    private $id_item = "id";
    private $par_page = "settingshow";

    private $data_type = 'settingshow';
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
        global $DBi, $tpl, $lang, $dklang, $dir_image, $tree, $pid;
        $tpl->newBlock("AddNew");
        if ($_GET['p'] > 1) {
            $pa = '&p=' . $_GET['p'];
        }
        $id = 1;
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id . '&pid=' . $pid . $pa);
        $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . " = " . $id;
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $tpl->assign("name", $rs['name']);
            $setting = array();
            $setting = json_decode($rs['content']);
            //$setting = $this->stripslashes_deep(json_decode($rs['content']));
            /* echo '<pre>' ;
              print_r($setting);
              echo '</pre>'; */
            if ($setting)
                foreach ($setting as $st => $st1) {
                    if ($st == 'generaldetailpro') {
                        $tpl->assign("generaldetailpro", ClEditor::EditorBase("setting[generaldetailpro]", $st1));
                    } else if ($st == 'phoneaddress') {
                        $tpl->assign("phoneaddress", ClEditor::EditorBase("setting[phoneaddress]", $st1));
                    } else if ($st == 'page404') {
                        $tpl->assign("page404", ClEditor::EditorBase("setting[page404]", $st1));
                    } else {
                        $tpl->assign($st, $st1);
                    }
                }
        }
    }
    private function showList() {
        global $DBi, $tpl, $lang, $dklang, $pid, $site_address, $dir_path, $dir_image, $tree;
        $tpl->newBlock("showList");
        if (intval($_GET['p']) < 1)
            $p = 1;
        else
            $p = intval($_GET['p']);
        $tpl->assign("pid", $pid);
        $tpl->assign("par_page", $this->par_page);
        $tpl->assign("action", "");
        $sql = "SELECT * FROM " . $this->table . " ORDER BY " . $this->id_item . " DESC";
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
        $attr = $_POST['setting'];
        $data['content'] = json_encode($attr);
        return $data;
    }
    function stripslashes_deep($value) {
        $value = is_array($value) ?
                array_map('stripslashes_deep', $value) :
                stripslashes($value);
        return $value;
    }
}
?>