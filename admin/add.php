<?php
    header('Content-Type: application/json; charset=utf-8');
    if (isset($_POST['name']) && isset($_POST['price']) && isset($_POST['brand']) && isset($_POST['cate']) && isset($_POST['file'])) {
        $name = $_POST['name'];
        $price = $_POST['price'];
        $brand = $_POST['brand'];
        $cate = $_POST['cate'];
        $file = $_POST['file'];
        require_once('conn.php');
        $conn = open_db();

        //Get Product_Code and increase it
        $sql1 = "SELECT Product_Code 
        FROM product  
        ORDER BY Id DESC  
        LIMIT 1";
        $code = '';
        $result = $conn->query($sql1);
        if ($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
            $code = $row['Product_Code'];
          }
        }
        (int)$sp=end(explode("SP",$code));
        if ($sp < 100) {
            $sp = $sp+1;
            $Product_Code = "SP000".strval($sp);
        }
        else if ($sp >= 100 && $sp < 1000){
            $sp = $sp+1;
            $Product_Code = "SP00".strval($sp);
        }
        else if ($sp >= 1000 && $sp < 10000) {
            $sp = $sp+1;
            $Product_Code = "SP0".strval($sp);
        }


        $sql = 'insert into product(Product_Name,Product_Code, Price, Brand_Code, Category_Code, Img) values(?,?,?,?,?,?)';
        $stm = $conn->prepare($sql);

        $stm->bind_param('ssssss', $name,$Product_Code, $price, $brand, $cate, $file);

        if (!$stm->execute()) {
            die(json_encode(array('code' => 3, 'message' => $stm->error)));
        }

        sleep(4);

        $id = $stm->insert_id;
        die(json_encode(array('code' => 0, 'message' => 'Chèn thành công',
            'data' => $id)));

    }
    else {
        die(json_encode(array('code' => 1, 'message' => "Lỗi đầu vào")));
    }
?>