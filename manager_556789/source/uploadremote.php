<?php
defined( '_VALID_NVB' ) or die( 'Direct Access to this location is not allowed.' );
error_reporting(0);
include("../lib/class.upload.php");
$url = $_GET['url'];
$remote_image_url = $url;
$dir_upload = $dir_image_upload;
$local_image_folder = $_SERVER['DOCUMENT_ROOT'].$dir_upload;


// You can set the prefered upload method.  
// If you do not set it, then it will try all of them until it can use one!
//$upload_method = 'curl';
//$upload_method = 'gd';
//$upload_method = 'fopen';
//$upload_method = 'sockets';
$upload_method = 'fopen';

// initialize the class
$image = new UploadImage($local_image_folder);
$img = $image->uploadRemoteImage($remote_image_url, $upload_method);

$img =str_replace($local_image_folder,"",$img);
echo $dir_upload.$img;
?>