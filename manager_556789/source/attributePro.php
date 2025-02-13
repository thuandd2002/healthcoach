<?php 
// Nguyen Binh
// suongmumc@gmail.com
// update 04/2013
error_reporting(E_ERROR);
defined( '_VALID_NVB' ) or die( 'Direct Access to this location is not allowed.' );
	$tpl=new TemplatePower("skin/attributePro.tpl");
	$tpl->prepare();
	
	
	$id = intval($_GET['id']);
	if($_GET['code']!='showedit'){
		$tpl->assignGlobal('action','?page=attributePro&code=addAttr');
	}else{
		$tpl->assignGlobal('action',"?page=attributePro&code=update&id=$id");	
	}
	if($_GET['code'] == 'showedit' || $_GET['code']=='addAttr'){
		$tpl->assignGlobal("blockhide","blockshow");
	}else{
		$tpl->assignGlobal("blockhide","blockhide");
	}
	
	// add new attr
	if($_GET['code']=='addAttr'){
		if($_POST['gone']==1){
			$a = array();
			$a['name'] = compile_post('name1') ;
			$a['alias_name'] = get_alias_name(0,clean_url($a['name']));
			$a['default_value'] = compile_post('default_value') ;	
			
			$lastid = $DBi->insertTableRow('pro_attribute',$a);
			if($lastid) {
				Message::showMessage("success","Thêm mới thành công !");
			}
		}
	}
	
	// show form edit attr
	if($_GET['code']=='showedit'){
		$sql = "SELECT * FROM pro_attribute WHERE id = $id";
		$db = $DBi->query($sql);
		if($rs = $DBi->fetch_array($db)){
			$tpl->assign(array(
				name1 => $rs['name']	,
				id => $rs['id'],
				default_value => $rs['default_value']
			));
		}
	}
	
	
	// excu update attr
	if($_GET['code']=='update'){
			$a = array();
			$a['name'] = compile_post('name1') ;
			$a['default_value'] = compile_post('default_value') ;
			$a['alias_name'] = get_alias_name($id,clean_url($a['name']));
			
			if($DBi->updateTableRow('pro_attribute', $a, 'id', $id)){
				Message::showMessage("success","Sửa chữa thành công !");
			}
	}
	
	// addnew group attr
	if($_GET['code']=='saveSelectedAttr'){
		if(compile_post('name')){
			$a = array();
			$a['name'] = compile_post('name');
			$a['setdefault'] = intval(compile_post('setdefault'));
			
			
			$id_group = $DBi->insertTableRow('group_attr',$a);
			
			
			$selected_attr = $_POST['selected_attr'];
			if($selected_attr && $id_group){
				foreach($selected_attr as $val){
					$c = array();
					$c['id_group']	= $id_group;
					$c['id_attr'] 	= intval($val);
					$c['thu_tu'] 	= intval(compile_post('thu_tu_'.intval($val)));
					
					$DBi->insertTableRow('group_attribute',$c);
				}	
			}
		}else{
			Message::showMessage("success","Bạn phải nhập vào tên nhóm thuộc tính cần tạo !");
		}
	}
	
	// show form edit group attr
	if($_GET['code'] == 'showEditAttr'){
		$tpl->assign("_ROOT.blockshowhidegroup","blockshow");
		$tpl->newBlock("insertUpdateAttr");
		$tpl->assign("actiongroupattr","?page=attributePro&code=updateSelectedAttr&idg=$id");
		$sql = "SELECT * FROM group_attr WHERE id_group=$id";
		$db = $DBi->query($sql);
		if($rs = $DBi->fetch_array($db)){
			$tpl->assign("namegroupattr",$rs['name']);
			if($rs['setdefault']==1) $tpl->assign("setdefault","checked");
			$tpl->assign("idg",$rs['id_group']);
			$sql1 = "SELECT g.*,p.name AS attrName FROM group_attribute as g LEFT JOIN pro_attribute as p ON(g.id_attr = p.id) WHERE g.id_group=$rs[id_group] ORDER BY g.thu_tu ASC, p.name";
			$db1 = $DBi->query($sql1);
			$a = array();
			$i=0;
			while($rs1 =$DBi->fetch_array($db1)){
				$tpl->newBlock("list_attr_edit");
				$i++;
				$tpl->assign("id_attr",$rs1['id_attr']);
				$tpl->assign("attrname",$rs1['attrName']);
				$tpl->assign("thu_tu",$rs1['thu_tu']);
				$a[$i] = $rs1['id_attr'];
			}
		}
		list_attribute('list_attribute1',$a);	
		
	}else{
		$tpl->newBlock("insertUpdateAttr");
		$tpl->assign("actiongroupattr",'?page=attributePro&code=saveSelectedAttr');
		$tpl->assign("_ROOT.blockshowhidegroup","blockhide");
		list_attribute('list_attribute1');	
	}
	
	if($_GET['code'] == 'updateSelectedAttr'){
		$idg = intval($_GET['idg']);
		$DBi->query("DELETE FROM group_attribute WHERE id_group=$idg");
		$a = array();
		$a['name'] = compile_post('name');
		$a['setdefault'] = intval(compile_post('setdefault'));
			
		$DBi->updateTableRow('group_attr', $a, 'id_group', $idg);
		
		$selected_attr = $_POST['selected_attr'];
			if($selected_attr && $idg){
				foreach($selected_attr as $val){
					$c = array();
					$c['id_group']	= $idg;
					$c['id_attr'] 	= intval($val);
					$c['thu_tu'] 	= intval(compile_post('thu_tu_'.intval($val)));
					
					
					$DBi->insertTableRow('group_attribute',$c);
				}	
			}
		
	}
	
	
	$root="Root";
	$par_page="sr_pro_attribute";
	$cat_name       ="danh m&#7909;c";
	$category       ="category";
	$id_category    ="id_category";
	$item_name      ="bài viết";
	$item           ="info";
	$id_item        ="id_info";
	$maxpage=8;
	$maxitem=50;
	$data_type='info';
	
	$id=intval($_GET['id']);
	$id=intval($_REQUEST['id']);
	
	// global 
	
	list_attribute('list_attribute');
	list_group_attr();
	
	$tpl->printToScreen();
	function list_attribute($block,$grselected=''){
		global $DBi, $tpl;
		
		$sql = "SELECT * FROM pro_attribute ORDER BY name ASC";
		$db = $DBi -> query($sql);
		while($rs = $DBi ->fetch_array($db)){
			$tpl->newBlock($block);
			$tpl->assign("name",$rs['name']);
			$tpl->assign("id_attr",$rs['id']);
			$tpl->assign("delete","index4.php?page=excu_attr&code=delete&id=".$rs['id']);
			$tpl->assign("edit","?page=attributePro&code=showedit&id=".$rs['id']);
			if($grselected){
				if(in_array($rs['id'],$grselected))	{
					$tpl->assign("selected","checked")	;
				}
			}
		}
	}
	
	function list_group_attr(){
		global $DBi,$tpl;
		$sql = "SELECT * FROM group_attr ORDER BY name ASC";
		$db = $DBi->query($sql);
		while($rs = $DBi->fetch_array($db)){
			$tpl->newBlock("group_attr");
			$tpl->assign("name",$rs['name']);
			if($rs['setdefault']==1) $tpl->assign("setdefault","setdefault");
			$tpl->assign("link_del","index4.php?page=excu_attr&code=deletegroup&id=$rs[id_group]");
			$tpl->assign("link_edit","?page=attributePro&code=showEditAttr&id=$rs[id_group]");
			list_attr_in_group($rs['id_group'])	;
		}
	}
	
	function list_attr_in_group($id){
		global $DBi, $tpl;
		$id = intval($id);
		$sql = "SELECT g.*,p.name AS attrName FROM group_attribute as g LEFT JOIN pro_attribute as p ON(g.id_attr = p.id) WHERE g.id_group=$id ORDER BY g.thu_tu ASC, p.name";
		
		$db = $DBi -> query($sql);
		while($rs =$DBi ->fetch_array($db)){
			$tpl->newBlock("list_attr");
			$tpl->assign("attrname",$rs['attrName']);
			$tpl->assign("thu_tu",$rs['thu_tu']);
			$tpl->assign("link_del_attr_in_group","index4.php?page=excu_attr&code=delete_attr_in_group&id=$rs[id_attr]&idg=$rs[id_group]");
			
		}
	}
	function get_alias_name($id,$alias_name,$i=0){
		global $DBi;
		$id = intval($id);
		$sql = "SELECT * FROM pro_attribute WHERE alias_name = '".$alias_name."' AND id<>$id";
		$db = $DBi->query($sql);
		$str='';
		$i++;
		if($DBi ->num_rows($db)>0){
			$alias=$alias_name.'-'.$i;
			$str = get_alias_name($id,$alias,$i);
		}else{
			$str = $alias_name;	
		}
		return $str;
	}
?>