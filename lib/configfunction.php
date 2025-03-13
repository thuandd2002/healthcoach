<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);


defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
function check_double_url($url, $id = 0) {
    global $DBi, $category, $id_category, $dklang;
    $id = intval($id);
    $sql = "SELECT * FROM $category WHERE url='$url' AND $id_category<>$id $dklang";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        $url = substr($url, 0, strlen($url) - 1);
        $url = $url . "-" . $rs[$id_category] . "/";
        $url = check_double_url($url, $id);
    }
    return $url;
}
function get_link_menu_product($pid) {
    global $DBi, $category, $id_category;
    $pid = intval($pid);
    $sql = "SELECT * FROM $category WHERE $id_category=$pid";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        if ($rs['parentid'] == 0) {
            $str = '';
        } else {
            $str = $rs['url'];
        }
    }
    return $str;
}
function get_link_menu($pid) {
    global $DBi, $category, $id_category, $dklang;
    $pid = intval($pid);
    $sql = "SELECT * FROM $category WHERE $id_category=$pid $dklang";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        $str = $rs['url'];
    }
    return $str;
}
function Get_Link($link) {
    global $dir_path;
    if (substr($link, 0, 7) == 'http://' || substr($link, 0, 8) == 'https://') {
        $url = $link;
    } else {
        $url = $dir_path . "/" . $link;
    }
    return $url;
}
function Get_Id_Cat_Menu($table, $idcat, $idc) {
    global $DBi, $lang, $dklang;
    $idc = intval($idc);
    $list_id .= $idc;
    $sql = "SELECT * FROM $table WHERE parentid=$idc $dklang";
    $db = $DBi->query($sql);
    while ($rs = $DBi->fetch_array($db)) {
        $list_id .= "," . Get_Id_Cat_Menu($table, $idcat, $rs[$idcat]);
    }
    return $list_id;
}
function get_main_category_id($idc) {
    global $DBi, $lang;
    $idc = intval($idc);
    $sql = "SELECT * FROM category WHERE id_category=$idc $dklang";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        $sql1 = "SELECT * FROM category WHERE id_category=$rs[parentid] $dklang";
        $db1 = $DBi->query($sql1);
        if ($rs1 = $DBi->fetch_array($db1)) {
            $idc = get_main_category_id($rs1['id_category']);
        }
    }
    return $idc;
}
function get_link_quick_go_admin($data_type) {
    global $DBi;
    switch ($data_type) {
        case "news":
            $page = "sr_news";
            break;
        case "info":
            $page = "sr_catif";
            break;
            break;
        case "photo":
            $page = "sr_photo";
            break;
        case "video":
            $page = "sr_video";
            break;
        case "logo":
            $page = "sr_catlg";
            break;
        case "service":
            $page = "sr_service";
            break;
        case "boxsupport":
            $page = "sr_support";
            break;
    }
    return $page;
}
function Get_Id_Cat($idc) {
    global $DBi, $dklang;
    $idc = intval($idc);
    $list_id = '';
    $list_id .= $idc;
    $sql = "SELECT * FROM category WHERE active=1 AND parentid=$idc $dklang";
    $db = $DBi->query($sql);
    while ($rs = $DBi->fetch_array($db)) {
        $list_id .= "," . Get_Id_Cat($rs['id_category']);
    }
    return $list_id;
}
function Get_Main_Cat_Name_path($idc) {
    global $DBi, $dir_path, $dklang, $lang_dir;
    $idc = intval($idc);
    $sql = "SELECT * FROM category WHERE active=1 AND id_category=$idc $dklang";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        $str = "<a href='" . $dir_path . "/" . $rs['url'] . "'>" . strip_tags($rs['name']) . "</a>";
        $sql1 = "SELECT * FROM category WHERE id_category=$rs[parentid]";
        $db1 = $DBi->query($sql1);
        if ($rs1 = $DBi->fetch_array($db1)) {
            $str = Get_Main_Cat_Name_path($rs1['id_category']) . "&nbsp;<i class='fa fa-angle-right'></i>&nbsp;" . $str;
        }
    }
    return $str;
}
function get_url_category($idc) {
    global $DBi, $lang;
    $idc = intval($idc);
    $sql = "SELECT * FROM category WHERE id_category=$idc $dklang";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        return $rs['url'];
    }
}
function Get_Urli($url) {
    $a = array();
    $lenurl = strlen($url);
    $a = explode("/", $url);
    $lena = count($a);
    $str = '';
    if (substr($url, $lenurl - 3, $lenurl) == 'htm') {
        for ($i = 0; $i < $lena - 1; $i++) {
            $str .= $a[$i] . "/";
        }
    } elseif (substr($url, $lenurl - 1, $lenurl) != '/') {
        $str = $url . "/";
    } else {
        $str = $url;
    }
    return $str;
}
function Get_Id_Cat_Back($idc) {
    global $DBi, $lang;
    $list_id = intval($idc);
    $sql = "SELECT * FROM category WHERE id_category=$idc $dklang";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        $sql1 = "SELECT * FROM category WHERE id_category=$rs[parentid] $dklang";
        $db1 = $DBi->query($sql1);
        if ($rs1 = $DBi->fetch_array($db1)) {
            $list_id .= "," . Get_Id_Cat_Back($rs1['id_category']);
        }
    }
    return $list_id;
}
function url($url) {
    if (substr($url, 0, 7) == 'http://' || substr($url, 0, 8) == 'https://') {
        
    } else {
        
    }
}


function get_text_cat($idc) {
    global $DBi, $dir_path;
    $idc = intval($idc);
    $sql = "SELECT * FROM category WHERE id_category = $idc";
    $db = $DBi->query($sql);
    $str = array();
    if ($rs = $DBi->fetch_array($db)) {
        if ($rs['image']) {
            $str['image'] = '<img src="' . $dir_path . "/image.php?width=789&image=" . $dir_path . "/" . $rs['image'] . '" />';
        }
        if (strlen($rs['content']) > 7) {
            $str['text'] = "<div class='c10'></div>" . $rs['content'] . "<div class='c10'></div>";
        }
        $str['name'] = $rs['name'];
    }
    return $str;
}
function attribute($idc) {
    global $DBi, $tpl;
    $idc = intval($idc);
    $sql = "SELECT * FROM category WHERE id_category = $idc";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        $sql1 = "SELECT g.*,p.name AS attrName, p.default_value AS defaultvalue FROM group_attribute AS g LEFT JOIN pro_attribute AS p ON(g.id_attr = p.id) WHERE g.id_group = $rs[group_attr] ORDER BY p.name ASC";
        $str = '';
        $db1 = $DBi->query($sql1);
        $i = 0;
        while ($rs1 = $DBi->fetch_array($db1)) {
            if ($rs1['attrName']) {
                $str .= '<tr>
	            <td valign="top"><strong>' . $rs1['attrName'] . '</strong></td>
	            <td><input type="text" name="attribute[' . $rs1['id_attr'] . ']" id="" class="textbox" value="' . $rs1['defaultvalue'] . '" /></td></tr>';
            }
        }
    }
    return $str;
}
function get_name_attr($id) {
    global $DBi;
    $id = intval($id);
    $sql = "SELECT * FROM pro_attribute WHERE id=$id";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        return $rs['name'];
    }
}
function product_update_hit($id) {
    global $DBi;
    $id = intval($id);
    $DBi->query("UPDATE product SET hit = hit+1 WHERE id_product = $id");
}
function show_icon_hns($val) {
    switch ($val) {
        case 'new':
            $str = '<div class="new"></div>';
            break;
        case 'hot':
            $str = '<div class="hot"></div>';
            break;
        case 'salse':
            $str = '<div class="salse"></div>';
            break;
        default:
            break;
    }
    return $str;
}
function maker_name($id) {
    global $DBi;
    $id = intval($id);
    $sql = "SELECT * FROM maker WHERE id = $id";
    $db = $DBi->query($sql);
    if ($rs = $DBi->fetch_array($db)) {
        return $rs['name'];
    }
}
function rateProduct($id) {
    global $DBi;
    $id = intval($id);
    $sql = "SELECT * FROM rate WHERE id_product = $id";
    $db = $DBi->query($sql);
    $i = 0;
    $rate = 0;
    while ($rs = $DBi->fetch_array($db)) {
        $i++;
        $rate += $rs['ratevalue'];
    }
    if ($i > 0) {
        $result = intval($rate / $i);
    }
    return $result;
}
?>
