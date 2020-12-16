<?php

	require_once("conn.php");
	$product_array = array();
	if (isset(($_COOKIE['products']))) {
		$products = $_COOKIE['products'];
	    $productIds = explode(",", $products);
	    for ($i=0; $i<count($productIds); $i++) {
	        $sql = "SELECT * FROM product WHERE Id = " . $productIds[$i];
	        $result = $conn->query($sql);
	        $row = $result->fetch_assoc();
	        array_push($product_array, $row);
    	}
    	echo json_encode(array('products' => $product_array));
	}
	else {

		// $product_array = [];
    	echo json_encode(array('code' => 1));
	}

?>