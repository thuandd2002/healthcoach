<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/product_material.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$module = new Product_Material();
$module->_int();
$tpl->printToScreen();


class Product_Material extends cat_tree {
    private $page = "Danh mục Xuất xứ hàng hóa";
    private $item = "Xuất xứ hàng hóa";
    private $table = "product_material";
    private $id_item = "id";
    private $par_page = "product_material";
    private $data_type = 'product_material';
    public function _int() {
        global $tpl, $id, $pid, $imagedir, $dir_path;
        $this->get_cat_tree(0, '');
        $tpl->assignGlobal('pathpage', $pathpage);
        $tpl->assignGlobal("page_name", $this->page);
        $tpl->assignGlobal("item", $this->item);
        $tpl->assignGlobal("table", $this->table);
        $tpl->assignGlobal("id_item", $this->id_item);
        $tpl->assignGlobal("par_page", $this->par_page);
        $tpl->assignGlobal("pid", $pid);
        $tpl->assignGlobal("dir_path", $dir_path);
        $tpl->assignGlobal("imagedir", $imagedir);

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
                $this->update($id);
                break;
            case "ordering":
                $this->ordering();
                break;
            case "deletemulti":
                $this->deleteMultiItem();
                break;
        }
        $this->showList();
    }
    private function showAddNew() {
        global $DBi, $tpl, $lang, $dklang, $tree, $pid, $CONFIG;
        $pid = intval($pid);
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save&pid=' . $pid);
        // list category
        $info['parentid1'] = $pid;
        $info['parentid'] .= '<select name="parentid" style="WIDTH: 300px" >';
        $info['parentid'] .= '<option value="0" >Root</option>';
        if ($tree)
            foreach ($tree as $k => $v) {
                foreach ($v as $i => $j) {
                    $selectstr = '';
                    if ($info['parentid1'] == $k)
                        $selectstr = " selected ";
                    $dtype = Category::idCatToDataType($k);
                    if ($dtype == $this->data_type) {
                        $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . '>' . $j . '</option>';
                    } else {
                        $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . ' disabled>' . $j . '</option>';
                    }
                }
            }
        $info['parentid'] .= '</select>';
        $tpl->assign("parentid", $info['parentid']);
        $tpl->assign("intro", ClEditor::Editor("intro", '&nbsp;'));
        $tpl->assign("content", ClEditor::Editor("content", '&nbsp;'));
        $tpl->assign("active", "checked");
    }
    private function showUpdate() {
        global $DBi, $tpl, $lang, $dklang, $id, $dir_image, $tree, $pid, $cache_image_path;
        $tpl->newBlock("AddNew");
        if ($_GET['p'] > 1) {
            $pa = '&p=' . $_GET['p'];
        }
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id . '&pid=' . $pid . $pa);

        // list category
        $info['parentid1'] = $pid;
        $info['parentid'] .= '<select name="parentid" style="WIDTH: 300px" >';
        $info['parentid'] .= '<option value="0" >Root</option>';
        if ($tree)
            foreach ($tree as $k => $v) {
                foreach ($v as $i => $j) {
                    $selectstr = '';
                    if ($info['parentid1'] == $k)
                        $selectstr = " selected ";
                    $dtype = Category::idCatToDataType($k);
                    if ($dtype == $this->data_type) {
                        $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . '>' . $j . '</option>';
                    } else {
                        $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . ' disabled>' . $j . '</option>';
                    }
                }
            }
        $info['parentid'] .= '</select>';
        $tpl->assign("parentid", $info['parentid']);
        $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . " = " . $id;
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $tpl->assign("name", $rs['name']);
            $tpl->assign("code_name", $rs['code_name']);
            $tpl->assign("intro", ClEditor::Editor("intro", $rs['intro']));
            $tpl->assign("content", ClEditor::Editor("content", $rs['content']));
            $link_delete_image = "index4.php?page=actionajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;
            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $cache_image_path . resizeimage(160, 120, $dir_path . "/" . $rs['image']) . '" class="img-polaroid marginright5" align="left" id="avatar" />
				<br /><a href="' . $link_delete_image . '" id="trash_image" class="icon-trash" title="Xóa ảnh"></a>');
                $tpl->assign("imageurl", $rs['image']);
            }
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            if ($rs['hot'] == 1)
                $tpl->assign("hot", "checked");
        }
    }
    private function showList() {
        global $DBi, $tpl, $lang, $pid, $site_address, $dir_path, $dir_image, $tree;
        $tpl->newBlock("showList");
        if (intval($_GET['p']) < 1)
            $p = 1;
        else
            $p = intval($_GET['p']);
        $tpl->assign("pid", $pid);
        $tpl->assign("par_page", $this->par_page);
        $tpl->assign("action", "?page=" . $this->par_page . "&code=ordering&pid=" . $pid . "&p=" . $p);
        /* if($lang=='en'){
          $dklang = " WHERE lang='en' ";
          }else{
          $dklang = " WHERE lang<>'en' ";
          } */
        $sql = "SELECT * FROM " . $this->table . " $dklang ORDER BY thu_tu, " . $this->id_item . " DESC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                thu_tu => $rs['thu_tu'],
                id => $rs[$this->id_item],
            ));
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");

            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&pid=' . $rs["id_category"] . '&id=' . $rs[$this->id_item]);
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
        global $my, $lang, $clsUrl;
        $id = intval($id);
        $data = array();
        $data['name'] = compile_post('name');
        $data['id_category'] = compile_post('parentid');
        $data['intro'] = $_POST['intro'];
        $data['content'] = $_POST['content'];
        //$data['code_name']	= compile_post('code_name');
        $data['lang'] = $lang;
        //$data['ngay_dang']	= time();
        $data['active'] = intval(compile_post('active'));
        $data['hot'] = intval(compile_post('hot'));
        // xử lý ảnh
        $data['thu_tu'] = 1;
        $data['alias_name'] = $clsUrl->builUrl(compile_post('name'), "/", 1);
        $data['url'] = $clsUrl->builUrl(compile_post('name'), ".html", 1);

        if ($_FILES['image']['size']) {
            $image = Image::uploadImage('image', 'no');
            $data['image'] = $image['image'];
        } else {
            $data['image'] = compile_post('imageurl');
        }
        return $data;
    }
}
?>