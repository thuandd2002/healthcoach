<?php 
// Nguyen Binh
// suongmumc@gmail.com

defined( '_VALID_NVB' ) or die( 'Direct Access to this location is not allowed.' );
$tpl=new TemplatePower("skin/mausac.tpl");
$tpl->prepare();
	$id=intval($_GET['id']);
	$idc=intval($_GET['idc']);
	$pid=intval($_GET['pid']);

	$module = new Product_Style();
	$module->_int();

$tpl->printToScreen();

class Product_Style extends cat_tree{
	private $page = "Màu sắc";
	private $item = "Màu sắc";
	private $table = "mausac";
	private $id_item = "id";
	private $par_page = "mausac";
	private $data_type='mausac';
	
	public function _int(){
		global $tpl,$id,$pid,$imagedir, $dir_path;
		
		$tpl->assignGlobal('pathpage',$pathpage);
                $tpl->assignGlobal("page_name",$this->page);
		$tpl->assignGlobal("item",$this->item);
		$tpl->assignGlobal("table",$this->table);
		$tpl->assignGlobal("id_item",$this->id_item);
		$tpl->assignGlobal("par_page",$this->par_page);
		$tpl->assignGlobal("pid",$pid);
		$tpl->assignGlobal("dir_path",$dir_path);
		$tpl->assignGlobal("imagedir",$imagedir);	
		
		
		$code = $_GET['code'];
		switch($code){
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
	private function showAddNew(){
		global $DBi,$tpl,$lang,$dklang,$tree,$pid,$CONFIG;
		$pid = intval($pid);
		$tpl->newBlock("AddNew");	
		$tpl->assign("action",'?page='.$this->par_page.'&code=save&pid='.$pid);
		$tpl->assign("content"		,ClEditor::Editor("content",'&nbsp;'));
		$tpl->assign("active"		,"checked");
	}	
	
	private function showUpdate(){
		global $DBi,$tpl,$lang,$dklang,$id,$dir_image,$tree,$pid,$cache_image_path;
		$tpl->newBlock("AddNew");
		if($_GET['p']>1){
			$pa = '&p='.$_GET['p'];	
		}
		$tpl->assign("action",'?page='.$this->par_page.'&code=update&id='.$id.'&pid='.$pid.$pa);
		$sql = "SELECT * FROM ".$this->table." WHERE ".$this->id_item." = ".$id;
		$db = $DBi->query($sql);
		if($rs = $DBi->fetch_array($db)){
			$tpl->assign("name"	,$rs['name']);
			$tpl->assign("title"	,$rs['title']);
			$tpl->assign("description"	,$rs['description']);
            $tpl->assign("code_name",$rs['code_name']);
			$tpl->assign("content"	,ClEditor::Editor("content",$rs['content']));
			$link_delete_image = "index4.php?page=actionajax&code=delete&id=".$rs[$this->id_item]."&table=".$this->table."&id_item=".$this->id_item;
			if ($rs['image']) {
                $tpl->assign("image", '<img src="' . $cache_image_path . resizeimage(160, 120, $dir_path . "/" . $rs['image']) . '" class="img-polaroid marginright5" align="left" id="avatar" />
				<br /><a href="' . $link_delete_image . '" id="trash_image" class="icon-trash" title="Xóa ảnh"></a>');
                $tpl->assign("imageurl", $rs['image']);
            }
			if($rs['active']==1) $tpl->assign("active","checked");

		}
	}
	
	private function showList(){
		global $DBi,$tpl,$lang,$pid,$site_address,$dir_path,$dir_image,$tree;
		$tpl->newBlock("showList");
		if(intval($_GET['p']) < 1 ) $p = 1;
		else $p= intval($_GET['p']);
		$tpl->assign("pid",$pid);
		$tpl->assign("par_page",$this->par_page);
                $tpl->assign("action","?page=".$this->par_page."&code=ordering&pid=".$pid."&p=".$p);
		/*if($lang=='en'){
			$dklang = " WHERE lang='en' ";
		}else{
			$dklang = " WHERE lang<>'en' ";
		}*/
		$sql="SELECT * FROM ".$this->table." $dklang ORDER BY thu_tu, ".$this->id_item." DESC, name ASC";
		$db = $DBi->query($sql);
		while($rs = $DBi->fetch_array($db)){
			$tpl->newBlock("list");
			$tpl->assign(array(
				name => $rs['name'],
				thu_tu => $rs['thu_tu'],
				id => $rs[$this->id_item],
			));
			
			if($rs['active']==1) $tpl->assign("active","checked");
			$tpl->assign("link_edit",'?page='.$this->par_page.'&code=showUpdate&id='.$rs[$this->id_item]);
			$tpl->assign("link_delete",'?page=action_ajax&code=deleteitem&id='.$rs[$this->id_item].'&table='.$this->table.'&id_item='.$this->id_item);
		}
		
	}
	
	
	private function save(){
		global $DBi,$tpl,$lang,$dklang;
		$data = $this->getData();
		if($data){
			$b=$DBi->compile_db_insert_string($data);
			$sql="INSERT INTO ".$this->table." (".$b['FIELD_NAMES'].") VALUES (".$b['FIELD_VALUES'].")";
			$DBi->query($sql);
			Message::showMessage("success","Thêm mới thành công !");
		}
		
	}
	
	private function ordering(){
		global $DBi,$tpl,$lang,$dklang;
		$thu_tu = $_POST['thu_tu'];
		if($thu_tu){
			foreach ($thu_tu as $tt=>$val){
				$DBi->query("UPDATE ".$this->table." SET thu_tu=".intval($val)." WHERE ".$this->id_item."=".$tt);
			}	
			Message::showMessage("success","Cập nhật thứ tự thành công !");
		}
	}        
        
	private function update($id){
		global $DBi,$tpl,$lang,$dklang;
		$id = intval($id);
		$data = $this->getData();
		if($data){
			$b=$DBi->compile_db_update_string($data);
			$sql="UPDATE ".$this->table." SET ".$b." WHERE ".$this->id_item."=".$id;
			$db=$DBi->query($sql);
			Message::showMessage("success","Sửa chữa thành công !");
		}
	}
	
	
	
	private function deleteMultiItem(){
		global $DBi;	
		$multi = $_POST['delmulti'];
		if($multi){
			foreach ($multi as $mtId){
				$sql = "SELECT * FROM ".$this->table." WHERE ".$this->id_item."=".$mtId;
				$db = $DBi->query($sql);
				if($rs = $DBi->fetch_array($db)){
					deleteimage($rs['image']);
				}
				$DBi->query("DELETE FROM ".$this->table." WHERE ".$this->id_item."=".$mtId);
				Message::showMessage("success","Đã xóa xong !");
			}	
		}
	}
	
	function getData($update=0,$id=0){
		global  $my,$lang;
		$id = intval($id);
		$data = array();
		$data['name']		= compile_post('name');
		$data['title']		= compile_post('title');
		$data['description']		= compile_post('description');
		$data['alias_name']		= clean_url($data['name']);
		$data['content'] 	= $_POST['content'];
                //$data['code_name']	= compile_post('code_name');
		$data['lang'] 		= $lang;
                //$data['ngay_dang']	= time();
		$data['active']		= intval(compile_post('active'));	
		// xử lý ảnh
        if ($_FILES['image']['size']) {
            $image = Image::uploadImage('image', 'no');
            $data['image'] = $image['image'];
        } else {
            $data['image'] = compile_post('imageurl');
        }
		return $data;
	}
	
}

?>