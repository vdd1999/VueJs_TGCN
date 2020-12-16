<?php
    session_start();
    if (!isset($_SESSION['user'])) {
        header('Location: login.php');
        exit();
    }
    require_once('conn.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <!----------------------------------------INSTALL AXIOS--------------------------------------->
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <!----------------------------------INSTALL COOKIES---------------------------------------------->
  <script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>

</head>
<body>

    <style>
        body{
            padding-top: 50px;
        }
        table{
            width: 80%;
            text-align: center;
        }
        td{
            padding: 10px;
        }
        tr.item{
            border-top: 1px solid #5e5e5e;
            border-bottom: 1px solid #5e5e5e;
        }

        tr.item:hover{
            background-color: #d9edf7;
        }

        tr.item td{
            min-width: 150px;
        }

        tr.header{
            font-weight: bold;
            background-color: lightgray;
        }

        a{
            text-decoration: none;
        }
        a:hover{
            color: deeppink;
            font-weight: bold;
        }
        #msg {
            display: none;
            width: 50%;
            margin: auto;
            text-align: center;
            position: fixed;
        }
        td img {
            max-height: 100px;
        }
    </style>



  <div class="alert alert-success alert-dismissible" id="msg">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong id="error"></strong>
    
  </div>

    <table id="show-product" cellpadding="10" cellspacing="10" border="0" style="border-collapse: collapse; margin: auto">

        <tr class="control" style="text-align: left; font-weight: bold; font-size: 20px">
            <td colspan="4">
                <a href="add_product.php">Thêm sản phẩm</a>
            </td>
            <td class="text-right">
                <a href="logout.php">Đăng xuất</a>
            </td>
        </tr>
        <tr class="header">
            <td hidden="">Mã sản phẩm</td>
            <td>STT</td>
            <td>Image</td>
            <td>Name</td>
            <td>Brand</td>
            <td>Price</td>
            <td>Action</td>
        </tr>
        <tr class="item" v-for ="product,n in products">
            <td hidden>{{product.Product_Code}}</td>
            <td  class="id-product">{{n+1}}</td>
            <td><img :src="convertImg(product.Img)"></td>
            <td class="name-product">{{product.Product_Name}}</td>
            <td>{{product.Brand_Code}}</td>
            <td>{{convertPrice(product.Price)}}</td>
            <td><a v-on:click="deleteData(product.Product_Name,product.Id); removeRow(n);changeCount;" class="delete">Delete</a>|<a :href="'edit_product.php?id='+product.Id">Edit</a></td>
        </tr>
        <tr class="control" style="text-align: right; font-weight: bold; font-size: 17px">
            <td colspan="5">
                <p>Số lượng sản phẩm: {{changeCount}} </p>
            </td>
        </tr>

    </table>


    <!-- Delete Confirm Modal -->


</body>

<!--     <script>
        $(document).ready(function () {
            var id;
            var $row
            $(".delete").click(function () {
                $row = $(this).closest("tr");    // Find the row
                var $name_product = $row.find(".name-product").text(); // Find the text
                id = $row.find(".id-product").text();
                $('.modal-body').append('<p>Bạn có chắc rằng muốn xóa <strong>'+$name_product+'</strong> ?</p>');
                $('#myModal').modal({
                    backdrop: 'static',
                    keyboard: false
                });
            });

            $('#btn-delete-modal').click(function() {
                $('.modal-body').html('');
                $('#myModal').hide();
                $('.modal-backdrop'). hide()
                delete_product(id);
                setTimeout(function() {
                    location.reload();
                }, 4000);  
            });

            $('#btn-close-modal').click(function (){
                $('.modal-body').html('');
            });

            function delete_product(id) {
                $.ajax({
                    type: "POST",
                    url: "delete.php",
                    dataType: "json",
                    data: {id: id},
                    success: function(res) {
                        if (res.code == "0") {
                            console.log(res.msg);
                            $('#msg-delete').html(res.msg);
                            $('#msg-delete').show();
                            setTimeout(function() {
                                $("#msg-delete").hide(); 
                            }, 3000);  
                        }
                        else {
                            $('#msg-delete').html(res.msg);
                            $('#msg-delete').show();
                            setTimeout(function() {
                                $("#msg-delete").hide(); 
                            }, 3000);            
                        }

                    }
                });
            }
            //EDIT PRODUCT

        });
    </script>
 -->      <script src="index.js"></script>

</html>