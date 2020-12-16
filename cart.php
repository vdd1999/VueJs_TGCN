<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GIỎ HÀNG</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--------------------------------------BOOTSTRAP 4------------------------------------------>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-----------------------------------INSTALL VUEJS--------------------------------------------->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!----------------------------------------INSTALL AXIOS--------------------------------------->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <!----------------------------------INSTALL COOKIES---------------------------------------------->
    <script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>
</head>
<body>

<style>

</style>
<div class="container">
    <h2>Giỏ hàng</h2>

    <table id="cart" class="table table-striped">
        <thead >
        <tr>
            <td colspan="7">
                <a href="index.php" class="btn btn-primary">Tiếp tục mua hàng</button>
            </td>
        </tr>
        <tr >
            <th>Ảnh</th>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Thành tiền</th>
            <th>Xóa</th>
        </tr>
        </thead>
        <tbody v-if="show">
        <tr  v-for="product,n in products" :id="n">
            <td><img :src="product.Img" style="max-height: 50px"></td>
            <td >{{n+1}}</td>
            <td>{{product.Product_Name}}</td>
            <td><input @change="calTotal(n)" class="quantity" :id="n+'price'" type="number" value="1"></td>
            <td>{{saleprice(product.Price)}}</td>
            <td hidden>{{convertPrice(product.Price)}}</td>
            <td>{{saleprice(product.Price)}}</td>
            <td hidden></td>
            <td><button type="button" class="btn btn-danger" v-on:click="removeRow(index); deleteCookies(product.Id);">Xóa</button></td>
        </tr>
        <tr>
            <td id="total" style="text-align: right" colspan="7"></td>
        </tr>
        <tr>
            <td colspan="8" style="text-align: right">
                <button href="#" onclick="window.location.reload(true);" type="button" class="btn btn-success">Cập nhật giỏ hàng</button>
                <button type="button" class="btn btn-danger">Thanh toán</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <script src="cart.js"></script>

</html>