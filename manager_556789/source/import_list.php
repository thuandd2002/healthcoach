<?php
//Develop Team: Binh Minh group
//binhminhgroup@gmail.com
error_reporting(E_ERROR);
defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
$tpl = new TemplatePower("skin/import_list.tpl");
$tpl->prepare();
$id = intval($_GET['id']);
$idc = intval($_GET['idc']);
$pid = intval($_GET['pid']);
$tpl->assignGlobal("tungay", date("d/m/Y", time() + $CONFIG["time_offset"]));
$module = new ExportImportList();
$module->_int();
$tpl->printToScreen();

class ExportImportList {
    public function _int() {
        global $tpl, $id, $pid, $imagedir, $dir_path;
        $this->showAddNew();
    }
    private function showAddNew() {
        global $DBi, $tpl, $DBi, $my, $_SERVER;
        $filelich = compile_post("filelich");
        $start = intval($_REQUEST['s']);
        if (strlen($filelich) > 1 && ($start > 0)) {
            $DBi->query("DELETE FROM baohanh");
            
            //$filelich = $_SERVER['DOCUMENT_ROOT'] . $filelich;
            
            $filelich = ".." . $filelich;
            $dta = $this->excel_to_array($filelich);
            $i = 0;
           /*
            echo "<pre>";
            var_dump($dta);
            echo "</pre>";
			*/
             
            foreach ($dta as $value) {
                $msp = trim($value["A"]);
                if (intval($msp) > 0)
                    $data = $this->getData($value);
                if ($data['imei'] != "") {
                    $lastid = $DBi->insertTableRow("baohanh", $data);
                    $i++;
                }
            }
            echo "<br/>Cập nhật thành công! <br/>Số bản ghi : $i. ";
            //unlink("../uploaded/excel/lichchieu.xlsx");
        }
    }
    function getData($value_arr) {
        global $DBi, $my, $mysqli;
        $data = array();
        $data['ngay_nhap'] = trim($value_arr["B"]);
        $data['ma_hang'] = trim($value_arr["C"]);
        $data['imei'] = trim($value_arr["D"]);
        $data['ngay_ban'] = trim($value_arr["E"]);
        $data['ngay_bh'] = trim($value_arr["F"]);
        $data['so_phieu_ban'] = trim($value_arr["I"]);
        $data['makh'] = trim($value_arr["J"]);
        $data['tenkh'] = trim($value_arr["K"]);
        $data['dia_chi'] = trim($value_arr["L"]);
        $data['dien_thoai'] = trim($value_arr["M"]);
        $data['mobile'] = trim($value_arr["N"]);
        $data['thong_tin_khac'] = '';
        $data['create_date'] = time();
        $data['id_user'] = $my['id'];
        return $data;
    }
    private function excel_to_array($inputFileName = '') {
        global $_SERVER;
        if (!file_exists($inputFileName) || !is_readable($inputFileName))
            return FALSE;
            
            
          require_once('./export_lib/PHPExcel/IOFactory.php');
          $objReader = PHPExcel_IOFactory::createReader('Excel2007');
          $inputFileType = 'Excel2007';
			
          $objReader = PHPExcel_IOFactory::createReader($inputFileType);
          $objReader->setLoadSheetsOnly($sheetname);
          $objPHPExcel = $objReader->load($inputFileName);
			
          $sheetData = $objPHPExcel->getActiveSheet(0)->toArray(null, true, true, true);
		  
		  
		echo $inputFileName;
        return $sheetData;
    }
    public function getProduct($selectedid) {
        global $DBi, $languageWhere;
        $sql = "SELECT * FROM product WHERE active = 1 AND id_product = $selectedid ";
        $db = $DBi->query($sql);
        if ($rs = $DBi->fetch_array($db))
            return $rs["name"];
        else
            return "";
    }
}
?>