<?php
	require_once('conn.php');
	header('Content-Type: application/json; charset=utf-8');
	if(isset($_POST['id'])) {
		$id =$_POST['id'];
		$conn = open_db();
		$sql = "DELETE FROM product WHERE id = $id";
		if ($conn->query($sql)) {
			echo json_encode(['code'=>0, 'msg'=>"Xóa thành công"]);
		}
		else {
			echo json_encode(['code'=>1, 'msg'=>"Xóa thất bại"]);
		}
	}
?>

