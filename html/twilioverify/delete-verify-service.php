<?php
    //include_once '../my-includes/dbh.inc.php';
?>

<!DOCTYPE html>
<html>
<head>
<title>Twilio Verify example</title>
<style>
    body {
        width: 100%;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>



<?php
$verifyServiceSid = $_GET['sid'];

require __DIR__ . '/vendor/twilio/sdk/src/Twilio/autoload.php';
use Twilio\Rest\Client;  // here:  C:\nginx-1.19.6\vendor\twilio\sdk\src

// Find your Account Sid and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
$sid = "SK3eb5e89e435978816173f7040134f259"; //getenv("YOURVOTECOUNTS_TWILIO_ACCOUNT_SID");
$token = "pYyaXBVyGmXBySBDoKpobC8IckdFUdoW";//getenv("YOURVOTECOUNTS_TWILIO_AUTH_KEY");
$twilio = new Client($sid, $token);

$twilio->verify->v2->services($verifyServiceSid)
                   ->delete();

?>

Deleted: <?php echo $verifyServiceSid ?>


</body>
</html>
