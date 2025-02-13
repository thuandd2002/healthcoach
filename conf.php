<?php

date_default_timezone_set("Asia/Ho_Chi_Minh");

$config['dbname']="healthcoach";
$config['username']="root";
$config['password']="";
$config['host']="localhost";


$site_address='http://'.$_SERVER['HTTP_HOST'];
$dir_path='';
$cache_file_dir = dirname(__FILE__);

$imagedir_finder = "/uploaded/";
$dir_image_upload = "/uploaded/".date('Y',time())."/".date('m',time())."/";
$dir_image_browser = '/uploaded/';
$cache_image_path = $dir_path.'/temp/';
$minify = 0;
$clearcachetime = time() + 172800 ; // 2 ngày

// config url
$rewrite = 1;
$url_extension_category = '/';
$url_extension_article = '.html'; // .htm,.html
$url_max_number_category = 2; //1,2,3,4
 
?>