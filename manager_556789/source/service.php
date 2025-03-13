<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);


defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/service.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$module = new Service();
$module->_int();
$tpl->printToScreen();

class Service extends cat_tree {

    private $page = "Trang dịch vụ";
    private $item = "Dịch vụ";
    private $table = "service";
    private $id_item = "id_service";
    private $par_page = "service";
    private $data_type = 'service';

    public function _int() {
        global $tpl, $id, $pid, $dir_path, $imagedir;
        $this->get_cat_tree(0, '');
        $pathpage = '<li><a href="?page=' . $this->par_page . '">' . $this->page . '</a> <span class="divider">></span></li>' . $this->get_cat_string_admin($pid, $this->par_page);
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
            case "deletemulti":
                $this->deleteMultiItem();
                $this->showList();
                break;
            default :
                $this->showList();
                break;
        }
    }

    private function showAddNew() {
        global $DBi, $tpl, $lang, $dklang, $tree, $pid, $CONFIG, $imagedir;
        $pid = intval($pid);
        $tpl->assignGlobal("imagedir", $imagedir);
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
        // in group	
        $str = $rs['groupcat'];
        $gr = explode(':', $str);
        $info1['parentid'] .= '<option value="0">None</option>';
        if ($tree)
            foreach ($tree as $k => $v) {
                foreach ($v as $i => $j) {
                    $dtype = Category::idCatToDataType($k);
                    if ($dtype == $this->data_type)
                        $info1['parentid'] .= '<option value="' . $k . '">' . $j . '</option>';
                }
            }
        $tpl->assign("parentid1", $info1['parentid']);
        $tpl->assign("intro", ClEditor::EditorBase("intro", '&nbsp;'));
        $tpl->assign("content", ClEditor::Editor("content", '&nbsp;'));
        $tpl->assign("active", "checked");
        $tpl->assign("showdate", "checked");
        $tpl->assign("autourl", "checked");
        $tpl->assign("ngay_dang", date('d/m/Y H:i', time() + $CONFIG['time_offset']));
        $tpl->assign("thu_tu", Order::getOrderCat($this->table));
    }

    private function showUpdate() {
        global $DBi, $tpl, $lang, $dklang, $id, $imagedir, $tree, $pid, $cache_image_path, $dir_path;
        $tpl->assignGlobal("imagedir", $imagedir);
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
            // in group	
            $str = $rs['groupcat'];
            $gr = explode(':', $str);
            $info1['parentid'] .= '<option value="0">None</option>';
            if ($tree)
                foreach ($tree as $k => $v) {
                    foreach ($v as $i => $j) {
                        if (in_array($k, $gr)) {
                            $selectstr1 = 'selected="selected"';
                        } else {
                            $selectstr1 = '';
                        }
                        $dtype = Category::idCatToDataType($k);
                        if ($dtype == $this->data_type)
                            $info1['parentid'] .= '<option value="' . $k . '"' . $selectstr1 . '>' . $j . '</option>';
                    }
                }
            $tpl->assign("parentid1", $info1['parentid']);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("title", $rs['title']);
            $tpl->assign("description", $rs['description']);
            $tpl->assign("keywords", $rs['keywords']);
            $tpl->assign("thu_tu", $rs['thu_tu']);
            $tpl->assign("intro", ClEditor::EditorBase("intro", $rs['intro']));
            $tpl->assign("content", ClEditor::Editor("content", $rs['content']));
            $tpl->assign("url", $rs['url']);
            $tpl->assign("ngay_dang", date('d/m/Y H:i', $rs['ngay_dang']));
            $link_delete_image = "index4.php?page=action_ajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;


            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="img-polaroid marginright5" width="200" align="left" />');
                $tpl->assign("imageurl", $rs['image']);
            }

            if ($rs['imageadv']) {
                $tpl->assign("pic_avataradv", '<img src="'.$rs['imageadv'].'" class="img-polaroid marginright5" width="200" align="left" />');
                $tpl->assign("imageadv", $rs['imageadv']);
            }
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            if ($rs['hot'] == 1)
                $tpl->assign("hot", "checked");
            
            
            $tpl->assign("filename", $filename);
            
            
            $this->show_multi_image($rs['image_list']);
            
        }
    }

    private function showList() {
        global $DBi, $tpl, $lang, $language, $pid, $site_address, $dir_path, $imagedir, $tree, $cache_image_path;
        $tpl->newBlock("showList");
        if (intval($_GET['p']) < 1)
            $p = 1;
        else
            $p = intval($_GET['p']);
        $tpl->assign("pid", $pid);
        $tpl->assign("par_page", $this->par_page);
        $tpl->assign("action", "?page=" . $this->par_page . "&code=ordering&pid=" . $pid . "&p=" . $p);
        // list category
        $info['parentid1'] = $pid;
        $info['parentid'] .= '<select name="parentid" style="WIDTH: 300px" id="parentid" >';
        $info['parentid'] .= '<option value="0">Category</option>';
        if ($tree)
            foreach ($tree as $k => $v) {
                foreach ($v as $i => $j) {
                    $selectstr = '';
                    if ($info['parentid1'] == $k)
                        $selectstr = " selected ";
                    $dtype = Category::idCatToDataType($k);
                    if ($dtype == $this->data_type)
                        $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . '>' . $j . '</option>';
                    else
                        $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . ' disabled>' . $j . '</option>';
                }
            }
        $info['parentid'] .= '</select>';
        $tpl->assign("parentid", $info['parentid']);

        if ($pid == 0) {
            $dk = " (id_category IN (SELECT id_category FROM category WHERE active = 1 $language ) OR id_category = 0) ";
        } else {
            $dk = "(" . $this->table . ".id_category=" . $pid . " OR " . $this->table . ".groupcat LIKE '%:" . $pid . ":%')";
        }
        if ($_REQUEST['keyword']) {
            $keyword = clean_value($_REQUEST['keyword']);
            $dk .= " AND " . $this->table . ".name LIKE '%" . $keyword . "%' ";
            $kw = "&keyword=" . $keyword;
        }
        $sql = "SELECT " . $this->table . ".*,users.name as user_name, users.username as username FROM " . $this->table . " LEFT JOIN users ON(" . $this->table . ".id_user=users.id_users) WHERE  $dk ORDER BY " . $this->table . ".thu_tu DESC, " . $this->id_item . " DESC";

        $db = paging::pagingAdmin($p, "?page=" . $this->par_page . "&pid=$pid" . $kw, $sql, 8, 20);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                thu_tu => $rs['thu_tu'],
                id => $rs[$this->id_item],
                id_service => $rs[$this->id_item],
                username => $rs['username'],
                user_name => $rs['user_name'],
                createdate => @date('d/m/Y | H:i', $rs['ngay_dang']),
                url => $site_address . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url'],
                groupcat => $this->getGroupCatName($rs['groupcat'])
            ));
            $tpl->assign("categoryname", Category::categoryName($rs['id_category']));
            $tpl->assign("linkcat", "?page=" . $this->par_page . "&pid=" . $rs['id_category']);
            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="thumblistnews" />');
            }
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&pid=' . $rs['id_category'] . '&id=' . $rs[$this->id_item]);
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
        global $DBi, $lang, $search_obj;
        $data = $this->getData();
        if ($data) {
            $lastid = $DBi->insertTableRow($this->table, $data);
            if (intval($lastid) > 0) {
                $autourl = compile_post('autourl');
                if ($autourl == 1 && ($lang == "cn" OR $lang == "kr")) {
                    $data_url = array();
                    $data_url['url'] = "$this->data_type-$lastid.html";
                    $DBi->updateTableRow($this->table, $data_url, $this->id_item, $lastid);
                }

                $search_obj->insertSearch($data, $data['id_category'], $this->id_item, $this->table, $lastid);

                Message::showMessage("success", "Thêm mới thành công !");
            } else {
                Message::showMessage("success", "Chưa cập nhật, vui lòng thử lại ! ($lastid)");
            }
        }
    }

    private function update($id) {
        global $DBi, $lang, $search_obj;
        $id = intval($id);
        $data = $this->getData();
        if ($data) {

            if ($DBi->updateTableRow($this->table, $data, $this->id_item, $id)) {
                $srow = $search_obj->getSearch($this->id_item, $this->table, $id);
                if ($srow)
                    $search_obj->updateSearch($data, $data['id_category'], $this->id_item, $this->table, $id);
                else
                    $search_obj->insertSearch($data, $data['id_category'], $this->id_item, $this->table, $id);


                Message::showMessage("success", "Sửa chữa thành công !");
            }
            else {
                Message::showMessage("error", "Đã cập nhật !");
            }
            //update lai url tieng lao
            $autourl = compile_post('autourl');
            if ($autourl == 1 && ($lang == "cn" OR $lang == "kr")) {
                $data_url = array();
                $data_url['url'] = "$this->data_type-$id.html";
                $DBi->updateTableRow($this->table, $data_url, $this->id_item, $id);
            }
        }
    }

    private function getGroupCatName($groupcat) {
        global $DBi;
        $i = 0;
        $str = '';
        if ($groupcat)
            $gr = explode(":", $groupcat);
        if ($gr)
            foreach ($gr as $idgroup) {
                if ($idgroup) {
                    $sql = "SELECT * FROM category WHERE id_category=$idgroup";
                    $db = $DBi->query($sql);
                    if ($rs = $DBi->fetch_array($db)) {
                        $i++;
                        if ($i == 1) {
                            $str .= $rs['name'];
                        } else {
                            $str .= ", " . $rs['name'];
                        }
                    }
                }
            }
        return $str;
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

    private function getData($update = 0, $id = 0) {
        global $my, $_FILES, $CONFIG, $clsUrl, $url_extension_article;
        $id = intval($id);
        $data = array();
        $data['name'] = compile_post('name');
        if (compile_post('title')) {
            $data['title'] = compile_post('title');
        } else {
            $data['title'] = compile_post('name');
        }
        $data['id_category'] = compile_post('parentid');
        $groupcat = $_POST['groupcat'];
        $data['content'] = str_replace('\\', "", $_POST['content']);
        $data['intro'] = str_replace('\\', "", $_POST['intro']);
        $data['description'] = compile_post('description');
        $data['keywords'] = compile_post('keywords');
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
        $group = ":";
        $gr = $groupcat;
        if ($gr) {
            foreach ($gr as $gro) {
                $group .= $gro . ":";
            }
        }
        $data['groupcat'] = $group;
        // xử lý ảnh
        $data['image'] = compile_post('imageurl');
        $data['imageadv'] = compile_post('imageadv');
        $data['image_list'] = $this->insert_multi_image();
        
        $data['fileurl'] = compile_post('fileurl');

        $data['id_user'] = $my['id'];
        $data['last_modify'] = time();

        
        return $data;
    }
    
    
        //Insert slide images
    private function insert_multi_image() {
        global $_POST;

        $image_path = $_POST['image_path'];
        $image_name = $_POST['image_name'];
        $image_desc = $_POST['image_desc'];
        $image_thu_tu = $_POST['image_thu_tu'];

        $image_list = array();
        $tt = 0;
        foreach ($image_path as $k) {
            if ($image_path[$tt] != "") {
                $a['image_path'] = $image_path[$tt];
                $a['image_name'] = $image_name[$tt];
                $a['image_desc'] = $image_desc[$tt];
                $a['image_thu_tu'] = $image_thu_tu[$tt];
                $image_list[$tt] = $a;
                $tt++;
            }
        }
        return json_encode($image_list);
    }

    private function show_multi_image($image_list) {
        global $DBi, $tpl, $dir_path, $cache_image_path;

        $images = json_decode($image_list);

        foreach ($images as $rs) {
            $tpl->newBlock("collection_cell");
            $tpl->assign(array(
                big_image => $dir_path . '/' . trim_url_image($rs->image_path),
                image => $cache_image_path . resizeimage(192, 130, $dir_path . '/' . trim_url_image($rs->image_path)),
                real_image => trim_url_image($rs->image_path),
                thu_tu => $rs->image_thu_tu,
                name => $rs->image_name,
                image_desc => $rs->image_desc
            ));
        }
    }

}

?>
