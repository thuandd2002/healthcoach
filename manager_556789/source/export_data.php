<?php


error_reporting(E_ERROR);

require_once('./export_lib/PHPExcel.php');



$objPHPExcel = new PHPExcel();
$objPHPExcel->getProperties()->setCreator("Minh Nguyen")
        ->setLastModifiedBy("Minh Nguyen")
        ->setTitle("Danh sach")
        ->setSubject("Danh sach san pham");

$objPHPExcel->setActiveSheetIndex(0)
    ->setCellValue("A1", "STT")
    ->setCellValue("B1", "Tên sản phẩm")
    ->setCellValue("C1", "Ảnh đại diện")
    ->setCellValue("D1", "Giá bán")
    ->setCellValue("E1", "Mô tả")
    ->setCellValue("F1", "Url")
	
	;


$objPHPExcel->getActiveSheet()->getStyle('A1:M1')->getFont()->setBold(true);
/*
$ngayxuat = $_REQUEST["ngay"];
if ($ngayxuat == "") $ngayxuat = date("d/m/Y", time() + $CONFIG["time_offset"]) ;
$fromdate = string_to_microtime($ngayxuat);
$todate = string_to_microtime($ngayxuat . " 23:59:59");
$sql = "SELECT * FROM exam_result WHERE createdate >= $fromdate AND createdate <= $todate ORDER BY id";
*/

$sql = "SELECT * FROM product WHERE 1=1 ORDER BY id_product DESC ";



$result= $mysqli->query($sql);
$i=1;
while ($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
    //$doituong = $mysqli->query("SELECT CodeName FROM phim WHERE id_phim = $row[id_phim]")->fetch_object()->CodeName; 

    //$createdate = date("d/m/Y H:s",$row[createdate]);

	$price = 0;
	if (intval($row['pricekm']) > 0) {
		$price = $row['pricekm'];
	} else {
		if (intval($row['price']) > 0) 
			$price = $row['price'];
		else 
			$price = "Liên hệ";
	}	
	
	$intro = strip_tags($row[intro]);
	
	$url = $site_address . "/" . url_process::getUrlCategory($row['id_category']) . $row['url']	;
	
    
    $i++;
    $objPHPExcel->setActiveSheetIndex(0)
        
        ->setCellValue("A$i", $i )
        ->setCellValue("B$i", $row[name])
        ->setCellValue("C$i", $row[image])
        ->setCellValue("D$i", $price)
        ->setCellValue("E$i", $intro)
        ->setCellValue("F$i", $url)

        ;
        
}
$result->close();

$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(8);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(15);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(30);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(10);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(25);

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);



$file_name = "danhsach-". date("d-m-Y", $fromdate );
//$fileExcel ="/uploaded/files/$file_name.xlsx";

$fileExcel ="/uploaded/files/ds.xlsx";
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');


$objWriter->save($_SERVER["DOCUMENT_ROOT"]. $fileExcel);



echo date('H:i:s') , " - File created !!, please  <a href='$fileExcel'> click here  </a> to download...";


?>