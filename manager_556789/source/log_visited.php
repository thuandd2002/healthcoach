<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/log_visited.tpl");
$tpl->prepare();


$log = new logVisited;
$log->__construct();
$tpl->printToScreen();

class logVisited{
	function __construct(){
		global $DBi,$tpl;
		$this->listVisited();
	}
	function listVisited(){
		global $DBi, $tpl;
		$datelog = compile_post('datelog');
		$tpl->assignGlobal('datelog',$datelog);
		if($_POST['datelog']){
			$startdate = $datelog.' 00:00:00';
			$enddate = $datelog.' 23:59:59';
			$startdate = string_to_microtime($startdate);
			$enddate = string_to_microtime($enddate);
			$filter .=' WHERE CAST(l.createdate AS UNSIGNED INTEGER)>= '.$startdate.' AND CAST(l.createdate AS UNSIGNED INTEGER)<= '.$enddate.' ';
		}
		if (intval($_GET['p']) < 1)
            $p = 1;
      else
            $p = intval($_GET['p']);
		$sql = "SELECT l.*,u.name as uname,u.username as username  FROM log_visited AS l LEFT JOIN users AS u ON(l.id_user = u.id_users) ".$filter." ORDER BY l.createdate DESC";
		$db = paging::pagingAdmin($p, "?page=log_visited", $sql, 8, 100);	
		while($rs = mysqli_fetch_array($db['db'])){
			$tpl->newBlock("listlog");	
			$tpl->assign('createdate',date('d/m/Y H:i:s'));
			$tpl->assign('url',$rs['url']);
			$tpl->assign('ip',$rs['ip']);
			$tpl->assign('username',$rs['username']);
			$tpl->assign('uname',$rs['uname']);
			$tpl->assign('id_user',$rs['id_user']);
		}
		$tpl->assignGlobal('pages',$db['pages']);
	}	
}

?>