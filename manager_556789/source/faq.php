<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/faq.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);


$module = new Faq();
$module->_int();
$tpl->printToScreen();

class Faq extends cat_tree {

    private $page = "Trang faq";
    private $item = "faq";
    private $table = "faq";
    private $id_item = "id_faq";
    private $par_page = "faq";
    private $numberPageShow = 8;
    private $numberItemPage = 30;
    private $thumbwidth = 80;
    private $data_type = 'faq';

    public function _int() {
        global $tpl, $id, $pid, $imagedir, $dir_path;
        $this->get_cat_tree(0);
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
        $info['parentid'] .= '<option value="0">Root</option>';
        if ($tree)
            foreach ($tree as $k => $v) {
                foreach ($v as $i => $j) {
                    $selectstr = '';
                    if ($info['parentid1'] == $k)
                        $selectstr = " selected ";
                    $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . '>' . $j . '</option>';
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
                    $info1['parentid'] .= '<option value="' . $k . '">' . $j . '</option>';
                }
            }
        $tpl->assign("parentid1", $info1['parentid']);
        
        $tpl->assign("lstProduct", $this->lstProduct());
        
        $tpl->assign("content", ClEditor::Editor("content", '&nbsp;'));
        $tpl->assign("active", "checked");
        $tpl->assign("autourl", "checked");
        $tpl->assign("ngay_dang", date('d/m/Y H:i', time() + $CONFIG['time_offset']));
        $tpl->assign("thu_tu", Order::getOrderCat($this->table));
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
                        $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . '>' . $j . '</option>';
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
                        $info1['parentid'] .= '<option value="' . $k . '"' . $selectstr1 . '>' . $j . '</option>';
                    }
                }
            $tpl->assign("parentid1", $info1['parentid']);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("title", $rs['title']);
            
            $tpl->assign("lstProduct", $this->lstProduct($rs['products']));
            
            $tpl->assign("customer_phone", $rs['customer_phone']);
            $tpl->assign("customer_email", $rs['customer_email']);
            $tpl->assign("customer_name", $rs['customer_name']);
            $tpl->assign("description", $rs['description']);
            $tpl->assign("keywords", $rs['keywords']);
            $tpl->assign("thu_tu", $rs['thu_tu']);
            $tpl->assign("content", ClEditor::Editor("content", $rs['content']));
            $tpl->assign("url", $rs['url']);
            $tpl->assign("ngay_dang", date('d/m/Y H:i', $rs['ngay_dang']));
            $link_delete_image = "index4.php?page=actionajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;
            if ($rs['image']) {
                $tpl->assign("image", '<img src="image.php?w=150&src=' . $dir_image . "/" . $rs['image'] . '" class="img-polaroid marginright5" align="left" id="avatar" /><br /><a href="' . $link_delete_image . '" id="trash_image" class="icon-trash" title="Xóa ảnh"></a>');
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
                    $info['parentid'] .= '<option value="' . $k . '"' . $selectstr . '>' . $j . '</option>';
                }
            }
        $info['parentid'] .= '</select>';
        $tpl->assign("parentid", $info['parentid']);
        $tpl->assign("parentid", $info['parentid']);
        $tpl->assign("parentid", $info['parentid']);
        $tpl->assign("parentid", $info['parentid']);
        /* if($pid == 0 && $dk==''){
          }else{ */
        //	$dk="(".$this->table.".id_category=".$pid." OR ".$this->table.".groupcat LIKE '%:".$pid.":%')";
        //}
        if ($_REQUEST['keyword']) {
            $keyword = clean_value($_REQUEST['keyword']);
            $dk .= " AND " . $this->table . ".name LIKE '%" . $keyword . "%' ";
            $kw = "&keyword=" . $keyword;
        }
        $sql = "SELECT " . $this->table . ".*,users.name as user_name, users.username as username FROM " . $this->table . " LEFT JOIN users ON(" . $this->table . ".id_user=users.id_users) WHERE  $dk (" . $this->table . ".id_category=" . $pid . " OR " . $this->table . ".groupcat LIKE '%:" . $pid . ":%') ORDER BY " . $this->table . ".thu_tu DESC, " . $this->id_item . " DESC";
        $db = paging::pagingAdmin($p, "?page=" . $this->par_page . $kw, $sql, $this->numberPageShow, $this->numberItemPage);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                thu_tu => $rs['thu_tu'],
                id => $rs[$this->id_item],
                username => $rs['username'],
                user_name => $rs['user_name'],
                createdate => @date('d/m/Y | H:i', $rs['ngay_dang']),
                url => $site_address . $dir_path . "/" . $rs['url'],
                groupcat => $this->getGroupCatName($rs['groupcat'])
            ));
            $tpl->assign("categoryname", Category::categoryName($rs['id_category']));
            $tpl->assign("linkcat", "?page=" . $this->par_page . "&pid=" . $rs['id_category']);
            if ($rs['image']) {
                $tpl->assign("image", '<img src="image.php?w=' . $this->thumbwidth . '&src=' . $dir_image . "/" . $rs['image'] . '" class="thumblistnews" />');
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
        global $DBi, $lang;
        $data = $this->getData();
        if ($data) {
            $lastid = $DBi->insertTableRow($this->table, $data);
            if (intval($lastid) > 0) {
                Message::showMessage("success", "Thêm mới thành công !");
            } else {
                Message::showMessage("success", "Vui lòng thử lại ! ($lastid)");
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

                Message::showMessage("error", "Vui lòng thử lại !!");
            }
        }
    }

    private function getGroupCatName($groupcat) {
        global $DBi, $language;
        $i = 0;
        $str = '';
        if ($groupcat)
            $gr = explode(":", $groupcat);
        if ($gr)
            foreach ($gr as $idgroup) {
                if ($idgroup) {
                    $sql = "SELECT * FROM category WHERE id_category=$idgroup" . $language;
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

    function lstProduct($ids=0) {
        global $DBi, $tpl;
        $sql = "SELECT * FROM product ORDER BY id_category, id_product DESC";
        $db = $DBi->query($sql);
        
        $id_arr = explode(",", $ids);
        
        while ($rs = $DBi->fetch_array($db)) {
            if (in_array($rs['id_product'],$id_arr))
                $str .= '<option value="' . $rs['id_product'] . '" selected>' . $rs['name'] . '</option>';
            else
                $str .= '<option value="' . $rs['id_product'] . '" >' . $rs['name'] . '</option>';
        }
        return $str;
    }

    function getData($update = 0, $id = 0) {
        global $my, $_FILES;
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
        $data['intro'] = $_POST['intro'];
        $data['content'] = $_POST['content'];



        $data['customer_name'] = compile_post('customer_name');
        $data['customer_phone'] = compile_post('customer_phone');
        $data['customer_email'] = compile_post('customer_email');


        $data['description'] = compile_post('description');
        $data['keywords'] = compile_post('keywords');
        $data['active'] = intval(compile_post('active'));


        $data['thu_tu'] = compile_post('thu_tu');
        if (compile_post('ngay_dang') != '') {
            $data['ngay_dang'] = string_to_microtime(compile_post('ngay_dang'));
        } else {
            $data['ngay_dang'] = time();
        }

        if (compile_post('autourl') == 1) {
            $url = clean_url(compile_post('name')) . '.html';
        } else {
            $url = compile_post('url');
        }

        $data['url'] = $url;
        $group = ":";
        $gr = $groupcat;
        if ($gr) {
            foreach ($gr as $gro) {
                $group .= $gro . ":";
            }
        }
        $data['groupcat'] = $group;


        $products_str = "0";
        $products_arr = $_POST['products'];
        
        
        foreach ($products_arr as $products_id) {
            $products_str .= "," . $products_id;
        }
        $data['products'] = $products_str;
        

        $data['image'] = compile_post('imageurl');

        $data['id_user'] = $my['id'];

        $data['last_modify'] = time();

        return $data;
    }

}

?>