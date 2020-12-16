<?php
    header('Content-Type: application/json; charset=utf-8');
    if (isset($_POST['name']) && isset($_POST['price'])) {
        (int)$id = $_POST['id'];
        $name = $_POST['name'];
        $price = $_POST['price'];
        $file = $_POST['file'];           
        require_once('conn.php');
        $conn = open_db();

        //Get Product_Code and increase it
        $sql = "UPDATE product SET Product_Name='$name',Price='$price',Img='$file' WHERE Id= $id";
       if ($conn->query($sql) === TRUE) {
            die(json_encode(array('code' => 0, 'message' => 'Sửa thành công')));
        } else {
            die(json_encode(array('code' => 3, 'message' => $conn->error)));
        }
    }
    else {
        die(json_encode(array('code' => 1, 'message' => "Lỗi đầu vào")));
    }
?>