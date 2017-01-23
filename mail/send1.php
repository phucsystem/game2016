<?php

$mail = new PHPMailer();
$mail->IsSMTP();  //telling the class to use SMTP
$mail->isHTML(true);
$mail->Host         = "smtpout.secureserver.net"; //also tried "relay-hosting.secureserver.net"
$mail->WordWrap     = 50;
$mail->SMTPAuth     = true;
$mail->SMTPSecure   = "ssl";
$mail->Port         = 465;
$mail->Username     = "info@carstenreise.com";
$mail->Password     = "Abcd@1234";
$mail->Subject      = "Test Email";
$mail->SMTPDebug = 1;

?>  <!-- end of php tag-->