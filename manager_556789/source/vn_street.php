<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/vn_street.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
include_once ('../manager/dataprovider/vn_street.php');
$objStreet =  new Street();

$module = new clsStreet();
$module->_int();
$tpl->printToScreen();
class clsStreet extends cat_tree {
    private $page = "Danh mục đường phố";
    private $item = "Đường phố";
    private $table = "vn_street";
    private $id_item = "id_street";
    private $par_page = "vn_street";

    private $data_type = 'vn_street';
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
                $this->insertStreet();
                $this->showList();
                break;
            case "update":
                $this->updateStreet($id);
                $this->showList();
                break;
            case "showLoc":
                $this->showStreetLoc($id);
                break;            
            case "insertLoc":
                $this->insertStreetLoc($id);
                $this->showStreetLoc($id);
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
        $tpl->assign("vn_province", $this->bindProvince('0'));
    }
    private function showUpdate() {
        global $DBi, $tpl, $id, $imagedir, $objStreet, $pid, $cache_image_path, $dir_path;
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id);
        $rs = $objStreet->getId($id);
        if($rs) {
            $tpl->assign("name", $rs['name']);
            //$tpl->assign("vn_province", $this->bindProvince('0'));
        }
    }
    private function showList() {
        global $DBi, $tpl, $objStreet, $pid, $site_address, $dir_path, $imagedir, $cache_image_path;
        $tpl->newBlock("showList");
        $street_name = compile_post('street_name');
        $tpl->assignGlobal("street_name", $street_name);
        $db = $objStreet->getList($street_name);
        foreach($db as $rs){
            $tpl->newBlock("list");
            $tpl->assign("id", $rs["id_street"]);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("link_loc","?page=".$this->par_page."&code=showLoc&id=$rs[id_street]");
            $tpl->assign("link_edit","?page=".$this->par_page."&code=showUpdate&id=$rs[id_street]");
            $tpl->assign("link_delete",'?page=action_ajax&code=deleteitem&id='.$rs[$this->id_item].'&table='.$this->table.'&id_item='.$this->id_item);            
        }
    }
    
    
    private function showStreetLoc($id_street) {
        global $DBi, $tpl, $objStreet, $pid, $site_address, $dir_path, $imagedir, $cache_image_path;
        $tpl->newBlock("showStreetLoc");
        
        $tpl->assign("action", '?page=' . $this->par_page . '&code=insertLoc&id=' . $id_street);
        
        $rs_street = $objStreet->getId($id_street);
        $tpl->assign("name", $rs_street['name']);
        $tpl->assign("id_street",$rs_street["id_street"]);
        
        $tpl->assign("vn_province", $this->bindProvince('0'));
        
        $db = $objStreet->getStreetLoc($id_street);
        $tpl->newBlock("showListLocation");
        foreach($db as $rs){
            $tpl->newBlock("listLocation");
            $tpl->assign("id", $rs["id"]);
            $tpl->assign("id_street",$rs["id_street"]);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("pname", $rs['pname']);
            $tpl->assign("dname", $rs['dname']);
            
            $tpl->assign("link_delete","?page=action_ajax&code=deleteitem&id=$rs[id]&table=street_location&id_item=id");            
        }
        
        
        
        
        
    }
    private function getData($update = 0, $id = 0) {
        $id = intval($id);
        $data = array();
        $data['name'] = compile_post('name');
        return $data;
    }
    
    private  function insertStreetLoc(){
        global $objStreet;
        $id_street = compile_post("id_street");
        $provinceid = compile_post("vn_province");
        $districtid = compile_post("vn_district");
        $objStreet->insertStreetLocation($id_street, $provinceid, $districtid);
    }    
    
    private  function insertStreet(){
        global $objStreet;
        $objStreet->insertStreet($this->getData());
    }
    private  function updateStreet($id_street){
        global $objStreet;
        $objStreet->updateStreet($id_street, $this->getData());
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
