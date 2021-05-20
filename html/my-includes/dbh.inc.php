<?php

$dbServername = "localhost";
$dbUsername = "root";
$dbPassword = "Jett91911";
$dbName = "headsup";

$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}	
?>
