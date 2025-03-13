<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);


defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class dbMenu {

    public function menuHome($idc=0) {
        global $DBi, $language;
        $idc = intval($idc);
        if ($idc > 0) {
            $parent = " AND parentid = $idc ";
        } else {
            $like = " AND vitri LIKE '%:menuhome:%' ";
        }
        $sql = "SELECT * FROM category WHERE active=1 $language $like $parent ORDER BY thu_tu ASC, name ASC LIMIT 10";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function menuBar($idc=0) {
        global $DBi, $language;
        $idc = intval($idc);
        if ($idc > 0) {
            $parent = " AND parentid = $idc ";
        } else {
            $like = " AND vitri LIKE '%:menubar:%' ";
        }
        $sql = "SELECT * FROM category WHERE active=1 $language $like $parent ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function barLeftRight($idc=0, $pos='') {
        global $DBi, $language;
        $idc = intval($idc);
        if ($idc > 0)
            $parent = " AND parentid = $idc ";
        else
            $like = " AND vitri LIKE '%:$pos:%' ";

        $sql = "SELECT * FROM category WHERE active=1 $language $like $parent ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db))
            $data[] = $rs;

        return $data;
    }

    public function menuTop($idc=0) {
        global $DBi, $language;
        $idc = intval($idc);
        if ($idc > 0) {
            $parent = " AND parentid = $idc ";
        } else {
            $like = " AND vitri LIKE '%:menutop:%' ";
        }
        $sql = "SELECT * FROM category WHERE active=1 $language $like $parent ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function menuMain($idc=0) {
        global $DBi, $language;
        $idc = intval($idc);
        if ($idc > 0) {
            $parent = " AND parentid = $idc ";
        } else {
            $like = " AND vitri LIKE '%:mainmenu:%' ";
        }
        $sql = "SELECT * FROM category WHERE active=1 $language $like $parent ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function menuFooter() {
        global $DBi, $language;

        $location = " AND vitri LIKE '%:menufooter:%' ";

        $sql = "SELECT * FROM category WHERE active=1 $language $location ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function menuBarFooter() {
        global $DBi, $language;

        $location = " AND vitri LIKE '%:menufooter:%' ";

        $sql = "SELECT * FROM category WHERE active=1 $language $location ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function listSubCat($idc=0, $limit = 100) {
        global $DBi;
        $limit = intval($limit);
        $idc = intval($idc);
        $sql = "SELECT * FROM category WHERE active=1 AND parentid = $idc  ORDER BY thu_tu ASC, name ASC LIMIT $limit";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function selectList($idc = 0, $data_type='') {
        global $DBi;
        $idc = intval($idc);
        if ($data_type != '') {
            $dk = " AND data_type = '" . $data_type . "' ";
        }
        $sql = "SELECT * FROM category WHERE active=1 AND parentid = $idc $dk AND lang<>'en' ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function selectByLocation($location, $location1 = '') {
        global $DBi, $language;
        $idc = intval($idc);
        if ($location1 != '') {

            $loca = " AND (vitri LIKE '%:" . $location . ":%'  OR vitri LIKE '%:" . $location1 . ":%')";
        } else {
            $loca = " AND vitri LIKE '%:" . $location . ":%' ";
        }
        $sql = "SELECT * FROM category WHERE active=1 $language $loca ORDER BY thu_tu ASC, name ASC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function footerMenuCol($location, $footercol = 0) {
        global $DBi, $language;
        $footercol = intval($footercol);

        $loca = " AND vitri LIKE '%:" . $location . ":%' ";

        if ($footercol > 0)
            $loca .= " AND footercol = '$footercol' ";


        $sql = "SELECT * FROM category WHERE active=1 $language $loca ORDER BY thu_tu ASC, name ASC";


        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }

    public function selectByDataType($data_type) {
        global $DBi, $language;
        $idc = intval($idc);
        $sql = "SELECT * FROM category WHERE active=1 $language AND data_type ='" . $data_type . "' ORDER BY thu_tu ASC, name ASC LIMIT 1";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function selectByLD($location, $data_type='') {
        global $DBi, $language;
        $data = array();
        $idc = intval($idc);

        if ($location != '')
            $loc = " AND (vitri LIKE '%:" . $location . ":%' )";

        if ($data_type != '')
            $data_type = "AND data_type ='" . $data_type . "'";

        $sql = "SELECT * FROM category WHERE active=1 $language $data_type $loc ORDER BY thu_tu ASC, name ASC LIMIT 1";

        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db))
            $data[] = $rs;
        return $data;
    }

    public function selectMenuById($idc=0) {
        global $DBi;
        $idc = intval($idc);
        $sql = "SELECT * FROM category WHERE active=1 AND id_category = $idc";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db))
            return $rs;
    }

    public function getCateSearch() {
        global $DBi;
        $sql = "SELECT c.*,u.id_category as idc,u.url as uurl FROM category as c LEFT JOIN url as u ON(c.id_category = u.id_category) WHERE u.id_item=0 AND u.data_type='product' AND c.parentid=0 AND c.data_type='product' ORDER BY name ASC";
        echo $sql;

        $db = $DBi->query($sql);
        $data = array();
        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }



}

?>