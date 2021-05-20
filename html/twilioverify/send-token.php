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
$verifyServiceSid = $_POST['VERIFY_SERVICE_SID'];
$phoneNumber = $_POST['phoneNumber'];

require __DIR__ . '/vendor/twilio/sdk/src/Twilio/autoload.php';
use Twilio\Rest\Client;  // here:  C:\nginx-1.19.6\vendor\twilio\sdk\src

// Find your Account Sid and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
$sid = "SK3eb5e89e435978816173f7040134f259"; //getenv("YOURVOTECOUNTS_TWILIO_ACCOUNT_SID");
$token = "pYyaXBVyGmXBySBDoKpobC8IckdFUdoW";//getenv("YOURVOTECOUNTS_TWILIO_AUTH_KEY");
$twilio = new Client($sid, $token);

$verification = $twilio->verify->v2->services($verifyServiceSid)
                                   ->verifications
                                   ->create($phoneNumber, "sms");

?>

<P>VERIFY_SERVICE_SID = <?php echo  $verifyServiceSid?></P>
<P>phoneNumber = <?php echo  $phoneNumber?></P>
<P>verification status = <?php echo  $verification->status ?></P>


<form method="post" action="check-token.php">
	
	<P><input type="text" name="VERIFY_SERVICE_SID" value="<?php echo $verifyServiceSid ?>" size="40" placeholder="VERIFY_SERVICE_SID"></P>
	<P><input type="text" name="phoneNumber" value="<?php echo  $phoneNumber?>" placeholder="phone number"></P>
	<P><input type="text" name="code" placeholder="code"></P>
	<P><input type="submit" value=" OK " /></P>
</form>



</body>
</html>
