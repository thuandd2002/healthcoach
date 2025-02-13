<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("templates/info_lichsu.htm");

$tpl->prepare();
langsite();
$id = intval($_GET['id']);

$idc = intval($_GET['idc']);
$tpl->assignGlobal("pathpage", '<div class="crumb"><a href="/' . $lang_dir . '"><i class="fa fa-home"></i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div>');

$tpl->assignGlobal("dir_path", $dir_path);

$tpl->assignGlobal("slideshow", slidechild());
$tpl->assignGlobal("menutab", menutabGT($root_idc));

$info = new InfoLichSu();

$info->_int();

$tpl->printToScreen();

class InfoLichSu {

    public function _int() {
        global $idc, $id, $rs_cat, $tpl, $cache_image_path, $root_idc;

        if (intval($id) > 0) {
            $this->itemDetail($id);
        } else {
            $this->itemList($idc);
        }
    }

    private function itemList($idc) {
        global $DBi, $tpl, $lang, $dir_lang, $dir_path, $cache_image_path;

        $tpl->newBlock("itemList");
        $sql = "SELECT * FROM info_lichsu WHERE active=1 AND id_category = $idc ORDER BY thu_tu DESC, id_info DESC";
        $db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("infoItem");

            $tpl->assign(array(
                id_info => $rs['id_info'],
                name => $rs['name'],
                intro => $rs['intro'],
                content => $rs['content']
            ));

            if ($rs['image'])
                $tpl->assign("image", '<img  src="' . $rs['image'] . '" alt="' . $rs['name'] . '" width="100%"/>');
            
                //$tpl->assign("image", '<img  src="' . $cache_image_path . cropimage(800, 600, $dir_path . '/' . $rs['image'], false) . '" alt="' . $rs['name'] . '" width="100%"/>');
        }
    }

    private function itemDetail($id) {
        global $DBi, $tpl, $lang, $dir_lang, $dir_path, $cache_image_path;

        $sql = "SELECT * FROM info_lichsu WHERE active=1 AND id_info = $id";

        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db)) {

            $tpl->newBlock("itemDetail");
            $tpl->assign(array(
                name => $rs['name'],
                title => $rs['title'],
                intro => $rs['intro'],
                content => $rs['content']
            ));
        }
    }

    

}

?>