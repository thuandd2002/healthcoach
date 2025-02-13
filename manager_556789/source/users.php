<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/users.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$module = new User;
$module->_int();
$tpl->printToScreen();

class User extends cat_tree {

    private $page = "Người dùng";
    private $item = "người dùng";
    private $table = "users";
    private $id_item = "id_users";
    private $par_page = "users";
    private $numberPageShow = 8;
    private $numberItemPage = 30;
    private $thumbwidth = 80;
    private $data_type = 'users';

    public function _int() {
        global $tpl, $id, $pid, $dir_path, $imagedir;

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
        global $DBi, $tpl, $lang, $dklang, $tree, $pid, $CONFIG, $imagedir;
        $pid = intval($pid);
        $tpl->assignGlobal("imagedir", $imagedir);
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save&pid=' . $pid);
        $tpl->assign("active", "checked");
        $this->listModule();
    }

    private function showUpdate() {
        global $DBi, $tpl, $lang, $dklang, $id, $imagedir, $tree, $pid, $dir_path;
        $tpl->assignGlobal("imagedir", $imagedir);

        $tpl->newBlock("AddNew");
        if ($_GET['p'] > 1) {
            $pa = '&p=' . $_GET['p'];
        }
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id . '&pid=' . $pid . $pa);
        $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . " = " . $id;
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {


            $tpl->assign("name", $rs['name']);
            $tpl->assign("username", $rs['username']);
            $tpl->assign("telephone", $rs['telephone']);
            $tpl->assign("address", $rs['address']);
            $tpl->assign("email", $rs['email']);

            $tpl->assign("ngay_dang", date('d/m/Y H:i', $rs['ngay_dang']));
            $link_delete_image = "index4.php?page=action_ajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;
            if ($rs['super'] == 1)
                $tpl->assign("1super", "checked");
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $link_delete_image = "index4.php?page=action_ajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;
            if ($rs['image']) {
                $tpl->assign("image", '<img src="image.php?w=150&src=' . $dir_path . "/" . $rs['image'] . '" class="img-polaroid marginright5" align="left" id="avatar" /><br /><a href="' . $link_delete_image . '" id="trash_image" class="icon-trash" title="Xóa ảnh"></a>');
                $tpl->assign("imageurl", $rs['image']);
            }


            $this->listModule($rs[$this->id_item]);
        }
    }

    private function showList() {
        global $DBi, $tpl, $lang, $dklang, $pid, $site_address, $dir_path, $imagedir, $tree;
        $tpl->newBlock("showList");
        if (intval($_GET['p']) < 1)
            $p = 1;
        else
            $p = intval($_GET['p']);
        $tpl->assign("pid", $pid);
        $tpl->assign("par_page", $this->par_page);

        $sql = "SELECT * FROM " . $this->table . " WHERE showed = 1 ORDER BY name ASC";
        $db = paging::pagingAdmin($p, "?page=" . $this->par_page, $sql, $this->numberPageShow, $this->numberItemPage);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                username => $rs['username'],
                id => $rs[$this->id_item],
                email => $rs['email']
            ));
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&pid=' . $rs['id_category'] . '&id=' . $rs[$this->id_item]);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitem&id=' . $rs[$this->id_item] . '&table=' . $this->table . '&id_item=' . $this->id_item);
            if ($rs['super']) {
                $tpl->assign("module", "<font color='#ff0000'><b><center>Super Admin</center></b></font>");
            } else {
                $info['modules'] = "";
                $sql = "select m.name as module_name from user_module as um inner join module as m on (um.id_module=m.id_module) where um.id_user=" . $rs[$this->id_item] . " AND m.active=1";
                $x = $DBi->query($sql);
                while ($y = $DBi->fetch_array($x)) {
                    $info['modules'] .= "&nbsp;-&nbsp;" . $y['module_name'] . "<br>";
                }
                $tpl->assign("module", $info['modules']);
            }
        }
        $tpl->assign("showList.pages", $db['pages']);
    }

    private function save() {
        global $DBi, $tpl, $lang, $dklang;
        $data = $this->getData();
        if ($data) {


            $idinsert = $DBi->insertTableRow($this->table, $data);

            $a = array();
            if ($idinsert) {
                $a['id_user'] = $idinsert;
                $count = count($_POST['modules']);
                if ($count > 0) {
                    for ($i = 0; $i < $count; $i++) {
                        $a['id_module'] = $_POST['modules'][$i];

                        $lastid = $DBi->insertTableRow('user_module', $a);
                    }
                }
            }
            Message::showMessage("success", "Thêm mới thành công !");
        }
    }

    private function update($id) {
        global $DBi, $tpl, $lang, $dklang;
        $id = intval($id);
        $data = $this->getData();
        if ($data) {


            $DBi->updateTableRow($this->table, $data, $this->id_item, $id);

            if ($id) {
                $DBi->query("delete from user_module where id_user = " . intval($id));
                $a['id_user'] = $id;

                $module = $_POST['modules'];
                foreach ($module as $md) {
                    $a['id_module'] = $md;
                    $a['id_user'] = intval($id);

                    $lastid = $DBi->insertTableRow('user_module', $a);
                }
            }
            Message::showMessage("success", "Sửa chữa thành công !");
        }
    }

    private function getData($update = 0, $id = 0) {
        global $my, $_FILES, $DBi;
        $id = intval($id);
        $data = array();
        $data['name'] = compile_post('name');
        $data['username'] = compile_post('username');
        $data['email'] = compile_post('email');
        $data['active'] = intval(compile_post('active'));
        $data['super'] = intval(compile_post('super'));
        $data['telephone'] = compile_post('telephone');

        if ($_GET['code'] == 'update') {
            if (compile_post('password')) {
                $data['password'] = md5(compile_post('password'));
            }
        } else {
            $data['password'] = md5(compile_post('password'));
        }

        if ($_FILES['image']['size']) {
            if ($_GET['code'] == 'update') {
                $sql = "SELECT * FROM users WHERE id_users = $id";
                if ($rs = $DBi->fetch_array($db)) {
                    Image::deleteImage($rs['image']);
                    $data['image'] = '';
                }
                $image = Image::uploadImage('image', 'no');
                $data['image'] = $image['image'];
            } else {
                $image = Image::uploadImage('image', 'no');
                $data['image'] = $image['image'];
            }
        }


        return $data;
    }

    private function listModule($id = 0) {
        global $DBi, $tpl;

        if ($id) {
            $info['super'] = $b['super'];
            if ($info['super'] == 1)
                $tpl->assign("super", "checked='checked'");
            else
                $tpl->assign("super", "");

            $sql = "select * from user_module where id_user=" . $id;
            $x = $DBi->query($sql);
            $i = 0;
            $modules = array();
            while ($y = $DBi->fetch_array($x)) {
                $modules[$i] = $y['id_module'];
                $i++;
            }
        }
        $sql = "select * from module where active=1 order by thu_tu desc,id_module desc";
        $a = $DBi->query($sql);
        $info['module_rows'] = '';
        while ($b = $DBi->fetch_array($a)) {
            if (in_array($b['id_module'], $modules) && array_count_values($modules) > 0) {
                $info['module_rows'] .= "<li class='checkitem'><label><input type='checkbox' name='modules[]' class='noborder' value='" . $b['id_module'] . "' checked>&nbsp;&nbsp;" . $b['name'] . "</label></li>";
            } else {
                $info['module_rows'] .= "<li class='checkitem'><label><input type='checkbox' name='modules[]' class='noborder' value='" . $b['id_module'] . "'>&nbsp;&nbsp;" . $b['name'] . "</label></li>";
            }
        }
        $tpl->assign("module_rows", $info['module_rows']);
    }

}

?>