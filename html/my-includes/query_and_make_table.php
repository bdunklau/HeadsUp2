

<?php
	include '../my-includes/dbh.inc.php';
 ?>

 
 
<?php

function run_query2($conn, $sql) {
	
    $result = mysqli_query($conn, $sql);
	print "<hr/>" . $sql . "<br/>";
    print "<table>";
	print "<tr>";
	
	while ($fieldinfo = mysqli_fetch_field($result)) {
		print "<th>";
		print $fieldinfo -> name;
		print "</th>";
	}
	
	
	print "</tr>";
	while ($row = mysqli_fetch_assoc($result)) {
		print "<tr>";
		 foreach($row as $key => $value) {
			 //print "<td>$key = $value </td>";
			 print "<td>$value </td>";
		 }
		print "</tr>";
	}
    print "</table>";
	mysqli_free_result($result);
}

 ?>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 