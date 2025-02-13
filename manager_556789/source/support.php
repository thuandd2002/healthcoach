<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/support.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$module = new Support;
$module->_int();
$tpl->printToScreen();

class Support extends cat_tree {

    private $page = "Hỗ trợ trực tuyến";
    private $item = "Hỗ trợ";
    private $table = "yahoo";
    private $id_item = "id_yahoo";
    private $par_page = "support";
	private $data_type = 'support';

    public function _int() {
        global $tpl, $id, $pid, $imagedir, $dir_path;
		
		$this->get_cat_tree(0, '');
		
        $tpl->assignGlobal('pathpage', $pathpage);
        $tpl->assignGlobal("item", $this->item);
        $tpl->assignGlobal("table", $this->table);
        $tpl->assignGlobal("id_item", $this->id_item);
        $tpl->assignGlobal("par_page", $this->par_page);
        $tpl->assignGlobal("pid", $pid);
        $tpl->assignGlobal("dir_path", $dir_path);


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
		
		
		$tpl->assign("intro", ClEditor::Editor("intro", '' ));

        $tpl->assign("active", "checked");
    }

    private function showUpdate() {
        global $DBi, $tpl, $lang, $dklang, $id, $dir_image, $tree, $pid;
        $tpl->newBlock("AddNew");
		
        if ($_GET['p'] > 1) {
            $pa = '&p=' . $_GET['p'];
        }
		
		$tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id . '&pid=' . $pid . $pa);
		

        $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . " = " . $id;
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
			
            // list category
            $info['parentid1'] = $pid;
            $info['parentid'] .= '<select name="parentid" style="WIDTH: 300px" >';
            $info['parentid'] .= '<option value="0">Root</option>';
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
			
			
			
            $tpl->assign("name", $rs['name']);
            $tpl->assign("phone", $rs['phone']);

            $tpl->assign("nick", $rs['nick']);
			
			$tpl->assign("email", $rs['email']);
			
            $tpl->assign("sky", $rs['sky']);
			
			$tpl->assign("zalo", $rs['zalo']);
			
			$tpl->assign("intro", ClEditor::Editor("intro", $rs['intro']));
			
            $tpl->assign("thu_tu", $rs['thu_tu']);
            
            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="img-polaroid marginright5" width="200" align="left" />');
                $tpl->assign("imageurl", $rs['image']);
            }
			
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            
        }
    }

    private function showList() {
        global $DBi, $tpl, $lang, $language, $pid, $site_address, $dir_path, $dir_image, $tree;
        $tpl->newBlock("showList");
        if (intval($_GET['p']) < 1)
            $p = 1;
        else
            $p = intval($_GET['p']);
        $tpl->assign("pid", $pid);
        $tpl->assign("par_page", $this->par_page);
        $tpl->assign("action", "");


        if ($pid == 0) {
            $dk = " (id_category IN (SELECT id_category FROM category WHERE active = 1 $language ) OR id_category = 0) ";
        } else {
            $dk = "(" . $this->table . ".id_category=" . $pid . ") ";
        }

        $sql = "SELECT * FROM " . $this->table . " WHERE 1=1 AND $dk ORDER BY " . $this->id_item . "";
		
		

        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                nic => $rs['nic'],
                phone => $rs['phone'],
                sky => $rs['sky'],
                thu_tu => $rs['thu_tu'],
                id => $rs[$this->id_item],
            ));

            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            
			$tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&pid=' . $rs['id_category'] . '&id=' . $rs[$this->id_item]);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitem&id=' . $rs[$this->id_item] . '&table=' . $this->table . '&id_item=' . $this->id_item);
        }
    }

    private function save() {
        global $DBi, $tpl, $lang, $dklang;
        $data = $this->getData();
        if ($data) {
            $b = $DBi->compile_db_insert_string($data);
            $sql = "INSERT INTO " . $this->table . " (" . $b['FIELD_NAMES'] . ") VALUES (" . $b['FIELD_VALUES'] . ")";
            $DBi->query($sql);
            Message::showMessage("success", "Thêm mới thành công !");
        }
    }

    private function update($id) {
        global $DBi, $tpl, $lang, $dklang;
        $id = intval($id);
        $data = $this->getData();
        if ($data) {
            $b = $DBi->compile_db_update_string($data);
            $sql = "UPDATE " . $this->table . " SET " . $b . " WHERE " . $this->id_item . "=" . $id;
            $db = $DBi->query($sql);
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
        global $my, $lang;
        $id = intval($id);
        $data = array();
		
		$data['id_category'] = intval(compile_post('parentid'));
		
        $data['name'] = compile_post('name');
		
		$data['intro'] = str_replace('\\', "", $_POST['intro']);
		
		$data['image'] = compile_post('imageurl');
		
		$data['phone'] = compile_post('phone');
		$data['email'] = compile_post('email');
		
        $data['nick'] = compile_post('nick');
        $data['sky'] = compile_post('sky');
		$data['zalo'] = compile_post('zalo');

        $data['lang'] = $lang;

        $data['active'] = intval(compile_post('active'));
        $data['thu_tu'] = intval(compile_post('thu_tu'));
        return $data;
    }

}

?>