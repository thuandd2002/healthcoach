<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
//error_reporting(E_ERROR);

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class dbStatic {

    function getInWhere($inwhere) {

        global $DBi, $language;

        $sql = "SELECT * FROM static WHERE inwhere='$inwhere' $language";

        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db))
            $data[] = $rs;

        return $data;
    }

    function copyright() {

        global $DBi, $language;

        $sql = "SELECT * FROM static WHERE inwhere='copyright' $language";

        $db = $DBi->query($sql);

        $rs = $DBi->fetch_array($db);

        return $rs;
    }

    function page404() {

        global $DBi, $language;

        $sql = "SELECT * FROM static WHERE inwhere='page404' $language";

        $db = $DBi->query($sql);

        $rs = $DBi->fetch_array($db);

        return $rs;
    }

    function textFooter() {

        global $DBi, $language;

        $sql = "SELECT * FROM static WHERE inwhere='footer' $language";

        $db = $DBi->query($sql);

        while ($rs = $DBi->fetch_array($db)) {
            $data[] = $rs;
        }
        return $data;
    }




    function fanpage() {

        global $DBi;

        $sql = "SELECT * FROM static WHERE inwhere='fanpage'";

        $db = $DBi->query($sql);

        $rs = $DBi->fetch_array($db);

        return $rs;
    }


}

?>