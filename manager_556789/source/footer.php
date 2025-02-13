<?php 
defined( '_VALID_NVB' ) or die( 'Direct Access to this location is not allowed.' );
$tpl=new TemplatePower("skin/footer.tpl");
$tpl->prepare();
/*
$data = array();
$data['id_user'] = $my['id'];
$data['url'] ='http://'.$_SERVER['HTTP_HOST']. $_SERVER['REQUEST_URI'];
$data['createdate'] = time() + $CONFIG['time_offset'];
function get_client_ip() {
   $ipaddress = '';
   if (getenv('HTTP_CLIENT_IP'))
       $ipaddress = getenv('HTTP_CLIENT_IP');
   else if(getenv('HTTP_X_FORWARDED_FOR'))
       $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
   else if(getenv('HTTP_X_FORWARDED'))
       $ipaddress = getenv('HTTP_X_FORWARDED');
   else if(getenv('HTTP_FORWARDED_FOR'))
       $ipaddress = getenv('HTTP_FORWARDED_FOR');
   else if(getenv('HTTP_FORWARDED'))
      $ipaddress = getenv('HTTP_FORWARDED');
   else if(getenv('REMOTE_ADDR'))
       $ipaddress = getenv('REMOTE_ADDR');
   else
       $ipaddress = 'UNKNOWN';
   return $ipaddress;
}
$data['ip'] = get_client_ip();
$lastid = $DBi->insertTableRow('log_visited', $data);
*/

$log  = "USER: " . $my['username'] ."(". $my['id'] .")". ". IP: " . $_SERVER['REMOTE_ADDR'] .' - '.date("F j, Y, H:i:s a").PHP_EOL.
		"Action: ". $_SERVER['REQUEST_URI'] .PHP_EOL.
		"-------------------------".PHP_EOL;
//Save string to log, use FILE_APPEND to append.
file_put_contents('./logs/access_log_'.date("j.n.Y").'.log', $log, FILE_APPEND);	

$tpl->printToScreen();
?>