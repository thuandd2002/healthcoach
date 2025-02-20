<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower($CONFIG['template_dir'] . "/info_search.htm");
$tpl->prepare();

langsite();


class search_item {
    public function getListItem($keywords) {
        global $DBi, $language, $uri;

        $keywords = RemoveSign($keywords);
        $sql = "SELECT * FROM search_content WHERE (name_unsign like '%$keywords%' OR tags like '%$keywords%') $language $strCat ORDER BY id_search DESC LIMIT 10";
		
        $id_not_in = '0';
        $data = array();
        $db = $DBi->query($sql);
        while ($row = $DBi->fetch_array($db)) {
            $data[] = $row;
            $id_not_in .= "," . $row['id_search'];
        }

        $keywords_arr = explode(' ', $keywords);
        foreach ($keywords_arr as $keyword_item)
            $keyword_fulltext .= "+$keyword_item ";

        $keyword_fulltext = trim($keyword_fulltext);
        if (strlen($keyword_fulltext) > 2) {
            $sql1 = "SELECT *,(MATCH (name_unsign) AGAINST ('$keyword_fulltext') ) as score  FROM search_content WHERE id_search NOT IN ($id_not_in) $language AND MATCH (name_unsign,tags) AGAINST ('$keyword_fulltext' IN BOOLEAN MODE) ORDER BY score DESC LIMIT 25";
            //echo $sql1;
            $db1 = $DBi->query($sql1);
            while ($row1 = $DBi->fetch_array($db1))
                $data[] = $row1;
        }

        return $data;
    }
}



$keywords = clean_value($_GET['qr']);
$tpl->assignGlobal("keywords", $_GET['qr']);
$keywords = trim(strtolower( RemoveSign($keywords)) );
$tpl->assignGlobal("h_keywords", $keywords);


$objSearch = new search_item();


if (strlen($keywords) < 3)
    $tpl->newBlock("short_keyword");
else
    $db = $objSearch->getListItem($keywords);

if (count($db) <= 0)
    $tpl->newBlock("no_result");

foreach ($db as $rs) {
    if (intval($rs['id_search'])>0){
        
        $tpl->newBlock("item_list");
        $tpl->assign("name", $rs['name']);
        $tpl->assign("intro", strstrim(strip_tags($rs['intro']), 100));
        $tpl->assign("link_detail", $dir_path . '/' . url_process::getUrlCategory($rs['id_category']).$rs['url']);
        if ($rs['image'])
            $tpl->assign("image", '<div style="border: solid 1px #EEE;"><img width="100%" src="' . $cache_image_path . resizeimage1(250, 250, $dir_path . '/' . $rs['image']) . '" alt="' . $rs['name'] . '" /></div>');

        $tpl->assign("cat_path", Get_Main_Cat_Name_path($rs['id_category']));    
    }
}

$tpl->assignGlobal("pages", $db['pages']);

if ($keywords != '') {
    $tpl->newBlock("keywords");
    $tpl->newBlock("highlight_list");
}


$tpl->printToScreen();
?>