<?php
	$servername = 'localhost';
	$username = 'root';
	$password = 'root';
	$db = 'tgcn';
	$conn = new mysqli($servername, $username, $password, $db);
	if ($conn->connect_error) {
		echo "KO DC";
	}
	header('Content-Type: application/json; charset=utf-8');

	//GET LAPTOP
	$sql = "SELECT * FROM product where Category_Code ='Laptop'";
	$result = $conn->query($sql);
	$laptop = array();
	while ($row = $result->fetch_assoc()) {
		array_push($laptop, $row);
	}

	$sql1 = "SELECT * FROM product where Category_Code ='Mobile'";
	$result1 = $conn->query($sql1);
	$mobile = array();

	while ($row = $result1->fetch_assoc()) {
		array_push($mobile, $row);
	}
	$sql2 = "SELECT * FROM product where Highlights=1";
	$result2 = $conn->query($sql2);
	$trend = array();

	while ($row = $result2->fetch_assoc()) {
		array_push($trend, $row);
	}

	$sql3 = "SELECT * FROM product";
	$result3 = $conn->query($sql3);
	$all = array();
	while ($row = $result3->fetch_assoc()) {
		array_push($all, $row);
	}
	//echo json_encode(array('all'=>$all));

	echo json_encode(array('laptop' => $laptop,'mobile' => $mobile,'trending'=>$trend,'all'=>$all));
	// $fLap = fopen('product.json', 'w');
	// fwrite($fLap, json_encode(array('laptop' => $laptop,'mobile' => $mobile,'trending'=>$trend)));
	// fclose($fLap);
?>