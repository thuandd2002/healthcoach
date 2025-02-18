<?php
error_reporting(E_ERROR);

session_start();
define('_VALID_NVB', '1');


/*
if(empty($_SERVER['HTTPS']) || $_SERVER['HTTPS'] == "off"){
    $redirect = 'https://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    header('HTTP/1.1 301 Moved Permanently');
    header('Location: ' . $redirect);
}

if ($_SERVER['HTTP_HOST'] != 'tenmien.vn'){ 
	header("HTTP/1.1 301 Moved Permanently"); 
	header("Location: https://tenmien.com".$_SERVER['REQUEST_URI']);
}
*/


include("initcms.php");


$request = $_SERVER['REQUEST_URI'];
$request = substr($request, strlen($dir_path), strlen($request));

$params = explode("/", $request);
$mobile_temp = "";

include_once('lang/lang.php');

if ($params[1] == 'en') {
    $lang = 'en';
    $_GET['lang'] = 'en';
    $_SESSION['lang'] = 'en';
    $lang_dir = 'en/';
} elseif ($params[1] == 'cn') {
    $lang = 'cn';
    $_GET['lang'] = 'cn';
    $_SESSION['lang'] = 'cn';
    $lang_dir = 'cn/';
} elseif ($params[1] == 'kr') {
    $lang = 'kr';
    $_GET['lang'] = 'kr';
    $_SESSION['lang'] = 'kr';
    $lang_dir = 'kr/';
} else {
    $lang = '';
    $_GET['lang'] = '';
    $_SESSION['lang'] = '';
    $lang_dir = '';
}


if ($lang == 'en') {
    $language = " AND lang='en' ";
} elseif ($lang == 'cn') {
    $language = " AND lang='cn' ";
} elseif ($lang == 'kr') {
    $language = " AND lang='kr' ";
} else {
    $language = " AND ( lang<>'en' AND lang<>'cn' AND lang<>'kr'  )";
}





if ($CONFIG['active_site'] == 1) {
    if ($_GET['page']) {
        $page = $_GET['page'];
        $page1 = $_GET['page'];
    } else {
        $getUrl = new url_process;
        //$uri=urldecode($_SERVER['REQUEST_URI']);
        $url_request = urldecode($_SERVER['REQUEST_URI']);

        $url_request = str_replace("'", "", $url_request);
        $url_request = str_replace('"', ' ', $url_request);

        $url_request1 = $url_request;
        $x = array();
        $x = explode("?", $url_request);
        $uri = $x[0];
        $cateinfo = $getUrl->__UrlType($uri, $site_address);
        $page1 = $cateinfo['page'];
        $page = $cateinfo['page'];
        $_GET['id'] = intval($getUrl->get_id_item($uri));
        $_GET['idc'] = intval($cateinfo['id_category']);
        $_GET['keyword'] = $cateinfo['keyword'];
        $_GET['title'] = $cateinfo['title'];
        $_GET['p'] = intval($cateinfo['p']);
        $_GET['code'] = $cateinfo['code'];


        $url_filename = $getUrl->get_filename($uri);

        $idc = $_GET['idc'];
        $_GET['id'] = $getUrl->get_id_article($cateinfo['data_type'], $url_filename);


        $p = $_GET['p'];

        if ($p) {
            if ($p <= 0)
                $p = 1;
            if ($id) {
            } elseif ($p > 1) {
                $plink = $p . '.htm';
            }
        }
        $meta = $getUrl->get_meta_item($cateinfo['data_type']);
    }


    if ($url_filename && intval($_GET['id']) == 0 && ($page1 != "cart")) {
        header("HTTP/1.1 404 Not Found");
        $page1 = "404";
        $page = "404";
    }

    if ($page1 == '' && strlen($uri) > 1) {
        header("HTTP/1.1 404 Not Found");
        $page1 = "404";
        $page = "404";
    }


    /*
        require_once 'Mobile_Detect.php';
        $detect = new Mobile_Detect;
        if ( $detect->isMobile() ) {
            $mobile_temp = "_mobile";
        }
        */
    $mobile_temp = "";
    /* 
    if ($_GET['mobile'] == "Y")
        $_SESSION['mobile'] = 1;

    if ($_GET['mobile'] == "N")
        $_SESSION['mobile'] = 0;


    if ($_SESSION['mobile'] == 1) {
        $mobile_temp = "_mobile";
    } else {
        require_once 'Mobile_Detect.php';
        $detect = new Mobile_Detect;
        if ($detect->isMobile()) {
            $mobile_temp = "_mobile";
            $_SESSION['mobile'] = 1;
        }
    }
    */

    require_once 'Mobile_Detect.php';
    $detect = new Mobile_Detect;
    if ($detect->isMobile()) {
        $mobile_temp = "_mobile";
        $_SESSION['mobile'] = 1;
    }    

    if ($page1 == '' || $page1 == null)
        $page1 = 'home';



    $page1 = "modules/$page1.php";
    if (file_exists($page1)) {
        include("modules/header.php");
        include($page1);
        include("modules/footer.php");
    } else {
        referbox("/index.php?", "Page not pound, redirect to home page");
    }
    include("endcms.php");
} else {

    include("source/error.php");
}
