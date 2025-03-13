<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/vn_district.tpl");
$tpl->prepare();
$id = $_GET['id'];
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$provinceid = $_REQUEST['provinceid'];
include_once ('../manager/dataprovider/vn_street.php');
$objStreet =  new Street();

$module = new clsStreet();
$module->_int();
$tpl->printToScreen();
class clsStreet extends cat_tree {
    private $page = "Danh mục Quận/Huyện";
    private $item = "Quận/Huyên";
    private $table = "vn_district";
    private $id_item = "districtid";
    private $par_page = "vn_district";

    private $data_type = 'vn_district';
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
                $this->insertDistrict();
                $this->showList();
                break;
            case "update":
                $this->updateDistrict($id);
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
        global $DBi, $tpl, $pid, $CONFIG, $imagedir;
        $tpl->assignGlobal("imagedir", $imagedir);
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=save&pid=' . $pid);
        $tpl->assign("active", "checked");
        $tpl->assign("vn_province", $this->bindProvince());
    }
    private function showUpdate() {
        global $DBi, $tpl, $id, $imagedir, $objStreet, $pid, $cache_image_path, $dir_path;
        $tpl->newBlock("AddNew");
        
        $rs = $objStreet->getDistrictID($id);
        if($rs) {
            $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $rs['districtid']);
            $tpl->assign("provinceid", $rs['provinceid']);
            $tpl->assign("districtid", $rs['districtid']);
            $tpl->assign("name", $rs['name']);
			$tpl->assign("type", $rs['type']);
            $tpl->assign("vn_province", $this->bindProvince($rs['provinceid']));
            
        }
    }
    private function showList() {
        global $DBi, $tpl, $objStreet, $pid, $site_address, $dir_path, $provinceid, $cache_image_path;
        $tpl->newBlock("showList");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=showlist&provinceid=' . $provinceid);
        $tpl->assign("vn_province", $this->bindProvince($provinceid));
        
        $street_name = compile_post('street_name');
        
        
        $tpl->assignGlobal("street_name", $street_name);
        $db = $objStreet->getListDistrict($street_name, $provinceid);
        foreach($db as $rs){
            $tpl->newBlock("list");
            $tpl->assign("id", $rs["districtid"]);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("provinceid", $rs['provinceid']);
            $tpl->assign("districtid", $rs['districtid']);
            $tpl->assign("link_edit","?page=".$this->par_page."&code=showUpdate&id=".$rs[$this->id_item]);
            $tpl->assign("link_delete",'?page=action_ajax&code=deleteitem&id='.$rs[$this->id_item].'&table='.$this->table.'&id_item='.$this->id_item);            
        }
    }
    
    
    private function getData($update = 0, $id = 0) {
        $id = intval($id);
        $data = array();
        $data['districtid'] = compile_post('districtid');
        $data['provinceid'] = compile_post('provinceid');
        $data['name'] = compile_post('name');
		$data['type'] = compile_post('type');
        return $data;
    }
    
    private  function insertDistrict(){
        global $objStreet;
        $objStreet->insertDistrict($this->getData());
    }
    private  function updateDistrict($id){
        global $objStreet;
        $objStreet->updateDistrict($id, $this->getData());
    }    
    private function bindProvince($id) {
        include_once ('./dataprovider/vnLocation.php');
        $objProvince = new vnLocation();
        $db = $objProvince->getProvinceList();
        $result_str = '';
        foreach ($db as $rs) {
            if ($id == $rs['provinceid'])
                $result_str.= '<option value="' . $rs['provinceid'] . '" selected>' . $rs['type'] . ' ' . $rs['name'] . '</option>';
            else
                $result_str.= '<option value="' . $rs['provinceid'] . '">' . $rs['type'] . ' ' . $rs['name'] . '</option>';
        }
        return $result_str;
    }
    
}

?>
