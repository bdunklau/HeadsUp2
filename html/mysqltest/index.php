<?php
    include_once '../my-includes/dbh.inc.php';
	include_once '../my-includes/query_and_make_table.php';
?>

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 100%;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
 
 YEEHAW 2222222222222222222
		
<?php
    $sql = "select f.*, u1.displayName as name1, u2.displayName as name2 from headsup.friend f, headsup.user u1, headsup.user u2 where f.uid1 = u1.pk and f.uid2 = u2.pk;";
	run_query2($conn, $sql);
 ?>
 
		
<?php
    $sql = "select * from invitation;";
	run_query2($conn, $sql);
 ?>
 
		
<?php
    $sql = "select * from headsup.keys;";
	run_query2($conn, $sql);
 ?>
 
		
<?php
    $sql = "select * from role;";
	run_query2($conn, $sql);
 ?>
 
		
<?php
    $sql = "select * from room;";
	run_query2($conn, $sql);
 ?>
 
		
<?php
    $sql = "select * from settings;";
	run_query2($conn, $sql);
 ?>

	
		
<?php
    $sql = "select * from user;";
	run_query2($conn, $sql);
 ?>
	
		
<?php
    $sql = "select ur.*, r.role_name, u.displayName from user_role ur, user u, role r where ur.rid = r.pk and ur.uid = u.pk;";
	run_query2($conn, $sql);
 ?>
		

</body>
</html>
