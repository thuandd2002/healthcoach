<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/vn_ward.tpl");
$tpl->prepare();
$id = $_GET['id'];
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$provinceid = $_REQUEST['provinceid'];
$districtid = $_REQUEST['districtid'];
if ($provinceid == '')
    $provinceid = $_GET['provinceid'];
include_once ('../manager/dataprovider/vn_street.php');
$objStreet = new Street();
include_once ('./dataprovider/vnLocation.php');
$objProvince = new vnLocation();
$tpl->assignGlobal("provinceid", $provinceid);
$module = new clsWard();
$module->_int();
$tpl->printToScreen();

class clsWard extends cat_tree {

    private $page = "Danh mục Phường/Xã";
    private $item = "Phường/Xã";
    private $table = "vn_ward";
    private $id_item = "wardid";
    private $par_page = "vn_ward";
    private $data_type = 'vn_ward';

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

        $code = $_GET['code'];
        switch ($code) {
            case "showAddNew":
                $this->showAddNew();
                break;
            case "showUpdate":
                $this->showUpdate();
                break;
            case "save":
                $this->insertWard();
                $this->showList();
                break;
            case "update":
                $this->updateWard($id);
                $this->showList();
                break;

            case "ordering":
                $this->ordering();
                break;
            case "deletemulti":
                $this->deleteMultiItem();
                break;
            default :
                $this->showList();
                break;
        }
    }

    private function showAddNew() {
        global $DBi, $tpl, $pid, $CONFIG, $imagedir, $provinceid;
        $tpl->assignGlobal("imagedir", $imagedir);
        $tpl->newBlock("AddNew");
        $tpl->assign("provinceid", $provinceid);
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save&pid=' . $pid);
        $tpl->assign("active", "checked");
        $tpl->assign("vn_district", $this->bindDistrict($provinceid));
    }

    private function showUpdate() {
        global $DBi, $tpl, $id, $imagedir, $objStreet, $provinceid, $pid, $cache_image_path, $dir_path;
        $tpl->newBlock("AddNew");
        $tpl->assign("provinceid", $provinceid);
        $rs = $objStreet->getWardID($id);
        if ($rs) {
            $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $rs['wardid']);
            $tpl->assign("wardid", $rs['wardid']);
            $tpl->assign("districtid", $rs['districtid']);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("type", $rs['type']);
            //$tpl->assign("vn_province", $this->bindDistrict($rs['provinceid']));
            $tpl->assign("vn_district", $this->bindDistrict($provinceid, $rs['districtid']));
        }
    }

    private function showList() {
        global $DBi, $tpl, $objStreet, $pid, $site_address, $dir_path, $provinceid, $districtid, $cache_image_path;
        $tpl->newBlock("showList");

        $tpl->assign("action", '?page=' . $this->par_page . '&code=showlist&provinceid=' . $provinceid . '&districtid=' . $districtid);

        $tpl->assign("vn_province", $this->bindProvince($provinceid));

        $tpl->assign("vn_district", $this->bindDistrict($provinceid, $districtid));

        $street_name = compile_post('street_name');


        $tpl->assignGlobal("street_name", $street_name);
        $db = $objStreet->getListWard($districtid);
        foreach ($db as $rs) {
            $tpl->newBlock("list");
            $tpl->assign("id", $rs["districtid"]);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("provinceid", $rs['provinceid']);
            $tpl->assign("districtid", $rs['districtid']);
            $tpl->assign("link_edit", "?page=" . $this->par_page . "&code=showUpdate&id=" . $rs[$this->id_item] . "&districtid=" . $districtid . "&provinceid=" . $provinceid);
            $tpl->assign("link_delete", '?page=action_ajax&code=deleteitem&id=' . $rs[$this->id_item] . '&table=' . $this->table . '&id_item=' . $this->id_item);
        }
    }

    private function getData($update = 0, $id = 0) {
        $id = intval($id);
        $data = array();
        $data['districtid'] = compile_post('districtid');
        $data['wardid'] = compile_post('wardid');
        $data['name'] = compile_post('name');
        $data['type'] = compile_post('type');
        return $data;
    }

    private function insertWard() {
        global $objStreet;
        $objStreet->insertWard($this->getData());
    }

    private function updateWard($id) {
        global $objStreet;
        $objStreet->updateWard($id, $this->getData());
    }

    private function bindDistrict($provinceid, $selectedid) {
        global $objProvince;
        $db = $objProvince->getDistrictList($provinceid);
        $result_str = '';
        foreach ($db as $rs) {
            if ($selectedid == $rs['districtid'])
                $result_str .= '<option value="' . $rs['districtid'] . '" selected>' . $rs['type'] . ' ' . $rs['name'] . '</option>';
            else
                $result_str .= '<option value="' . $rs['districtid'] . '">' . $rs['type'] . ' ' . $rs['name'] . '</option>';
        }
        return $result_str;
    }

    private function bindProvince($id) {

        global $objProvince;
        $db = $objProvince->getProvinceList();
        $result_str = '';
        foreach ($db as $rs) {
            if ($id == $rs['provinceid'])
                $result_str .= '<option value="' . $rs['provinceid'] . '" selected>' . $rs['type'] . ' ' . $rs['name'] . '</option>';
            else
                $result_str .= '<option value="' . $rs['provinceid'] . '">' . $rs['type'] . ' ' . $rs['name'] . '</option>';
        }
        return $result_str;
    }

}

?>
