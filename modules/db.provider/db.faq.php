<?php

// Nguyen Binh
// suongmumc@gmail.com
// error_reporting(E_ALL);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class dbFaq {

    public function itemList($idc, $limit = 6) {
        global $DBi, $SETTING, $dir_path, $_GET;
        $idc = intval($idc);
        $data = array();
        $sql = "SELECT * FROM faq WHERE active=1 AND (id_category IN (" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY thu_tu DESC, name ASC";
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
        $sql = "SELECT * FROM faq WHERE id_faq = $id";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function item_other($idc, $id) {
        global $DBi, $SETTING;
        $idc = intval($idc);
        $id = intval($id);
        $sql = "SELECT * FROM faq WHERE active = 1 AND  (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY id_faq DESC LIMIT 0,5";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

}

?>