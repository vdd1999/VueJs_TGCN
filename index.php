<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage</title>
  
  <!--------------------------------------BOOTSTRAP 4------------------------------------------>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-----------------------------------INSTALL VUEJS--------------------------------------------->
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <!----------------------------------------INSTALL AXIOS--------------------------------------->
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <!----------------------------------INSTALL COOKIES---------------------------------------------->
  <script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>
  <style type="text/css">
    .products {
      display: flex;
    }
    img {
      width: 100%;
      height: 150px;
    }
    .card {
      padding: 10px;
      border: 1px solid gainsboro;
      height: 350px;
    }
    .card-title {
      padding-top: 0.75rem;
      text-align: center;
      font-weight: 700;
      height: 30%;
      margin-bottom: 0.5rem;
    }
    .card-body {
      text-align: center;
      height: 70%;
      padding: 0;
      position: relative;
      overflow: hidden;
    }
    .add {
      width: 100%;
      position: absolute;
      transform: translateY(80px);
    }

    .card:hover .add {
      transform: translateY(0);
      transition: all 0.5s;
    }

    .card:hover  {
      box-shadow: 0 0 11px rgba(33,33,33,.2);
      transform: translateY(-10px);
      transition: all 0.5s;
    }

    nav.navbar.navbar-expand-lg.navbar-dark.bg-dark {
      position: sticky;
      top: 0;
      z-index: 10001;
  }

    .btn-add {
      margin-right: auto;
      margin-left: auto;
    }
    .list-group-item:hover {
      background-color: #D4DCD2;
      color: white;
    }
    .d-block img {
      height: 300px;
    }
    #carouselExampleControls {
      margin-bottom: 1.5rem;
    }
    #show-mobile {
      display: none;
    }
    #show-laptop {
      display: none;
    }

    .my-4 {
      position: fixed;
      z-index: 1000;
      width: 15%;
    }

    #list-cate {
      position: fixed;
      top: 200px;
      width: 15%;
    }

  </style>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" style="text-align: center;" href="#">Technology World</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
		  <li class="nav-item">
			<a id="cart" class="nav-link" href="cart.php">
			  Giỏ hàng <span class="badge badge-light" id="count">{{counts}}</span>
			</a>
		  </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div  class="container">
    <div id="vue-demo" class="row">
      <div class="col-lg-3">
        <h1 class="my-4">Technology World</h1>
        <div id="list-cate">

          <ul class="list-group">
            <li id="trend" @click="activeTab='1'; get_Trending();" :class="[activeTab === '1' ? 'list-group-item active' : 'list-group-item']" >Trending</li>
            <li id="lap" @click="activeTab='2';get_Laptop();" :class="[activeTab === '2' ? 'list-group-item active' : 'list-group-item']" >Laptop</li>
            <li id="mobi" @click="activeTab='3';get_Mobile();" :class="[activeTab === '3' ? 'list-group-item active' : 'list-group-item']" >Mobile</li>       
          </ul>
        </div>
      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
                        <!--SLIDE SHOW-->
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="https://cdn.tgdd.vn/2020/10/banner/410ADE32-E4E0-41D1-B013-BB783A9A5BBC-800x300.png" style="height: 300px;">
            </div>
            <div class="carousel-item" v-for="sl in slides">
              <img class="d-block w-100" :src="sl" style="height: 300px;">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        <div class="row">
            <!--Show product trending-->
          <div id="show-trending">
            <section class="products" >
              <div class="row">
                <div  v-for="lap in trending"  :key="lap.Id" class="product col-lg-4 col-md-6 mb-4 ">
                  <div class="card" >
                    <img
                    :src="convertImg(lap.Img)"
                    :alt="lap.Product_Name"
                    class="product-mage"
                    >
                    <div class="card-title">
                      <h6>{{ lap.Product_Name }}</h6>                      
                    </div>
                    <div class="card-body">
                      <p class="product-price">{{ convertPrice(lap.Price) }}</p>
                      <div class="add">
                        <button type="button" @click="setCookies(lap.Id,lap.Product_Name,lap.Price);"class="btn btn-add btn-primary">Add to cart</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>   
          </div>
          <!--SHOW LAPTOP-->
          <div id="show-laptop" >
            <section class="products">
              <div class="row">
                <div v-for="lap in laptop" :key="lap.Id" class="product col-lg-4 col-md-6 mb-4 ">
                  <div class="card">
                    <img
                    :src="convertImg(lap.Img)"
                    :alt="lap.Product_Name"
                    class="product-mage"
                    >
                    <div class="card-title">
                      <h6>{{ lap.Product_Name }}</h6>                      
                    </div>
                    <div class="card-body">
                      <p class="product-price">{{ convertPrice(lap.Price) }}</p>
                      <div class="add">
                        <button type="button"@click="setCookies(lap.Id,lap.Product_Name,lap.Price);" class="btn btn-primary btn-add">Add to cart</button>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </section>   
          </div>
          <!--SHOW MOBILE-->
          <div id="show-mobile" >
            <section class="products">
              <div class="row">
                <div v-for="lap in mobile" :key="lap.Id" class="product col-lg-4 col-md-6 mb-4 ">
                  <div class="card">
                    <img
                    :src="convertImg(lap.Img)"
                    :alt="lap.Product_Name"
                    class="product-mage"
                    >
                    <div class="card-title">
                      <h6>{{ lap.Product_Name }}</h6>                      
                    </div>
                    <div class="card-body">
                      <p class="product-price">{{ convertPrice(lap.Price) }}</p>
                      <div class="add">
                        <button type="button" @click="setCookies(lap.Id,lap.Product_Name,lap.Price);" class="btn btn-primary btn-add">Add to cart</button>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </section>   
          </div>
		    </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <script src="script.js"></script>
<!-- <script src="script1.js"></script>
 -->
<!-- <script>
  products = $cookies.get("products");
    console.log(products);
    count = products.split(',').length;
    $('#count').text(count);
</script> -->
</body>

</html>
