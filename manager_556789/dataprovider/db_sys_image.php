<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class dbSysImage {

    public function insertImage($data) {
        global $DBi;
        if ($data) {

            $lastid = $DBi->insertTableRow('sys_image', $data);
        }
    }

    public function updateImage($id, $data) {
        global $DBi;
        if ($data) {

            $DBi->updateTableRow('sys_image', $data, 'id', $id);
        }
    }

    public function deleteById($id) {
        global $DBi;
        $sql = "DELETE FROM sys_image WHERE id =" . $id . "";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function deleteMulti($id_category=0, $table_name='', $id_item='', $id_value='', $type_code='') {
        global $DBi;

        $strWhere = "";
        if (intval($id_category) > 0)
            $strWhere .= " AND id_category = $id_category";
        if ($type_code)
            $strWhere .= " AND type_code = '$type_code'";

        if ($table_name != '' && $id_item != '')
            $strWhere .= " AND table_name = '$table_name' AND id_item = '$id_item' AND id_value = $id_value";

        $sql = "DELETE FROM sys_image WHERE 1=1 $strWhere";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function getList($id_category=0, $table_name='', $id_item='', $id_value='', $type_code='') {
        global $DBi;

        $strWhere = "";
        if (intval($id_category) > 0)
            $strWhere .= " AND id_category = $id_category";

        if ($table_name != '' && $id_item != '')
            $strWhere .= " AND table_name = '$table_name' AND id_item = '$id_item' AND id_value = $id_value";
        if ($type_code)
            $strWhere .= " AND type_code = '$type_code'";

        $sql = "SELECT * FROM sys_image WHERE active = 1 $strWhere ORDER BY thu_tu ";
        $db = $DBi->query($sql);
        $data = array();
        while ($row = $DBi->fetch_array($db))
            $data[] = $row;
        return $data;
    }

}

?>