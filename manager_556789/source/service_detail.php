<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);


defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/service_detail.tpl");
$tpl->prepare();

$id = intval($_GET['id']);
$pid = intval($_GET['pid']);

$module = new ServiceDetail();
$module->_int();
$tpl->printToScreen();

class ServiceDetail {

    private $page = "Trang Các buổi học";
    private $item = "Buổi học";
    private $table = "service_detail";
    private $id_item = "id";
    private $par_page = "service_detail";

    public function _int() {
        global $tpl, $id, $pid, $dir_path, $DBi;

        $pathpage = '<li><a href="?page=' . $this->par_page . '&pid='.$pid.'">' . $this->page . '</a> <span class="divider">></span></li>';

        $tpl->assignGlobal('pathpage', $pathpage);
        $tpl->assignGlobal("item", $this->item);
        $tpl->assignGlobal("table", $this->table);
        $tpl->assignGlobal("id_item", $this->id_item);
        $tpl->assignGlobal("par_page", $this->par_page);
        $tpl->assignGlobal("pid", $pid);
        $tpl->assignGlobal("dir_path", $dir_path);

        $sql = "SELECT * FROM service WHERE id_service = $pid";
        $db_service = $DBi->query($sql);
        if ($rs_service = $DBi->fetch_array($db_service)){
            $tpl->assignGlobal("service_name", $rs_service['name']);
        }        
        
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
                $this->showList();
                break;
            case "update":
                $this->update($id);
                $this->showUpdate();
                break;
            case "ordering":
                $this->ordering();
                $this->showList();
                break;

            default :
                $this->showList();
                break;
        }
    }

    private function showAddNew() {
        global $DBi, $tpl, $pid, $CONFIG;
        $pid = intval($pid);
        $tpl->assignGlobal("imagedir", $imagedir);
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save&pid=' . $pid);
        
        // list category
        $sql = "SELECT * FROM service WHERE id_service = $pid";
        $db_service = $DBi->query($sql);
        if ($rs_service = $DBi->fetch_array($db_service)){
            $tpl->assign("service_name", $rs_service['name']);
        }

        $tpl->assign("intro", ClEditor::EditorBase("intro", '&nbsp;'));
        $tpl->assign("content", ClEditor::Editor("content", '&nbsp;'));

        $tpl->assign("active", "checked");
        $tpl->assign("autourl", "checked");
        $tpl->assign("ngay_dang", date('d/m/Y H:i', time() + $CONFIG['time_offset']));
        //$tpl->assign("thu_tu", Order::getOrderCat($this->table));
    }

    private function showUpdate() {
        global $DBi, $tpl, $id, $pid, $cache_image_path, $dir_path;
        $tpl->assignGlobal("imagedir", $imagedir);
        $tpl->newBlock("AddNew");

        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id . '&pid=' . $pid . $pa);
        $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . " = " . $id;
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            // list category

            $tpl->assign("id_service", $rs['id_service']);

            $sql = "SELECT * FROM service WHERE id_service = $pid";
            $db_service = $DBi->query($sql);
            if ($rs_service = $DBi->fetch_array($db_service)){
                $tpl->assign("service_name", $rs_service['name']);
            }

            $tpl->assign("name", $rs['name']);
            $tpl->assign("title", $rs['title']);
            $tpl->assign("thu_tu", $rs['thu_tu']);

            $tpl->assign("intro", ClEditor::EditorBase("intro", $rs['intro']));
            $tpl->assign("content", ClEditor::Editor("content", $rs['content']));


            $tpl->assign("url", $rs['url']);
            $tpl->assign("ngay_dang", date('d/m/Y H:i', $rs['ngay_dang']));
            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="img-polaroid marginright5" width="200" align="left" />');
                $tpl->assign("imageurl", $rs['image']);
            }

            if ($rs['imageadv']) {
                $tpl->assign("pic_avataradv", '<img src="' . $rs['imageadv'] . '" class="img-polaroid marginright5" width="200" align="left" />');
                $tpl->assign("imageadv", $rs['imageadv']);
            }
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
        }
    }

    private function showList() {
        global $DBi, $tpl, $lang, $language, $pid, $site_address, $dir_path, $imagedir, $tree, $cache_image_path;
        $tpl->newBlock("showList");


        $tpl->assign("pid", $pid);
        $tpl->assign("par_page", $this->par_page);
        $tpl->assign("action", "?page=" . $this->par_page . "&code=ordering&pid=" . $pid . "&p=" . $p);
        // list category

        $sql = "SELECT " . $this->table . ".*,users.name as user_name, users.username as username FROM " . $this->table . " LEFT JOIN users ON(" . $this->table . ".id_user=users.id_users) WHERE id_service = $pid ORDER BY " . $this->table . ".thu_tu DESC, " . $this->id_item . " DESC";

        $db = paging::pagingAdmin($p, "?page=" . $this->par_page . "&pid=$pid" . $kw, $sql, 8, 20);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                thu_tu => $rs['thu_tu'],
                id => $rs[$this->id_item],
                id_service => $pid,
                username => $rs['username'],
                user_name => $rs['user_name'],
                createdate => @date('d/m/Y | H:i', $rs['ngay_dang'])
            ));
            $tpl->assign("categoryname", $pid);
            $tpl->assign("linkcat", "?page=" . $this->par_page . "&pid=" . $pid );
            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="thumblistnews" />');
            }
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&pid=' . $pid . '&id=' . $rs[$this->id_item]);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitem&id=' . $rs[$this->id_item] . '&table=' . $this->table . '&id_item=' . $this->id_item);
        }
        $tpl->assign("showList.pages", $db['pages']);
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
        global $DBi, $lang;
        $data = $this->getData();
        if ($data) {
            $lastid = $DBi->insertTableRow($this->table, $data);
            if (intval($lastid) > 0) {
                Message::showMessage("success", "Thêm mới thành công !");
            } else {
                Message::showMessage("success", "Chưa cập nhật, vui lòng thử lại ! ($lastid)");
            }
        }
    }

    private function update($id) {
        global $DBi, $lang;
        $id = intval($id);
        $data = $this->getData();
        if ($data) {

            if ($DBi->updateTableRow($this->table, $data, $this->id_item, $id)) {
                Message::showMessage("success", "Sửa chữa thành công !");
            } else {
                Message::showMessage("error", "Đã cập nhật !");
            }
        }
    }

    private function getData($update = 0, $id = 0) {
        global $my, $pid, $CONFIG, $clsUrl;
        $id = intval($id);
        $data = array();

        $data['name'] = compile_post('name');
        if (compile_post('title'))
            $data['title'] = compile_post('title');
        else
            $data['title'] = compile_post('name');

        $data['id_service'] = $pid;

        $data['intro'] = str_replace('\\', "", $_POST['intro']);
        $data['content'] = str_replace('\\', "", $_POST['content']);
        $data['active'] = intval(compile_post('active'));
        $data['thu_tu'] = intval(compile_post('thu_tu'));
        if (compile_post('ngay_dang') != '')
            $data['ngay_dang'] = string_to_microtime(compile_post('ngay_dang'));
        else
            $data['ngay_dang'] = time() + $CONFIG['time_offset'];

        if (compile_post('autourl') == 1)
            $url = $clsUrl->builUrl(compile_post('name'), ".html", compile_post('autourl'));
        else
            $url = $clsUrl->builUrl(compile_post('url'), '', 0);
        $data['url'] = $url;

        $data['image'] = compile_post('imageurl');


        $data['id_user'] = $my['id'];
        $data['last_modify'] = time();
        return $data;
    }

}

?>
