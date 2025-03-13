<?php
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$id = intval($_GET['id']);
$id_item = intval($_GET['id_item']);
if($_GET['code'] == 'delete'){
	$sql = "DELETE FROM service_item WHERE id=$id_item";
	$DB->query($sql);
}else{
	$tpl = new TemplatePower("skin/service_item.tpl");
	$tpl->prepare();
	
	if($_GET['code'] == 'load'){
		$tpl->newBlock("load");
		getServiceItem($id);
	}else{
		$tpl->newBlock("default");
		
		$tpl->assignGlobal("id",$id);
		$tpl->assignGlobal("id_item",$id_item);
		$sql = "SELECT * FROM service WHERE id_service = $id";
		$db = $DB->query($sql);
		if($rs = mysql_fetch_array($db)){
			$tpl->assign("servicename",strip_tags($rs['name']));
		}
		if($id_item){
			$tpl->assign("code","update");
		}else{
			$tpl->assign("code","save");
		}
		
		
		if($_GET['code'] == 'showupdate'){
			$sql = "SELECT * FROM service_item WHERE id = $id_item";
			$db = $DB->query($sql);
			if($rs = mysql_fetch_array($db)){
				$tpl->assign("name",$rs['name']);
				$tpl->assign("thu_tu",$rs['thu_tu']);
				if($rs['active'] == 1)
					$tpl->assign("active","checked");
				$tpl->assign("content",$rs['content']);
				if($rs['image']){
					$tpl->assign("imageurl",$rs['image']);
					$tpl->assign("image", '<img src="' . $cache_image_path . resizeimage(160, 120, $dir_path . "/" . $rs['image']) . '" class="img-polaroid marginright5" align="left" id="avatar" />');
				}
			}
		}
		
		if($_GET['code'] == 'save'){
			$data = getDataItem();
		   if ($data) {
				$lastid = $DBi->insertTableRow('service_item',$data);
				if (intval($lastid) > 0){
					Message::showMessage("success", "Thêm mới thành công !");
				}
				else{
					Message::showMessage("success", "");
				}
			}
		}
		if($_GET['code'] == 'update'){ 
			$id_item = intval($id_item);
			$data = getDataItem();
			if ($data) {
				if ($DBi->updateTableRow('service_item', $data, 'id', $id_item)){
					Message::showMessage("success", "Sửa chữa thành công !");	
				}
				else{
					Message::showMessage("error", "");
				}
			}
		}
	}
	$tpl->printToScreen();
}

function getDataItem(){
	global $db,$id;
	$data = array();
	$data['name'] = compile_post('name');
	$data['image'] = compile_post('imageurl');
	$data['thu_tu'] = intval(compile_post('thu_tu'));
	$data['active'] = intval(compile_post('active'));
	$data['id_service'] = $id;
	$data['content'] =str_replace('\\', "", $_POST['contentservice']);
	return $data;
}
function getServiceItem($id_service){
		global $DB, $tpl, $dir_path, $cache_image_path,$id;
		$sql = "SELECT * FROM service_item WHERE id_service = $id_service";
		$db = $DB->query($sql);
		while($rs = mysql_fetch_array($db)){
			$tpl->newBlock("lstserviceitem");
			$tpl->assign("itemname",$rs['name']);
			$tpl->assign("editlink",'index4.php?page=service_item&code=showupdate&id_item='.$rs['id'].'&id='.$id);
			$tpl->assign("deletelink",'index4.php?page=service_item&code=delete&id_item='.$rs['id']);
		}
		
	}
?>
