<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/category.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);


include_once ('./dataprovider/db_sys_image.php');
$objSysImage = new dbSysImage();


$module = new Cat;
$module->_int();

$tpl->printToScreen();

class Cat extends cat_tree {

    private $page = "Chuyên mục";
    private $item = "chuyên mục";
    private $table = "category";
    private $id_item = "id_category";
    private $par_page = "category";

//	private $data_type='news';

    public function _int() {
        global $tpl, $id, $pid;
        $this->get_cat_tree(0);
        $pathpage = '<li><a href="?page=' . $this->par_page . '">' . $this->page . '</a> <span class="divider">></span></li>' . $this->get_cat_string_admin($pid, $this->par_page);
        $tpl->assignGlobal('pathpage', $pathpage);

        $tpl->assignGlobal("item", $this->item);
        $tpl->assignGlobal("table", $this->table);
        $tpl->assignGlobal("id_item", $this->id_item);
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
        global $DBi, $tpl, $lang, $dklang, $tree, $pid, $CONFIG;
        $pid = intval($pid);
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save');
        // list category
        $info['parentid1'] = $pid;
        $info['parentid'] .= '<select name="parentid" style="WIDTH: 300px" >';
        $info['parentid'] .= '<option value="0">Root</option>';

        $info['parentid'] .= '</select>';
        $tpl->assign("parentid", $info['parentid']);
        $tpl->assign("intro", ClEditor::EditorBase("intro", '&nbsp;'));
        $tpl->assign("content", ClEditor::Editor("content", '&nbsp;'));
        $tpl->assign("active", "checked");
        $tpl->assign("mega_menu", "checked");

        $tpl->assign("autourl", "checked");
        $tpl->assign("colfooter1", "checked");
        $tpl->assign("logotitleleft0", "checked");
        $tpl->assign("thu_tu", Order::getOrderCat($this->table));
        $tpl->assign("vtcolsub3", "checked");
        $this->getGroupAttr();
    }

    private function showUpdate() {
        global $DBi, $tpl, $lang, $dklang, $id, $dir_image, $tree, $pid;
        $tpl->newBlock("AddNew");
        if ($_GET['p'] > 1) {
            $pa = '&p=' . $_GET['p'];
        }
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id . '&pid=' . $pid);
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
                        $disabled = '';
                        if ($info['parentid1'] == $k)
                            $selectstr = " selected ";
                        if ($rs[$this->id_item] == $k)
                            $disabled = ' disabled ';
                        $info['parentid'] .= '<option  value="' . $k . '"' . $selectstr . $disabled . '>' . $j . '</option>';
                    }
                }
            $info['parentid'] .= '</select>';
            $tpl->assign("parentid", $info['parentid']);

            $tpl->assign("name", $rs['name']);
            $tpl->assign("title", $rs['title']);
            $tpl->assign("subname", $rs['subname']);


            $tpl->assign("template_name", $rs['template_name']);


            $tpl->assign("$rs[left_right_layout]_news_layout", "selected");


            $tpl->assign("home_layout", $rs['home_layout']);
            $tpl->assign("description", $rs['description']);
            $tpl->assign("header_tag", $rs['header_tag']);

            $tpl->assign("keywords", $rs['keywords']);
            $tpl->assign("titlecolor", $rs['titlecolor']);
            $tpl->assign($rs['titlecolor'], 'rel="selected"');
            $tpl->assign("thu_tu", $rs['thu_tu']);
            $tpl->assign($rs['data_type'], "checked");

            $tpl->assign("intro", ClEditor::EditorBase("intro", $rs['intro']));
            $tpl->assign("content", ClEditor::Editor("content", $rs['content']));
            $tpl->assign("url", $rs['url']);
            $link_delete_image = "index4.php?page=action_ajax&code=delete&id=" . $rs[$this->id_item] . "&table=" . $this->table . "&id_item=" . $this->id_item;
            if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $rs['image'] . '" class="img-polaroid marginright5" width="200" align="left" />');
                $tpl->assign("imageurl", $rs['image']);
            }
            if ($rs['imageadv']) {
                $tpl->assign("imageadv", '<img src="' . $rs['imageadv'] . '" class="img-polaroid marginright5" width="200" align="left" />');
                $tpl->assign("imageurladv", $rs['imageadv']);
            }
            
            $tpl->assign("menucolor", $rs['menucolor']);
            $tpl->assign("home_zone" . $rs['home_zone'], "checked");
            
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");

            if ($rs['mega_menu'] == 1)
                $tpl->assign("mega_menu", "checked");

            if ($rs['target'] == 1)
                $tpl->assign("targetcheck", "checked");

            $tpl->assign("styleshow" . $rs['styleshow'], "checked");
            $tpl->assign("footercol" . $rs['footercol'], "checked");
            $tpl->assign($rs['iconmenu'], "checked");
            if ($rs['shortinhome'] == 1)
                $tpl->assign("shortinhome", "checked");
            $vitri = explode(":", $rs['vitri']);
            foreach ($vitri as $vt) {
                if ($vt == 'logo') {
                    $tpl->assign('logo1', "checked");
                } else {
                    $tpl->assign($vt, "checked");
                }
            }
            $this->getGroupAttr($rs['id_attr']);

            $this->show_multi_image($id);

            $tpl->newBlock("mat_bang");
            $tpl->assign("content_text", ClEditor::Editor("content_text", $rs['content_text']));
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
        $tpl->assign("action", "?page=" . $this->par_page . "&code=ordering&pid=" . $pid . "&p=" . $p);
        $this->showListCate(0, '');
        $tpl->assign("showList.pages", $db['pages']);
    }

    private function showListCate($pid, $n) {
        global $DBi, $tpl, $lang, $language, $site_address, $dir_path;
        $tpl->newBlock("showListCate");
        $dataType = new url_process;

        $strWhere = "";
        if ($_GET['pos']) {
            $strWhere .= " AND vitri LIKE '%$_GET[pos]%'";
            $tpl->assignGlobal('pos', "$_GET[pos] <a href='?page=category'>(Bỏ lọc)</a>");
        }

        if ($_GET['dtype']) {
            $strWhere .= " AND data_type LIKE '%$_GET[dtype]%'";
            $dt1 = $dataType->type_Info($_GET['dtype']);

            $tpl->assignGlobal('dtype', "$dt1[titlemenu] <a href='?page=category'>(Bỏ lọc)</a>");
        }

        $sql = "SELECT * FROM " . $this->table . " WHERE parentid = $pid $language $strWhere ORDER BY thu_tu ASC,name ASC";

        $db = $DBi->query($sql);
        $str = $n;
        $n = $n . "-- ";
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("listCate");
            $dt = $dataType->type_Info($rs['data_type']);
            $tpl->assign(array(
                name => $str . $rs['name'],
                thu_tu => $rs['thu_tu'],
                id => $rs[$this->id_item],
                datatype => $dt['titlemenu'],
            ));
			
			
			$tpl->assign("catid", $rs[$this->id_item]);
			if (strlen($str)>1){
				$tpl->assign("font-weight", "font-weight:normal");
				$tpl->assign("child-cat", "child-cat child-cat-". $pid);
			}
			
			else{
				$sql2 = "SELECT id_category FROM category WHERE parentid = " . $rs[$this->id_item];
				$db2 = $DBi->query($sql2);
				
				if ($DBi->num_rows($db2) > 0)
					$tpl->assign("expand-icon", '<i class="fa fa-angle-down" aria-hidden="true"></i>');
			}			
			
			
			
            $tpl->assign("link", "?page=" . $dt['adminpage'] . "&pid=" . $rs[$this->id_item]);
            if ($rs['active'] == 1)
                $tpl->assign("active", "checked");
            $tpl->assign("link_edit", '?page=' . $this->par_page . '&code=showUpdate&id=' . $rs[$this->id_item] . '&pid=' . $rs['parentid']);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitem&id=' . $rs[$this->id_item] . '&table=' . $this->table . '&id_item=' . $this->id_item);
            $url_not_show = array("logo");
            if (in_array($rs['data_type'], $url_not_show)) {
                
            } else {
                $tpl->assign("url", 'Url: <a href="' . $site_address . $dir_path . '/' . $rs['url'] . '" target="_blank">' . $site_address . $dir_path . '/' . $rs['url'] . '</a>');
            }
            $tpl->assign("datatype", "<a href='?page=category&dtype=$rs[data_type]'>$dt[titlemenu]</a>");

            $vitri_str = "";
            $vitri = explode(":", $rs['vitri']);
            foreach ($vitri as $vt)
                $vitri_str .= "<a href='?page=category&pos=$vt'>$vt</a> ";

            $tpl->assign("vitri", $vitri_str);

            $this->showListCate($rs[$this->id_item], $n);
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
        global $DBi, $search_obj, $lang, $clsUrl;
        $data = $this->getData();
        if ($data['name'] != "") {
            $lastid = $DBi->insertTableRow($this->table, $data);
            if (intval($lastid) > 0) {

                $search_obj->insertSearch($data, $data['id_category'], $this->id_item, $this->table, $lastid);
                $this->insert_multi_image($lastid);

                Message::showMessage("success", "Thêm mới thành công !");
            } else {
                Message::showMessage("error", "Đã cập nhật ! ($lastid)");
            }
        }
    }

    private function update($id) {
        global $DBi, $search_obj, $lang, $clsUrl;
        $id = intval($id);
        $data = $this->getData();
        if ($data['parentid'] == $id) {
            Message::showMessage("error", "Bạn không thể tạo \"" . $data['name'] . "\" thuộc nhóm cha chính là \"" . $data['name'] . "\"  !");
        } else {
            
            if ($data['name'] != "") {
                if ($DBi->updateTableRow($this->table, $data, $this->id_item, $id)) {
                    $srow = $search_obj->getSearch($this->id_item, $this->table, $id);
                    if ($srow)
                        $search_obj->updateSearch($data, $data['id_category'], $this->id_item, $this->table, $id);
                    else
                        $search_obj->insertSearch($data, $data['id_category'], $this->id_item, $this->table, $id);

                    $this->insert_multi_image($id);
                    Message::showMessage("success", "Sửa chữa thành công !");
                } else {
                    Message::showMessage("error", "Đã cập nhật !");
                }
                
            }
        }
    }

    private function getDataType($id) {
        global $DBi, $clsUrl;
        $id = intval($id);
        $sql = "SELECT * FROM category WHERE id_category = $id";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {
            $data = array();
            $data = $clsUrl->typeInfo($rs['data_type']);
            return $data['tableitem'];
        }
    }


    function insert_multi_image($id_category) {
        global $DBi, $objSysImage;
        $objSysImage->deleteMulti($id_category);

        $image_path = $_POST['image_path'];
        $image_name = $_POST['image_name'];
        $image_desc = $_POST['image_desc'];
        $image_thu_tu = $_POST['image_thu_tu'];
        $a = array();
        foreach ($image_path as $k => $v) {
            $a['name'] = $image_name[$k];
            $a['image_desc'] = $image_desc[$k];
            $a['thu_tu'] = intval($image_thu_tu[$k]);
            $a['id_category'] = $id_category;
            $a['image'] = $v;
            $objSysImage->insertImage($a);
        }
    }

    function show_multi_image($id_category) {
        global $DBi, $tpl, $dir_path, $cache_image_path, $objSysImage;

        $db = $objSysImage->getList($id_category);
        
        foreach ($db as $rs) {
            
            $tpl->newBlock("collection_cell");
            $tpl->assign(array(
                big_image => $dir_path . '/' . trim_url_image($rs['image']),
                image => $cache_image_path . resizeimage(192, 130, $dir_path . '/' . $rs['image']),
                real_image => trim_url_image($rs['image']),
                thu_tu => $rs['thu_tu'],
                name => $rs['name'],
                image_desc => $rs['image_desc'],
                id => $rs['id']
            ));
        }
    }
	

    private function getData($update = 0, $id = 0) {
        global $my, $_FILES, $lang_dir, $dir_path, $lang, $clsUrl, $url_extension_category;
        $id = intval($id);
        $data = array();
        $data['name'] = compile_post('name');

        if (compile_post('title'))
            $data['title'] = strip_tags(compile_post('title'));
        else
            $data['title'] = strip_tags(compile_post('name'));

        if (compile_post('subname'))
            $data['subname'] = compile_post('subname');
        else
            $data['subname'] = compile_post('name');


        $data['parentid'] = compile_post('parentid');

        $data['template_name'] = compile_post('template_name');
        $data['home_layout'] = compile_post('home_layout');
        $data['left_right_layout'] = compile_post('left_right_layout');

        $data['data_type'] = compile_post('data_type');

        $data['intro'] = str_replace('\\', "", $_POST['intro']);
        $data['content'] = str_replace('\\', "", $_POST['content']);

        $data['content_text'] = str_replace('\\', "", $_POST['content_text']);



        $data['description'] = compile_post('description');
        $data['keywords'] = compile_post('keywords');

        $data['header_tag'] = compile_post('header_tag');


        $data['active'] = intval(compile_post('active'));
        $data['thu_tu'] = intval(compile_post('thu_tu'));
        $data['id_attr'] = intval(compile_post('id_attr'));

        /*
          $data['mega_menu'] = intval(compile_post('mega_menu'));
         */

        $data['footercol'] = intval(compile_post('footercol'));
        $data['homescroll'] = intval(compile_post('homescroll'));
        $data['shortinhome'] = intval(compile_post('shortinhome'));
        $data['col'] = intval(compile_post('col'));
        $data['localnews'] = intval(compile_post('localnews'));
        $data['iconmenu'] = compile_post('iconmenu');
        $data['home_zone'] = intval(compile_post('home_zone'));
        $data['styleshow'] = intval(compile_post('styleshow'));

        $data['lang'] = $lang;
        /*
          if($data['parentid'] > 0){
          $parentiurl = url_process::getUrlCategory($data['parentid']);
          }
         */
        if (compile_post('autourl') == 1) {
            if ($data['data_type'] == 'home') {
                $url = $lang_dir;
            } else {
					
				if ($lang == '')
                    $url = $lang_dir . $clsUrl->builUrl(strip_tags(compile_post('name')), $url_extension_category);
                else
                    $url = $lang_dir . str_replace (" ", "-", strtolower(strip_tags(compile_post('name'))) )  . "/";				
				
                /*
                  if($data['parentid']){
                  $url = $parentiurl .$clsUrl->builUrl(compile_post('name'),$url_extension_category);
                  }else{
                  $url = $lang_dir.$clsUrl->builUrl(compile_post('name'),$url_extension_category);
                  }
                 */
            }
        } else {
            if ($data['data_type'] == 'home') {
                $url = $lang_dir;
            } else {
                
				$url =  strtolower(strip_tags(compile_post('url')));
            }
        }
        $data['url'] = $url;

        $data['target'] = compile_post('target');

        $vitri = $_POST['vitri'];
        $vt = ":";
        if ($vitri) {
            foreach ($vitri as $v) {
                $vt .= $v . ":";
            }
        }
        $data['vitri'] = $vt;

        $data['image'] = compile_post('imageurl');


        $data['imageadv'] = compile_post('imageurladv');

        $data['last_modify'] = time();


        return $data;
    }

    private function urlProcess() {
        
    }

    private function getGroupAttr($idc = 0) {
        global $DBi, $tpl;
        $sql = "SELECT * FROM group_attr ORDER BY name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("list_attr");
            if ($rs['setdefault'] == 1 && $idc <= 0) {
                $tpl->assign("checked", "checked='checked'");
            } elseif ($rs['id_group'] == $idc) {
                $tpl->assign("checked", "checked='checked'");
            }
            $tpl->assign("attrname", $rs['name']);
            $tpl->assign("id_attr", $rs['id_group']);
        }
    }

}

?>