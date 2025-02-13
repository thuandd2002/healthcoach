<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class dbDownload {

    public function itemList($idc, $limit = 6) {
        global $DBi, $SETTING, $dir_path, $_GET;
        $idc = intval($idc);
        $data = array();
        $sql = "SELECT * FROM download WHERE active=1 AND (id_category IN (" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%') ORDER BY  thu_tu DESC, id_download DESC";
        //echo $sql; 
        $db1 = paging::pagingFonten($_GET['p'], $dir_path . "/" . url_process::getUrlCategory($idc), $sql, 6, $limit);
        while ($rs = $DBi->fetch_array($db1['db'])) {
            $data[] = $rs;
        }
        $data['pages'] = $db1['pages'];
        return $data;
    }

    public function itemDetail($id) {
        global $DBi, $SETTING;
        $id = intval($id);
        $sql = "SELECT * FROM download WHERE id_download = $id";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function itemOther() {
        global $DBi, $SETTING, $idc, $id;
        $idc = intval($idc);
        $id = intval($id);
        $sql = "SELECT * FROM download WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ") OR groupcat LIKE '%:" . $idc . ":%')  AND id_download <> $id ORDER BY thu_tu DESC, id_download DESC LIMIT 8";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }


}

?>