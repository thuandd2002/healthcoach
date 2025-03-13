<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("templates/faq.htm");
$tpl->prepare();
langsite();
$idc = intval($_GET['idc']);
$tpl->assignGlobal("dir_path", $dir_path);

$tpl->assignGlobal("slideshow", slidechild());

$tpl->assignGlobal("pathpage", '<div class="crumb"><div class="grid"><a href="/' . $lang_dir . '"><i class="fa fa-home"></i></a> <i class="fa fa-angle-right"></i> ' . Get_Main_Cat_Name_path($idc) . '</div><div class="c5"></div></div>');

$tpl->assignGlobal("menutab", menutab($root_idc));

$tpl->assignGlobal("catname", $rs_cat['name']);
$tpl->assignGlobal("catlink", $dir_path . '/' . $rs_cat['url']);

if (strlen($rs_cat['intro']) > 7)
    $tpl->assignGlobal("catintro", '<div style="padding:5px 0px">' . $rs_cat['intro'] . '</div>');
if (strlen($rs_cat['content']) > 7)
    $tpl->assignGlobal("catcontent", '<div style="padding:5px 0px">' . $rs_cat['content'] . '</div>');



$faq = new clsfaq;
$faq->faq("listanswer");

$tpl->printToScreen();

class clsfaq {
    public function faq($block) {
        global $DBi, $tpl, $idc, $lang;
        $idc = intval($idc);
        $languageWhere = '';
        if ($lang != '')
            $languageWhere = "AND lang = '$lang'";
        $sql = "SELECT * FROM faq WHERE active=1  $languageWhere ORDER BY thu_tu DESC, name ASC";
        $db = paging::pagingFonten($_GET['p'], $dir_path . "/" . url_process::getUrlCategory($idc), $sql, 8, 30);
        //$db = $DBi->query($sql);
        while ($rs = $DBi->fetch_array($db['db'])) {
            $tpl->newBlock($block);
            $tpl->assign("name", $rs['name']);
            $tpl->assign("content", $rs['content']);
            $tpl->assign("id", $rs['id_faq']);
            $tpl->assign("anchor", clean_url($rs['name']));
        }
        $tpl->assign("pages", $db['pages']);
    }


}

?>