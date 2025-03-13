<?php

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');

class search_content {

    public function getById($id) {
        global $DBi;
        $id = intval($id);
        $sql = "SELECT * FROM search_content WHERE id_search ='" . $id . "'";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function getSearch($id_item, $table_name, $id_item_value) {
        global $DBi;
        $sql = "SELECT * FROM search_content WHERE id_item = '$id_item' AND id_item_value = $id_item_value  AND table_name = '$table_name'";
        $db = $DBi->query($sql);
        $rs = $DBi->fetch_array($db);
        return $rs;
    }

    public function getListItem($keywords, $scopelevel = 0, $id_categoty = 0) {
        global $DBi, $language, $uri;
        /*
          $scopelevel = 0 title, 1 title and intro, 2 all
		  ALTER TABLE search_content ADD FULLTEXT(name_unsign)
         */
        $keywords = $this->RemoveSign($keywords);

        if (intval($id_categoty) > 0)
            $strCat = " AND id_category IN (" . Category::getParentId($id_categoty) . " ) ";

        $sql = "SELECT * FROM search_content WHERE (name_unsign like '%$keywords%' OR tags like '%$keywords%') $language $strCat ORDER BY id_search DESC LIMIT 5";
		//echo $sql;

        $id_not_in = '0';
        $data = array();
        $db = $DBi->query($sql);
        while ($row = $DBi->fetch_array($db)) {
            $data[] = $row;
            $id_not_in .= "," . $row['id_search'];
        }
		
		
		$keywords_arr = explode(' ',$keywords);
		foreach($keywords_arr as $keyword_item)
			$keyword_fulltext .= "+$keyword_item ";
	
		$keyword_fulltext = trim($keyword_fulltext);
		if (strlen($keyword_fulltext)> 2){
			$sql1 = "SELECT *,(MATCH (name_unsign) AGAINST ('$keyword_fulltext') ) as score  FROM search_content WHERE id_search NOT IN ($id_not_in) $language AND MATCH (name_unsign,tags) AGAINST ('$keyword_fulltext' IN BOOLEAN MODE) ORDER BY score DESC LIMIT 25";
			//echo $sql1;
			$db1 = $DBi->query($sql1);
			while ($row1 = $DBi->fetch_array($db1))
				$data[] = $row1;		
		}

		
		/*
        if ($scopelevel == 1) {
            $sql1 = "SELECT * FROM search_content WHERE id_search NOT IN ($id_not_in) AND intro_unsign like '%$keywords%' $language ORDER BY id_search DESC";
            $db1 = $DBi->query($sql1);
            while ($row1 = $DBi->fetch_array($db1))
                $data[] = $row1;
        }

        if ($scopelevel > 1) {
            $sql2 = "SELECT * FROM search_content WHERE id_search NOT IN ($id_not_in) content_unsign like '%$keywords%' $language ORDER BY id_search DESC";
            $db2 = $DBi->query($sql2);
            while ($row2 = $DBi->fetch_array($db2))
                $data[] = $row2;
        }
		*/
		
        $showpage = intval($_GET['showpage']);
        if ($showpage <= 0)
            $showpage = 1;
        $search_uri = explode("&", $uri);
        $result = $this->pagingSearchResult($data, $showpage, $search_uri[0], 8, 20);

        return $result;
    }

    public function insertSearch($data, $id_category, $id_item, $table_name, $id_item_value) {
        global $DBi, $lang;
        $ds = array();

        if ($data) {
            $ds['name'] = $data['name'];
            $ds['intro'] = $data['intro'];
            $ds['content'] = $data['content'];
            $ds['url'] = $data['url'];
            $ds['image'] = $data['image'];
            $ds['tags'] = strtolower($this->RemoveSign($data['tags']));
            $ds['ngay_dang'] = time();
            $ds['name_unsign'] = strtolower($this->RemoveSign($data['name']));

            $intro_decode = html_entity_decode(strip_tags($data['intro']), ENT_COMPAT, 'UTF-8');
            $ds['intro_unsign'] = strtolower($this->RemoveSign($intro_decode));

            $content_decode = html_entity_decode(strip_tags($data['content']), ENT_COMPAT, 'UTF-8');
            $ds['content_unsign'] = strtolower($this->RemoveSign($content_decode));

			$ds['lang'] = $data['lang'];

            $ds['id_category'] = $id_category;
            $ds['id_item'] = $id_item;
            $ds['id_item_value'] = $id_item_value;
            $ds['table_name'] = $table_name;



            //$b = $DBi->compile_db_insert_string($ds);
            //$sql = "INSERT INTO search_content (" .$b['FIELD_NAMES'].") VALUES (".$b['FIELD_VALUES'].")"; 
            try {
                $lastid = $DBi->insertTableRow("search_content", $ds);
                //$DBi->query($sql);
                return 1;
            } catch (Exception $ex) {
                return $ex;
            }
        }
        return 0;
    }

    public function updateSearch($data, $id_category, $id_item, $table_name, $id_item_value) {
        global $DBi, $lang;
        $ds = array();

        if ($data) {
            $ds['name'] = $data['name'];
            $ds['intro'] = $data['intro'];
            $ds['content'] = $data['content'];
            $ds['url'] = $data['url'];
            $ds['image'] = $data['image'];
            $ds['tags'] = strtolower($this->RemoveSign($data['tags']));
            $ds['ngay_dang'] = time();
            $ds['name_unsign'] = strtolower($this->RemoveSign($data['name']));

            $intro_decode = html_entity_decode(strip_tags($data['intro']), ENT_COMPAT, 'UTF-8');
            $ds['intro_unsign'] = strtolower($this->RemoveSign($intro_decode));

            $content_decode = html_entity_decode(strip_tags($data['content']), ENT_COMPAT, 'UTF-8');
            $ds['content_unsign'] = strtolower($this->RemoveSign($content_decode));

            if ($lang)
                $ds['lang'] = $lang;
            else
                $ds['lang'] = '';

            $ds['id_category'] = $id_category;
            $ds['id_item'] = $id_item;
            $ds['id_item_value'] = $id_item_value;
            $ds['table_name'] = $table_name;

            //$b = $DBi->compile_db_update_string($ds);
            //$sql = "UPDATE search_content SET ".$b." WHERE id_item = '$id_item' AND id_item_value = $id_item_value  AND table_name = '$table_name'"; 
            $keyfields = array("id_item", "id_item_value", "table_name");
            $keyvalues = array("$id_item", "$id_item_value", "$table_name");
            try {
                $DBi->updateTableRow("search_content", $ds, $keyfields, $keyvalues);
                //$DBi->query($sql);
                return 1;
            } catch (Exception $ex) {
                return $ex;
            }
        }

        return 0;
    }

    public function deleteSearch($id_item, $table_name, $id_item_value) {
        global $DBi, $lang;

        $sql = "DELETE FROM search_content WHERE id_item = '$id_item' AND id_item_value = $id_item_value  AND table_name = '$table_name'";
        try {
            $DBi->query($sql);
            return 1;
        } catch (Exception $ex) {
            return $ex;
        }
        return 0;
    }

    function RemoveSignNew($str) {

        $unicode = array(
            'a' => 'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
            'd' => 'đ',
            'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ|ệ',
            'i' => 'í|ì|ỉ|ĩ|ị|ị',
            'o' => 'ó|ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
            'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
            'y' => 'ý|ỳ|ỷ|ỹ|ỵ',
            'A' => 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
            'D' => 'Đ',
            'E' => 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
            'I' => 'Í|Ì|Ỉ|Ĩ|Ị',
            'O' => 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
            'U' => 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
            'Y' => 'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
        );

        foreach ($unicode as $nonUnicode => $uni) {

            $str = preg_replace("/($uni)/i", $nonUnicode, $str);
        }
        $str = str_replace(' ', '_', $str);

        return $str;
    }

    public function RemoveSign($str) {
        $coDau = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă", "ằ", "ắ"
            , "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề", "ế", "ệ", "ể", "ễ", "ì", "í", "ị", "ỉ", "ĩ",
            "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ"
            , "ờ", "ớ", "ợ", "ở", "ỡ",
            "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ",
            "ỳ", "ý", "ỵ", "ỷ", "ỹ",
            "đ",
            "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă"
            , "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ",
            "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ",
            "Ì", "Í", "Ị", "Ỉ", "Ĩ",
            "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ"
            , "Ờ", "Ớ", "Ợ", "Ở", "Ỡ",
            "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ",
            "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ",
            "Đ", "ê", "ù", "à");
        $khongDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"
            , "a", "a", "a", "a", "a", "a",
            "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e",
            "i", "i", "i", "i", "i",
            "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o"
            , "o", "o", "o", "o", "o",
            "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u",
            "y", "y", "y", "y", "y",
            "d",
            "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A"
            , "A", "A", "A", "A", "A",
            "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
            "I", "I", "I", "I", "I",
            "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"
            , "O", "O", "O", "O", "O",
            "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U",
            "Y", "Y", "Y", "Y", "Y",
            "D", "e", "u", "a");
        return str_replace($coDau, $khongDau, $str);
    }

    public function pagingSearchResult($data, $p, $url, $maxpage, $maxitem) {

        global $DBi, $tpl;
        $trang = "";
        $p = isset($p) ? intval($p) : 1;

        $cac_trang = array();
        $total = count($data);
        $total = ceil($total / $maxitem);

        if ($p > $maxpage) {
            $num_page = ceil($p / $maxpage);
            $showpage = ($num_page - 1) * $maxpage;
            $end = $showpage + $maxpage;
            $showpage++;
        } else {
            $thispage = 1;
            $showpage = 1;
            $end = $maxpage;
        }

        $startpage = $showpage;
        for ($showpage; $showpage < $end + 1; $showpage++) {
            if ($showpage <= $total) {
                if ($p == $showpage) {
                    $list_page.="<a class='clicked  pagination-item__clicked page'>&nbsp;" . $showpage . "&nbsp;</a>";
                } else {
                    if ($showpage <= 1) {
                        $list_page.="<a href='" . $url . "' class='page pagination-item' >&nbsp;" . $showpage . "&nbsp;</a>";
                    } else {
                        $list_page.="<a href='" . $url . "&showpage=" . $showpage . "' class='page pagination-item' >&nbsp;" . $showpage . "&nbsp;</a>";
                    }
                }
            }
        }

        $back = $startpage - 1;
        if ($back <= 1) {
            $back = 1;
        }
        if ($p <= 1) {
            $disabled_back = "disabled";
        }
        $list_page1 = "<a href='" . $url . "&showpage=" . "1' class='page  $disabled_back' ><strong> <i class='fa fa-angle-double-left pagination-item-icon'></i>  </strong></a>";
        $list_page1.="<a href='$url" . "&showpage=" . $back . "' class='page $disabled_back' ><strong> <i class='fa fa-angle-left pagination-item-icon'></i> </strong></a>";
        $next = $showpage;

        if ($next >= $total) {
            $next = $total;
        }
        if ($p >= $total) {
            $disabled_next = "disabled";
        }

        $list_page2.=" <a href='" . $url . "&showpage=" . $next . "'  class='page $disabled_next'><strong> <i class='fa fa-angle-right pagination-item-icon'></i> </strong></a>";
        $list_page2.=" <a href='" . $url . "&showpage=" . $total . "'  class='page $disabled_next'><strong>  <i class='fa fa-angle-double-right pagination-item-icon'></i> </strong></a>";


        $list_page = $list_page1 . $list_page . $list_page2;
        if ($total > 1) {
            if ($list_page) {
                $cac_trang['pages'] = "" . $trang . $list_page;
            }
        }
        $cac_trang['p'] = $p;
        $cac_trang['total'] = $total;
        $cac_trang['pre'] = $list_page1;
        $cac_trang['next'] = $list_page2;
        $a = $maxitem * $p - $maxitem;

        $data_out = array_slice($data, $a, $maxitem);

        $cac_trang['data'] = $data_out;

        return $cac_trang;
    }

}

?>