<?php
    require_once('conn.php');
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $sql = "SELECT * FROM product WHERE id = $id";
        $conn = open_db();
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $error = '';
        $name = $row['Product_Name'];
        //$price = $row['Price'];
        $price = implode("",explode('.', $row['Price']));
        $Img = $row['Img'];
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Thông tin sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-select/3.10.8/vue-select.js" integrity="sha512-U4EVikrI06wvpOhiQ9km3JlHjiNefS03aGAEKjr3hB6qh+C+3cdgiFaWCL9THkqg4nrJ3EgP/aRxh9bpDxYbIg==" crossorigin="anonymous"></script>

    <style>
        .bg {
            background: #eceb7b;
        }
        #vs1__combobox {
            display: flex;
        }
        .vs__selected-options {
            width: 100%;
        }
        .vs__selected-options> input {
            width: 100%;
        }
        .vs__actions>button {
            height: 24px;
        }
        .fileContainer [type=file] {
          cursor: pointer;
          display: block;
          font-size: 13px;
          min-height: 100%;
          min-width: 100%;
          opacity: 0;
          left: 0;
          text-align: right;
          top: -8px;
        }
        .fileContainer {
            padding: 5px;
            border: 2px dotted black;
            width: 100%;
            height: 40px;
        }
        #fileName {
            padding: 5px;
            border: 2px dashed black;
        }
        #alert {
            bottom: 0;
            right: 0;
            position: fixed;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8 border rounded my-5 p-4  mx-3">
                <p class="mb-5"><a href="index.php">Quay lại</a></p>
                <h3 class="text-center text-secondary mt-2 mb-3 mb-3">Sửa thông tin sản phẩm</h3>
                <form id="form" method="post"  novalidate enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="name"><strong>Name</strong></label>
                        <input  name="name" required class="form-control" type="text" placeholder="Product Name" id="name" value="<?= $name?>">
                    </div>
                    <div class="form-group">
                        <label for="price"><strong>Price</strong></label>
                        <input value="<?= $price?>" name="price" required class="form-control" type="number" placeholder="Price" id="price" >
                    </div>

                    <div class="form-group">
                        <div class="section-file">
                            <label class="fileContainer">
                                Select files
                                <input type="file" class="file-upload" id="file" name="file" @change="fileSelected" multiple accept="image/jpg,image/jpeg,/image/png"/>
                            </label>                            
                            <span class="file-info" v-if="!files || !files.length">{{file}}</span>
                            <span v-else>
                                <br>
                                <span id="fileName" v-for="file in files" :key="file.name">{{file.name}}</span>
                            </span>     
                        </div>                        

                    </div>
                    <div class="form-group">
                        <button type="button" @click="edit()" class="btn btn-primary px-5 mr-2">Sửa</button>
                    </div>
                </form>
                <span hidden id="idproduct"><?= $id?></span>
                <input hidden id="imgproduct" value="<?= $Img?>"></input>
                <div id="alert" style="display: none;" class='alert alert-danger'></div>

            </div>
        </div>

    </div>
<script>
    let img = $('#imgproduct').val();
    // Add the following code if you want the name of the file appear on select
new Vue({
    el: "#form",
    data: {
        file: img,
        files: null,
    },
    //
    methods: {
        edit: function(){
            let id = $('#idproduct').html();
            let name = $('#name').val();
            let price = $('#price').val();
            let file = $('#fileName').html();
            if (file == null) {
                file = $('#imgproduct').val();
            }
            $.ajax({
                url: 'edit.php',
                type: "POST",
                data: {id:id,name:name,price:price,file:file},
                success: function(data) {
                    $('#alert').html(data.message);
                    $('#alert').show();
                    setTimeout(function() {
                        location.reload();
                    }, 2000);  

                },
                error: function(data) {
                    console.log(data)
                }
            })
            return false
        },
        fileSelected(e) {
            this.files = e.target.files
            return this.files
        }
    }
})

</script>
</body>
</html>
