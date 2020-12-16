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
                <h3 class="text-center text-secondary mt-2 mb-3 mb-3">Thêm sản phẩm mới</h3>
                <form id="form" method="post"   novalidate enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="name"><strong>Name</strong></label>
                        <input v-model="name" name="name" required class="form-control" type="text" placeholder="Product Name" id="name">
                    </div>
                    <div class="form-group">
                        <label for="price"><strong>Price</strong></label>
                        <input value="" name="price" required class="form-control" type="number" placeholder="Price" id="price" v-model="price">
                    </div>
                    <div class="form-group">
                        <label for="brand"><strong>Category</strong>:</label>
                        <input type="radio" id="laptop" value="Laptop" v-model="brand">
                        <label for="laptop">Laptop</label>
                        <input type="radio" id="mobile" value="Mobile" v-model="brand">
                        <label for="mobile">Mobile</label>
                        <span>{{brand}}</span>
                    </div>
                    <div class="form-group">
                        <label for="brand"><strong>Brand:</strong></label>
                        <select  v-model="cate">
                          <option v-for="option in options" v-bind:value="option.value">
                            {{ option.text }}
                          </option>
                        </select>
                    </div>

                    <div class="form-group">
                        <div class="section-file">
                            <label class="fileContainer">
                                Select files
                                <input type="file" class="file-upload" id="file" name="file" @change="fileSelected" multiple accept="image/jpg,image/jpeg,image/png"/>
                            </label>                            
                            <span class="file-info" v-if="!files || !files.length">No files selected</span>
                            <span v-else>
                                <br>
                                <span id="fileName" v-for="file in files" :key="file.name">{{file.name}}</span>
                            </span>     
                        </div>                        

                    </div>
                    <div class="form-group">
                        
                        <button type="button"@click="add(name,price,cate,brand);"  class="btn btn-primary px-5 mr-2">Thêm</button>
                    </div>
                </form>
                <div id="alert" style="display: none;" class='alert alert-danger'>ok</div>
            </div>
        </div>

    </div>
<script>
    // Add the following code if you want the name of the file appear on select
new Vue({
    el: "#form",
    data: {
        name: '',
        price: 0,
        brand: '',
        cate: 'Apple',
        files: null,
        options: [
          { text: 'Apple', value: 'Apple' },
          { text: 'SamSung', value: 'SamSung' },
          { text: 'Oppo', value: 'Oppo' },
          { text: 'Huawei', value: 'Huawei' },
          { text: 'Realme', value: 'Realme' }
        ]
    },
    methods: {
        add: function(name,price,brand,cate){
            let file = $('#fileName').html();
            $.ajax({
                url: 'add.php',
                type: "POST",
                data: {name:name,price:price,cate:cate,brand:brand,file:file},
                success: function(data) {
                    $('#alert').html(data.message);
                    $('#alert').show();
                    setTimeout(function() {
                        location.reload();
                    }, 2000);  
                },
                error: function(data) {
                    console.log(data);
                }
            })
            return true
        },
        fileSelected(e) {
            this.files = e.target.files
            return this.files
        }
    }
})
console.log(localStorage.getItem("loi"));
$('#loi').html(localStorage.getItem("loi"));
</script>
</body>
</html>

