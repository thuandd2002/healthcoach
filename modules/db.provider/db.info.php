<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class dbInfo {

    public function itemList($idc, $limit = 6) {
        global $DBi, $SETTING, $dir_path, $_GET;
        $idc = intval($idc);
        $data = array();
        $sql = "SELECT * FROM info WHERE active=1 AND (id_category IN (" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, name ASC";
        //echo $sql; 
        $db1 = paging::pagingFonten($_GET['p'], $dir_path . "/" . url_process::getUrlCategory($idc), $sql, 8, $limit);
        //echo $sql;
        while ($rs = $DBi->fetch_array($db1['db'])) {
            $data[] = $rs;
        }
        $data['pages'] = $db1['pages'];
        return $data;
    }

    public function itemDetail($id) {
        global $DBi, $SETTING;
        $id = intval($id);
        $sql = "SELECT * FROM info WHERE id_info = $id";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function item_other($idc, $id) {
        global $DBi, $SETTING;
        $idc = intval($idc);
        $id = intval($id);
        $sql = "SELECT * FROM info WHERE active = 1 AND  (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY id_info DESC LIMIT 0,5";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function item_new($idc, $id) {
        global $DBi, $SETTING;
        $idc = intval($idc);
        $id = intval($id);
        $sql = "SELECT * FROM info WHERE active = 1 AND  (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') AND id_info > $id  ORDER BY id_info DESC LIMIT 0,5";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function item_old($idc, $id) {
        global $DBi, $SETTING, $id;
        $id = intval($id);
        $idc = intval($idc);
        $sql = "SELECT * FROM info WHERE active = 1 AND  (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') AND id_info < $id  ORDER BY id_info DESC LIMIT 0,10";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

}

?>