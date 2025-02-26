<?php

//Develop Team: Binh Minh group
//binhminhgroup@gmail.com

defined('_VALID_NVB') or die('Direct Access to this location is not allowed.');
/*
  require_once "recaptchalib.php";
 */
if ($_POST['code'] == 'save') {

    /*
      $secret = "6LdBXrsUAAAAAKC_jH98W4hFxwf-km8RaCkC5b_M";
      $response = null;
      $reCaptcha = new ReCaptcha($secret);

      if ($_POST["g-recaptcha-response"]) {
      $response = $reCaptcha->verifyResponse($_SERVER["REMOTE_ADDR"],$_POST["g-recaptcha-response"]);
      }

      if ($response != null && $response->success) {
     */

    //if (strtolower($_SESSION['imagesercurity']) == strtolower(compile_post('sercurity'))) {

    if (1 == 1) {

        $a = array();
        $a['fullname'] = compile_post('yourname');
        $a['email'] = compile_post('email');
        $a['phone'] = compile_post('phone');
        $a['address'] = compile_post('address');
        $a['service'] = compile_post('service');
        $a['other_request'] = compile_post('other_request');
        $a['createdate'] = time() + $CONFIG['time_offset'];

        $subject = compile_post('subject');

        if (strlen($subject) > 5)
            $title_contact = $subject . ": ";
        else
            $title_contact = "Thông tin liên hệ: ";

        $formname = compile_post('formname');


        $message = '
<table width="100%" border="1" cellspacing="0" cellpadding="0">
     <tr>
               <td height="30" colspan="2" align="left" valign="middle"><strong> ' . $title_contact . ' </strong></td>
    </tr>
    ' . $pro_message . '
             <tr>
               <td height="30" align="left" style="width:200px;" valign="middle">Họ tên:</td>
               <td height="30" align="left" valign="middle"><strong>' . $a['fullname'] . '</strong></td>
      </tr>
        <tr>
          <td height="30" align="left" valign="middle">E-mail:</td>
          <td height="30" align="left" valign="middle"><strong>' . $a['email'] . '</strong></td>
      </tr>
      
    <tr>
          <td height="30" align="left" valign="middle">Điện thoại:</td>
          <td height="30" align="left" valign="middle"><strong>' . $a['phone'] . '</strong></td>
      </tr>
        <tr>
          <td height="30" align="left" valign="middle"> Địa chỉ:</td>
          <td height="30" align="left" valign="middle"><strong>' . $a['address'] . '</strong></td>
      </tr>
      <tr>
               <td height="30" align="left" valign="middle"><strong>Nội dung liên hệ</strong>: </td>
               <td height="30" align="left" valign="middle"><i>' . $a['other_request'] . " - " . $a['subject'] . '</i></td>
      </tr>
</table>';
        $c = array();
        $c['name'] = $title_contact . $a['fullname'];
        $c['content'] = $message;
        $c['email'] = $a['email'];
        $c['phone'] = $a['phone'];

        $c['note'] = json_encode($a);

        $c['createdate'] = $a['createdate'];

        $lastid = $DBi->insertTableRow("contact", $c);
        if ($lastid > 0) {
            echo "1";
            $subject = $title_contact . $a['fullname'] . " - " . date('d/m/Y H:i', $a['createdate']);
            try {
                sendmail($CONFIG['site_email'], $subject, $message, $site_address);
            } catch (exception $e) {
            }
        }
    } else {
        echo "-1";
    }
}
?>