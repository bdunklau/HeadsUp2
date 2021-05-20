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

// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md

require __DIR__ . '/vendor/twilio/sdk/src/Twilio/autoload.php';
use Twilio\Rest\Client;  // here:  C:\nginx-1.19.6\vendor\twilio\sdk\src

// Find your Account Sid and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
$sid = "SK3eb5e89e435978816173f7040134f259"; //getenv("YOURVOTECOUNTS_TWILIO_ACCOUNT_SID");
$token = "pYyaXBVyGmXBySBDoKpobC8IckdFUdoW";//getenv("YOURVOTECOUNTS_TWILIO_AUTH_KEY");
$twilio = new Client($sid, $token);

$service = $twilio->verify->v2->services
                              ->create("Delete Service");

print("Verify Service SID: " . $service->sid);
?>

<BR/>See this service here: <a href="https://www.twilio.com/console/verify/services/<?php echo $service->sid ?>" target=_blank>https://www.twilio.com/console/verify/services/<?php echo $service->sid ?></a> 
<BR/>Delete this service, go here <a href="https://www.twilio.com/console/verify/services/<?php echo $service->sid ?>/settings" target=_blank>https://www.twilio.com/console/verify/services/<?php echo $service->sid ?>/settings</a>
<br/>Delete with one click:  <a href="delete-verify-service.php?sid=<?php echo $service->sid ?>"><?php echo $service->sid ?></a>

<form method="post" action="send-token.php">
	<P><a href="https://www.twilio.com/docs/verify/api" target=_blank>https://www.twilio.com/docs/verify/api</></P>

	<P><input type="text" name="VERIFY_SERVICE_SID" value="<?php echo $service->sid ?>" size="40" placeholder="VERIFY_SERVICE_SID"></P>
	<P><input type="text" name="phoneNumber" value="+12146325613" placeholder="phone number"></P>
	<P><input type="submit" value=" OK " /></P>

</form>







</body>
</html>
