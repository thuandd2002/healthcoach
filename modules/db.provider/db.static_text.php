<?php 

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined( '_VALID_NVB' ) or die( 'Direct Access to this location is not allowed.' );
class dbStaticText{
	function getList($code_name){
		global $DBi;
                $data = array();
                $strWhere = "";
                if ($code_name)  $strWhere  = " AND code_name='$code_name'";
		$sql = "SELECT * FROM static_text WHERE 1=1 $strWhere";
		$db = $DBi->query($sql);
                while ($rs = $DBi->fetch_array($db))
                     $data[] = $rs;
		return $data;
	}
	function getById($id_static){
		global $DBi;
		$sql = "SELECT * FROM static_text WHERE id_static = $id_static";
		$db = $DBi->query($sql);
                $rs = $DBi->fetch_array($db);
		return $rs;
	}
        

}
?>