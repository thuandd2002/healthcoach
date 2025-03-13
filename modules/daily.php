<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

$template_name = $cateinfo['template_name'];
if ($template_name)
    $tpl = new TemplatePower("templates/$template_name.htm");
else
    $tpl = new TemplatePower("templates/daily.htm");


$tpl->prepare();
langsite();
error_reporting(E_ERROR);
$id = intval($_GET['id']);

$idc = intval($_GET['idc']);


$tpl->assignGlobal("dir_path", $dir_path);


$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '"><i class="fa fa-home"></i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');

$tpl->assignGlobal("slideshow", slidechild());

$tpl->assignGlobal("catname", $rs_cat['name']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);

$tpl->assignGlobal("menutab", menutab($root_idc));

if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');



$daily = new Daily();
$daily->_int();
$tpl->printToScreen();

class Daily {

    public function _int() {
        global $idc, $tpl;
        $id_pro = intval($_GET['i']);
        $this->lstDaily($id_pro);
    }

    function lstDaily($id_pro) {
        global $idc, $tpl, $DBi, $langLabel;


        $prv = intval($_GET['prv']);
        $dst = intval($_GET['dst']);
        $mapkw = clean_value($_GET['mapkw']);

        $tpl->assignGlobal("listProvince", $this->listProvince($prv));
        $tpl->assignGlobal("mapkw", $mapkw);
        $tpl->assignGlobal("dst", $dst);

        $strWhere = " ";
        if ($prv > 0)
            $strWhere .= " AND provinceid = $prv ";
        if ($dst > 0)
            $strWhere .= " AND districtid = $dst ";
        if ($mapkw != "")
            $strWhere .= " AND (name LIKE '%$mapkw%' OR address LIKE '%$mapkw%' ) ";

        $sql = "SELECT * FROM daily  WHERE active=1 AND (id_category IN(" . Category::getParentId($idc) . ")) $strWhere ORDER BY thu_tu DESC, name DESC";

        $db = $DBi->query($sql);

        $tpl->assign("record_count", $DBi->num_rows($db));
        
        $tpl->newBlock("itemList");
        
        while ($rs = $DBi->fetch_array($db)) {
            $tpl->newBlock("lstDaily");
            $tpl->assign("dailyname", $rs['name']);
            $tpl->assign("address", $rs['address']);

            $tpl->assign("phone", $rs['phone']);
            $tpl->assign("email", $rs['email']);
            
            $tpl->assign("fax", $rs['fax']);
            
            $tpl->assign("linkmap", $rs['linkmap']);

            $tpl->assign("latitude", $rs['latitude']);
            $tpl->assign("longitude", $rs['longitude']);
        }
    }

    public function listProvince($seletedid = 0) {
        global $DBi;

        $result_str = '';
        $seletedid = intval($seletedid);

        $sql = "SELECT * FROM vn_province ORDER BY provinceid";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {
            if ($seletedid == $rs['provinceid'])
                $result_str .= '<option value="' . $rs['provinceid'] . '" selected>' . $rs['name'] . '</option>';
            else
                $result_str .= '<option value="' . $rs['provinceid'] . '">' . $rs['name'] . '</option>';
        }
        return $result_str;
    }

}

?>