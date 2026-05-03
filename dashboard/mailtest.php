<?php

$host = "mailhog";
$port = 1025;

$from = "from@test.local";
$to = "test@test.com";

$fp = fsockopen($host, $port);

if (!$fp) {
    die("SMTP connection failed");
}

fwrite($fp, "HELO localhost\r\n");
fwrite($fp, "MAIL FROM:<$from>\r\n");
fwrite($fp, "RCPT TO:<$to>\r\n");
fwrite($fp, "DATA\r\n");

fwrite($fp, "Subject: MailHog Test\r\n");
fwrite($fp, "\r\n");
fwrite($fp, "Hello from PHP + MailHog!\r\n");
fwrite($fp, ".\r\n");
fwrite($fp, "QUIT\r\n");

fclose($fp);

echo "sent";
