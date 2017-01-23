<?php

require 'PHPMailer/PHPMailerAutoload.php';
/**
 * Send an email
 *
 * @access  public
 * @return  bool
 */
if (!function_exists('send_email')) {

    function send_email($recipient, $subject, $message) {
        $mail = new PHPMailer;
        $mail->isSMTP();                                      // Set mailer to use SMTP
      //  $mail->Host = 'smtpout.secureserver.net';  // Specify main and backup SMTP servers
       // $mail->SMTPAuth = true;                               // Enable SMTP authentication
       // $mail->SMTPSecure = '';                            // Enable TLS encryption, `ssl` also accepted
       // $mail->Port = 25;                                    // TCP port to connect to
        
        // for production
          $mail->Host = 'localhost';

        $mail->Username = 'info@carstenreise.com';                 // SMTP username
        $mail->Password = 'Abcd@1234';                           // SMTP password
        $mail->setFrom('info@carstenreise.com', 'Game Master');
        $mail->addAddress($recipient);     // Add a recipient
        $mail->addAddress('phucsystem@gmail.com');               // Name is optional
        $mail->isHTML(true);                                  // Set email format to HTML

        $mail->Subject = $subject;
        $mail->Body = $message;

        if (!$mail->send()) {
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo; exit;
        } else {
            //echo 'Message has been sent';
        }
    }

}

if (!function_exists('generateRandomString')) {

    // generate random string for password
    function generateRandomString($length = 6) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

}


