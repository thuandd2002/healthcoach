<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/vn_province.tpl");
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
    private $page = "Danh mục tỉnh thành";
    private $item = "Tỉnh/TP";
    private $table = "vn_province";
    private $id_item = "provinceid";
    private $par_page = "vn_province";
    private $data_type = 'vn_province';
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
                $this->insertProvince();
                $this->showList();
                break;
            case "update":
                $this->updateProvince($id);
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
    }
    private function showUpdate() {
        global $DBi, $tpl, $id, $imagedir, $objStreet, $pid, $cache_image_path, $dir_path;
        $tpl->newBlock("AddNew");
        $tpl->assign("action", '?page=' . $this->par_page . '&code=update&id=' . $id);
        $rs = $objStreet->getProvinceID($id);
        if($rs) {
            $tpl->assign("provinceid", $rs['provinceid']);
            $tpl->assign("name", $rs['name']);
			$tpl->assign("type", $rs['type']);
            //$tpl->assign("vn_province", $this->bindProvince('0'));
        }
    }
    private function showList() {
        global $DBi, $tpl, $objStreet, $pid, $site_address, $dir_path, $imagedir, $cache_image_path;
        $tpl->newBlock("showList");
        $street_name = compile_post('street_name');
        $tpl->assignGlobal("street_name", $street_name);
        $db = $objStreet->getListProvince($street_name);
        foreach($db as $rs){
            $tpl->newBlock("list");
            $tpl->assign("id", $rs["provinceid"]);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("provinceid", $rs['provinceid']);
            $tpl->assign("link_edit","?page=".$this->par_page."&code=showUpdate&id=$rs[provinceid]");
            $tpl->assign("link_delete",'?page=action_ajax&code=deleteitem&id='.$rs[$this->id_item].'&table='.$this->table.'&id_item='.$this->id_item);            
        }
    }
    
    
    private function getData($update = 0, $id = 0) {
        $id = intval($id);
        $data = array();
        $data['provinceid'] = compile_post('provinceid');
        $data['name'] = compile_post('name');
		$data['type'] = compile_post('type');
        return $data;
    }
    
    private  function insertProvince(){
        global $objStreet;
        $objStreet->insertProvince($this->getData());
    }
    private  function updateProvince($id){
        global $objStreet;
        $objStreet->updateProvince($id, $this->getData());
    }    

}

?>
