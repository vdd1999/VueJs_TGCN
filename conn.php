<?php
	$servername = 'localhost';
	$username = 'root';
	$password = 'root';
	$db = 'tgcn';
	
	$conn = new mysqli($servername, $username, $password, $db);
	
	if ($conn->connect_error) {
		die($conn->connect_error);
	}
?>