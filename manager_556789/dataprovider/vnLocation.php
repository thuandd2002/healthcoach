<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class vnLocation {

    //vn_province
    function getProvinceById($id) {
        global $DBi;
        //$id = intval($id);
        $sql = "SELECT * FROM vn_province WHERE provinceid ='" . $id . "'";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    function getProvinceList() {
        global $DBi;
        $sql = "SELECT * FROM vn_province ORDER BY provinceid";
        $db = $DBi->query($sql);
        while ($row = $DBi->fetch_array($db)) 
            $data[] = $row;
        return $data;
    }

    
    function getProvinceBDS($provinceid) {
        global $DBi;
        $sql = "SELECT count(*) as soluongtin FROM product WHERE provinceid = '$provinceid'";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return intval($rs['soluongtin']);
    }
    
    
    //vn_district
    function getDistrictById($id) {
        global $DBi;
        //$id = intval($id);
        $sql = "SELECT * FROM vn_district WHERE districtid ='" . $id . "'";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    function getDistrictList($provinceid) {
        global $DBi;
        //$provinceid = intval($provinceid);
        $sql = "SELECT * FROM vn_district WHERE provinceid = '$provinceid'";
        $db = $DBi->query($sql);
        while ($row = $DBi->fetch_array($db)) 
            $data[] = $row;
        return $data;

    }

    //vn_ward
    function getWardById($id) {
        global $DBi;
        //$id = intval($id);
        $sql = "SELECT * FROM vn_ward WHERE wardid ='" . $id . "'";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    function getWardList($districtid) {
        global $DBi;
        //$districtid = intval($districtid);
        $sql = "SELECT * FROM vn_ward WHERE districtid = '$districtid'";
        $db = $DBi->query($sql);
        while ($row = $DBi->fetch_array($db)) 
            $data[] = $row;
        return $data;

    }


}

?>