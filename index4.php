<?php

define('_VALID_NVB', '1');

//http_response_code(404);
header("X-Robots-Tag: noindex, nofollow", true);

include_once("initcms.php");
include_once("lang/lang.php");

session_start();



$lang = $_SESSION['lang'];
if ($lang == 'en') {
    $language = " AND lang='en' ";
} else {
    $language = " AND lang<>'en' ";
}


$page_arr = array(
    11 => "ajaxprovider",
    21 => "contact_submit",
    22 => "cart_submit",
    23 => "tuyendung_submit",
    24 =>  "cart",
);

$page_idx = intval($_GET['page']);

if ($page_idx > 0) {

    $page_name = $page_arr[$page_idx];
    $pagePath = "modules/$page_name.php";
    if (file_exists($pagePath)) {
        include($pagePath);
    }
} else {
    $page_name = $_GET['page'];
    $pagePath = "modules/$page_name.php";
    if (file_exists($pagePath)) {
        include($pagePath);
    }
}



include("endcms.php");
