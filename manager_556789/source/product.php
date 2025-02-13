<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/product.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$module = new Product();
$module->_int();
$tpl->printToScreen();

class Product extends cat_tree {

    private $page = "Sản phẩm";
    private $item = "sản phẩm";
    private $table = "product";
    private $id_item = "id_product";
    private $par_page = "product";
    private $numberPageShow = 8;
    private $numberItemPage = 40;
    private $data_type = 'product';

    public function _int() {
        global $tpl, $id, $pid, $imagedir;
        $this->get_cat_tree(0, $this->data_type);
        $pathpage = '<li><a href="?page=' . $this->par_page . '">' . $this->page . '</a> <span class="divider">></span></li>' . $this->get_cat_string_admin($pid, $this->par_page);
        $tpl->assignGlobal('pathpage', $pathpage);
        $tpl->assignGlobal("item", $this->item);
        $tpl->assignGlobal("table", $this->table);
        $tpl->assignGlobal("id_item", $this->id_item);
        $tpl->assignGlobal("par_page", $this->par_page);
        $tpl->assignGlobal("pid", $pid);
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
            case "saochep":
                $this->saochep();
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
        global $DBi, $tpl, $lang, $dklang, $tree, $pid, $CONFIG;
        $pid = intval($pid);
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save&pid=' . $pid);
        // list category
        $info['parentid1'] = $pid;
        $info['parentid'] .= '<select name="parentid" style="WIDTH: 300px" id="idc" >';
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
        $tpl->assign("intro", ClEditor::Editor("intro", ''));
        $tpl->assign("content", ClEditor::Editor("content", ''));
        $tpl->assign("contenttab0", ClEditor::Editor("contenttab0", ''));
        $tpl->assign("contenttab1", ClEditor::Editor("contenttab1", ''));
        $tpl->assign("lstManufacture", $this->lstManufacture());
        $tpl->assign("lstMaterial", $this->lstMaterial());
		
		$tpl->assign("strRelatedIDs", $this->strRelatedIDs());
		
        $tpl->assign("active", "checked");
        $tpl->assign("autourl", "checked");
        $tpl->assign("ngay_dang", date('d/m/Y H:i', time() + $CONFIG['time_offset']));
        $tpl->assign("thu_tu", Order::getOrderCat($this->table));

        $tpl->newBlock("phienban");
    }

    private function showUpdate() {
        global $DBi, $tpl, $lang, $dklang, $id, $imagedir, $tree, $pid, $cache_image_path, $dir_path;
        $tpl->newBlock("AddNew");
        if ($_GET['p'] > 1) {
            $pa = '&p=' . $_GET['p'];
        }
        $tpl->assignGlobal("id", $id);
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id . '&pid=' . $pid . $pa);
		$tpl->assign("action_saochep", '?page=' . $this->par_page . '&code=saochep&id=' . $id . '&pid=' . $pid . $pa);
		
        $sql = "SELECT * FROM " . $this->table . " WHERE " . $this->id_item . " = " . $id;
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            // list category
            $info['parentid1'] = $pid;
            $info['parentid'] .= '<select name="parentid" style="WIDTH: 300px"  id="idc" >';
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
            $tpl->assign("ma", $rs['ma']);
            $tpl->assign("title", $rs['title']);
            $tpl->assign("description", $rs['description']);
            $tpl->assign("keywords", $rs['keywords']);
            $tpl->assign("thu_tu", $rs['thu_tu']);
            $tpl->assign("ttkhuyenmai", $rs['ttkhuyenmai']);

            $tpl->assign("spcungloai", $rs['spcungloai']);
            $tpl->assign("relate_project", $rs['relate_project']);

            $tpl->assign("size", $rs['size']);
            $tpl->assign("intro", ClEditor::Editor("intro", $rs['intro']));
            $tpl->assign("content", ClEditor::Editor("content", $rs['content']));
            $tpl->assign("contenttab0", ClEditor::Editor("contenttab0", $rs['contenttab0']));
            $tpl->assign("contenttab1", ClEditor::Editor("contenttab1", $rs['contenttab1']));
            $tpl->assign("url", $rs['url']);
            $tpl->assign("price", $rs['price']);
            $tpl->assign("pricekm", $rs['pricekm']);

            $tpl->assign("videourl", $rs['videourl']);

            $tpl->assign("baohanh", $rs['baohanh']);
            $tpl->assign("xuatxu", $rs['xuatxu']);
            $tpl->assign("tinhtrang", $rs['tinhtrang']);
            $tpl->assign("km", $rs['km']);
			
            $tpl->assign("lstManufacture", $this->lstManufacture($rs['id_manufacture']));
            $tpl->assign("lstMaterial", $this->lstMaterial($rs['id_material']));
			$tpl->assign("strRelatedIDs", $this->strRelatedIDs($rs["related_ids"]));
			
			
            if ($rs['status'] == 1)
                $tpl->assign("status", "checked");
            $tpl->assign($rs['icon'], "checked");
            $tpl->assign("tags", $rs['tags']);
            $tpl->assign("header_tag", $rs['header_tag']);



            $tpl->assign("color", $rs['color']);
            $tpl->assign("ngay_dang", date('d/m/Y H:i', $rs['ngay_dang']));
            $link_delete_image = "index4.php?page=action_ajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="img-polaroid marginright5" width="200" align="left" />');
            
            $tpl->assign("imageurl", $rs['image']);
            $tpl->assign("fileurl", $rs['fileurl']);
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");

            $product_ver = json_decode($rs['product_ver']);
            foreach ($product_ver as $key => $value) {
                $tpl->newBlock("phienban");
                $tpl->assign("tenphienban", $value->tenphienban);
                $tpl->assign("giaphienban", $value->giaphienban);
                $tpl->assign("motaphienban", $value->motaphienban);
            }

            $this->show_multi_image($rs['image_list']);
        }
    }

    private function showList() {
        global $DBi, $tpl, $lang, $dklang, $pid, $site_address, $dir_path, $language , $tree, $cache_image_path, $clsUrl;
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
        if ($pid == 0 && $dk == '') {
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
        $db = paging::pagingAdmin($p, "?page=" . $this->par_page  . "&pid=$pid" . $kw, $sql, $this->numberPageShow, $this->numberItemPage);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock("list");
            $tpl->assign(array(
                name => $rs['name'],
                km => $rs['km'],
                thu_tu => $rs['thu_tu'],
                id => $rs[$this->id_item],
                username => $rs['username'],
                user_name => $rs['user_name'],
                createdate => @date('d/m/Y | H:i', $rs['ngay_dang']),
                url => $site_address . $dir_path . "/" . url_process::getUrlCategory($rs['id_category']) . $rs['url'],
                groupcat => $this->getGroupCatName($rs['groupcat'])
            ));
            $tpl->assign("categoryname", Category::categoryName($rs['id_category']));
            $tpl->assign("linkcat", "?page=" . $this->par_page . "&pid=" . $rs['id_category']);
            if ($rs['image'])
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="thumblistnews" />');
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&pid=' . $rs['id_category'] . '&id=' . $rs[$this->id_item]);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitem&id=' . $rs[$this->id_item] . '&table=' . $this->table . '&id_item=' . $this->id_item);
        }
        $tpl->assign("showList.pages", $db['pages']);
    }

    private function ordering() {
        global $DBi, $tpl, $lang;
        $thu_tu = $_POST['thu_tu'];
        if ($thu_tu) {
            foreach ($thu_tu as $tt => $val) {
                $DBi->query("UPDATE " . $this->table . " SET thu_tu=" . $val . " WHERE " . $this->id_item . "=" . $tt);
            }
            Message::showMessage("success", "Cập nhật thứ tự thành công !");
        }
    }

    private function save() {
        global $DBi, $DBi, $tpl, $lang, $search_obj, $clsUrl;
        $data = $this->getData();
        if ($data) {
            $lastid = $DBi->insertTableRow($this->table, $data);
            if (intval($lastid) > 0) {


                $search_obj->insertSearch($data, $data['id_category'], $this->id_item, $this->table, $lastid);
                //$this->insert_multi_image($lastid);
                Message::showMessage("success", "Thêm mới thành công !");
            } else {
                Message::showMessage("success", "Vui lòng thử lại ! ($lastid)");
            }
        }
    }
	
    private function saochep() {
        global $DBi, $lang;
        $data = $this->getData();
		$data['name'] = 'Copy of ' . $data['name'];
		$data['active'] = 0;
		$data['ngay_dang'] = time();
		$data['last_modify'] = time();
        if ($data) {

			
            $lastid = $DBi->insertTableRow($this->table, $data);
            if (intval($lastid) > 0) {
				$this->insert_multi_image($lastid);
                Message::showMessage("success", "Sao chép thành công !");
            } else {
                Message::showMessage("success", "Vui lòng thử lại ! ($lastid)");
            }
        }
    }	

    private function update($id) {
        global $DBi, $DBi, $tpl, $lang, $search_obj, $clsUrl;
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
                Message::showMessage("error", "Vui lòng thử lại !");
            }
        }
        //$this->insert_multi_image($id);
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
        global $my, $_FILES, $imagedir, $clsUrl, $url_extension_article;
        $id = intval($id);
        $data = array();
        $data['name'] = compile_post('name');
        $data['ma'] = compile_post('ma');
        if (compile_post('title'))
            $data['title'] = compile_post('title');
        else
            $data['title'] = compile_post('name');
        $data['id_category'] = compile_post('parentid');
        $groupcat = $_POST['groupcat'];
        $data['intro'] = str_replace('\\', "", $_POST['intro']);
        $data['ttkhuyenmai'] = clean_value($_POST['ttkhuyenmai']);
        $data['content'] = str_replace('\\', "", $_POST['content']);
        $data['contenttab0'] = str_replace('\\', "", $_POST['contenttab0']);
        $data['contenttab1'] = str_replace('\\', "", $_POST['contenttab1']);
        $data['description'] = compile_post('description');
        $data['keywords'] = compile_post('keywords');

        $data['header_tag'] = str_replace("<br>", "", $_POST['header_tag']);

        $data['tags'] = compile_post('keywords');






        $data['active'] = intval(compile_post('active'));
        $data['thu_tu'] = intval(compile_post('thu_tu'));
        $data['id_manufacture'] = intval(compile_post('manufacture'));
        $data['id_material'] = intval(compile_post('material'));

        $data['price'] = compile_post('price');
        $data['pricekm'] = compile_post('pricekm');

        $data['giaphukien'] = intval(compile_post('giaphukien'));

        $data['km'] = intval(compile_post('km'));
        $data['icon'] = compile_post('icon');
        $data['size'] = compile_post('size');
        $data['color'] = compile_post('color');

        /*
          $tenphienban = $_POST['tenphienban'];
          $giaphienban = $_POST['giaphienban'];
          $motaphienban = $_POST['motaphienban'];

          $product_ver = array();
          $tt = 0;
          foreach ($tenphienban as $k => $v) {
          if ($tenphienban[$tt] != "") {
          $a['tenphienban'] = str_replace("#", "", $tenphienban[$tt]);
          $a['giaphienban'] = $giaphienban[$tt];
		  $a['motaphienban'] = $motaphienban[$tt];
          $product_ver[$tt] = $a;
          $tt++;
          }
          }
          if ($tt > 0)
          $data['product_ver'] = json_encode($product_ver);
         */

        $data['spcungloai'] = compile_post('spcungloai');

		$related_arr = $_POST['related_ids'];
		$related_ids = "0";
		foreach($related_arr as $k){
			$related_ids .= ",".$k;
		}
		$related_ids .= ",0";
		$data['related_ids'] = $related_ids;
		

        if (compile_post('ngay_dang') != '')
            $data['ngay_dang'] = string_to_microtime(compile_post('ngay_dang'));
        else
            $data['ngay_dang'] = time();
        if (compile_post('autourl') == 1) {
            $url = $clsUrl->builUrl(compile_post('name'), $url_extension_article, compile_post('autourl'));
        } else {
            $url = $clsUrl->builUrl(compile_post('url'), '', 0);
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
        $attr = $_POST['attribute'];
        $data['attr'] = json_encode($attr);
        $data['fileurl'] = compile_post('fileurl');
        $data['image'] = compile_post('imageurl');
        $data['videourl'] = clean_value($_POST['videourl']);

        $data['image_list'] = $this->insert_multi_image();

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

    function lstManufacture($id = 0) {
        global $DBi, $tpl;
        $sql = "SELECT * FROM product_manufacture ORDER BY thu_tu DESC";
        $db = $DBi->query($sql);
        $str = '<select name="manufacture" id="manufacture"><option value="0">Chọn NCC</option>';
        while ($rs = $DBi->fetch_array($db)) {
            if ($rs['id'] == $id)
                $str .= '<option value="' . $rs['id'] . '" selected>' . $rs['name'] . '</option>';
            else
                $str .= '<option value="' . $rs['id'] . '" >' . $rs['name'] . '</option>';
        }
        $str .= '</select>';
        return $str;
    }

    function lstMaterial($id = 0) {
        global $DBi, $tpl;
        $sql = "SELECT * FROM product_material ORDER BY thu_tu DESC";
        $db = $DBi->query($sql);
        $str = '<select name="material" ><option value="0">Chọn xuất xứ</option>';
        while ($rs = $DBi->fetch_array($db)) {
            if ($rs['id'] == $id)
                $str .= '<option value="' . $rs['id'] . '" selected>' . $rs['name'] . '</option>';
            else
                $str .= '<option value="' . $rs['id'] . '" >' . $rs['name'] . '</option>';
        }
        $str .= '</select>';
        return $str;
    }
	
	function strRelatedIDs($related_ids = '') {
        global $DBi, $tpl, $languageWhere;
        $sql = "SELECT * FROM du_an WHERE active = 1 ORDER BY id_duan DESC";

		
        $db = $DBi->query($sql);
		$related_arr = explode(",",$related_ids);

        $str = "";
		
        while ($rs = $DBi->fetch_array($db)) {
            if ( in_array($rs['id_duan'], $related_arr) )
                $str .= '<option value="' . $rs['id_duan'] . '" selected>' . $rs['name'] . '</option>';
            else
                $str .= '<option value="' . $rs['id_duan'] . '" >' . $rs['name'] . '</option>';
        }

        return $str;
    }	
	
	

}

?>