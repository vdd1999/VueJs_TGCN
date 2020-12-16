// https://vuejs.org/v2/guide/


$(document).ready(function() {  
    if (list_cate.changeActive === '1') {
        list_cate.get_Trending();

    }
    else if (list_cate.changeActive === '2'){
        list_cate.get_Laptop();
    }
    else {
        list_cate.get_Mobile();
    }

    $('#trend').click(function() {
        $('#show-trending').css('display','block');
        $('#show-mobile').css('display','none');
        $('#show-laptop').css('display','none');
    })
    $('#lap').click(function() {
        $('#show-laptop').css('display','block');
        $('#show-mobile').css('display','none');
        $('#show-trending').css('display','none');
    })
    $('#mobi').click(function() {
        $('#show-mobile').css('display','block');
        $('#show-trending').css('display','none');
        $('#show-laptop').css('display','none');
    });

});


var list_cate = new Vue ({
    el: '#list-cate',
    data: {
        activeTab: '1'
    },
    computed: {

        changeActive: function() {
            return this.activeTab
        },
    },
    methods:{
        get_Trending: function() {
            $.ajax({
                url: 'getProduct.php',
                dataType: 'json',
                type: "GET",
                success: function(data) {
                    console.log(data);
                    const show_trending = new Vue({
                        el: '#show-trending',
                        data() {
                            return {trending:data.trending,activeTab:list_cate.changeActive};
                        },
                        methods:
                        {
                            setCookies (id) {
                                //Gọi cookies ra lư vào prducts
                                products = $cookies.get("products")
                                // Them san pham
                                check = true;
                                //Nếu product có sản phẩm thi sao sánh
                                if (products != null) {
                                    //chạy từng cái phần tử trong products
                                    for (i=0; i<=products.split(',').length; i++) {
                                        if (id == products.split(',')[i]) {
                                            //Nếu có id nào mà trùng vs trong products thì cho check = false
                                            check = false;
                                        }
                                    }
                                    //Sau khi check xong nếu ko trùng thì check = true, thêm id vào sau dấu ,
                                    if (check) {
                                        products = products + ',' + id;              
                                    }
                                } else {
                                    //Nếu products = rỗng thì gán proucts = id
                                  products = id;
                                }
                                console.log($cookies.get('products'));
                                $cookies.set("products", products);
                                console.log($cookies.get('products'));
                                console.log(products);
                                count = $cookies.get('products').split(',').length;
                                $('#count').text(count);
                                //$cookies.remove('products');
                                return products;
                            },
                            convertImg: function(string) {
                                if (string.substring(0, 5) == 'https') {
                                    return string
                                }
                                else {
                                    return './admin/images/'+string
                                }
                            },
                            convertPrice: function(string) {
                                if (string.includes('.')) {
                                    if (string.split('.').length == 3) {
                                        return (parseFloat(string)*1000000).toLocaleString('vi', {style : 'currency', currency : 'VND'})                            
                                    }
                                    else if (string.split('.').length == 2) {
                                            return (parseFloat(string)*1000).toLocaleString('vi', {style : 'currency', currency : 'VND'})                                                       
                                    }
                                }
                                else {
                                    return parseInt(string.split('.').join("")).toLocaleString('vi', {style : 'currency', currency : 'VND'});
                                }
                            }
                        },
                    });
                }
            }) 
        },
        get_Mobile: function() {
            $.ajax({
                url: 'getProduct.php',
                dataType: 'json',
                type: "GET",
                success: function(data) {
                    console.log(data);
                    const show_mobile = new Vue({
                        el: '#show-mobile',
                        data() {
                            return {mobile:data.mobile,activeTab:list_cate.changeActive};
                        },
                        methods:
                        {
                            setCookies (id) {
                                //Gọi cookies ra lư vào prducts
                                products = $cookies.get("products")
                                // Them san pham
                                check = true;
                                //Nếu product có sản phẩm thi sao sánh
                                if (products != null) {
                                    //chạy từng cái phần tử trong products
                                    for (i=0; i<=products.split(',').length; i++) {
                                        if (id == products.split(',')[i]) {
                                            //Nếu có id nào mà trùng vs trong products thì cho check = false
                                            check = false;
                                        }
                                    }
                                    //Sau khi check xong nếu ko trùng thì check = true, thêm id vào sau dấu ,
                                    if (check) {
                                        products = products + ',' + id;              
                                    }
                                } else {
                                    //Nếu products = rỗng thì gán proucts = id
                                  products = id;
                                }
                                console.log($cookies.get('products'));
                                $cookies.set("products", products);
                                console.log($cookies.get('products'));
                                console.log(products);
                                count = $cookies.get('products').split(',').length;
                                $('#count').text(count);
                                //$cookies.remove('products');
                                return products;
                            },
                            convertImg: function(string) {
                                if (string.substring(0, 5) == 'https') {
                                    return string
                                }
                                else {
                                    return './admin/images/'+string
                                }
                            },
                            convertPrice: function(string) {
                                if (string.includes('.')) {
                                    if (string.split('.').length == 3) {
                                        return (parseFloat(string)*1000000).toLocaleString('vi', {style : 'currency', currency : 'VND'})                            
                                    }
                                    else if (string.split('.').length == 2) {
                                            return (parseFloat(string)*1000).toLocaleString('vi', {style : 'currency', currency : 'VND'})                                                       
                                    }
                                }
                                else {
                                    return parseInt(string.split('.').join("")).toLocaleString('vi', {style : 'currency', currency : 'VND'});
                                }
                            }
                        },
                    });
                }
            }) 
        },
        get_Laptop: function() {
            $.ajax({
                url: 'getProduct.php',
                dataType: 'json',
                type: "GET",
                success: function(data) {
                    console.log(data);
                    const show_laptop = new Vue({
                        el: '#show-laptop',
                        data() {
                            return {laptop:data.laptop,activeTab:list_cate.changeActive};
                        },
                        methods:
                        {
                            setCookies (id) {
                                //Gọi cookies ra lư vào prducts
                                products = $cookies.get("products")
                                // Them san pham
                                check = true;
                                //Nếu product có sản phẩm thi sao sánh
                                if (products != null) {
                                    //chạy từng cái phần tử trong products
                                    for (i=0; i<=products.split(',').length; i++) {
                                        if (id == products.split(',')[i]) {
                                            //Nếu có id nào mà trùng vs trong products thì cho check = false
                                            check = false;
                                        }
                                    }
                                    //Sau khi check xong nếu ko trùng thì check = true, thêm id vào sau dấu ,
                                    if (check) {
                                        products = products + ',' + id;              
                                    }
                                } else {
                                    //Nếu products = rỗng thì gán proucts = id
                                  products = id;
                                }
                                console.log($cookies.get('products'));
                                $cookies.set("products", products);
                                console.log($cookies.get('products'));
                                console.log(products);
                                count = $cookies.get('products').split(',').length;
                                $('#count').text(count);
                                //$cookies.remove('products');
                                return products;
                            },
                            convertImg: function(string) {
                                if (string.substring(0, 5) == 'https') {
                                    return string
                                }
                                else {
                                    return './admin/images/'+string
                                }
                            },
                            convertPrice: function(string) {
                                if (string.includes('.')) {
                                    if (string.split('.').length == 3) {
                                        return (parseFloat(string)*1000000).toLocaleString('vi', {style : 'currency', currency : 'VND'})                            
                                    }
                                    else if (string.split('.').length == 2) {
                                            return (parseFloat(string)*1000).toLocaleString('vi', {style : 'currency', currency : 'VND'})                                                       
                                    }
                                }
                                else {
                                    return parseInt(string.split('.').join("")).toLocaleString('vi', {style : 'currency', currency : 'VND'});
                                }
                            }
                        }
                    });
                }
            }) 
        }
    }
});

const slide = new Vue({
    el: '#carouselExampleControls',
    data() {
        return {
            slides: [
                "https://cdn.tgdd.vn/2020/10/banner/iphone-12-800-300-800x300-3.png",
                "https://cdn.tgdd.vn/2020/10/banner/big-pk-800-300-800x300.png",
                "https://cdn.tgdd.vn/2020/09/banner/reno4-chung-800-300-800x300-1.png"
            ]
        }
    }
})

const cart = new Vue({
    el: "#cart",
    data() {
        products = $cookies.get("products");
        return {counts: products.split(',').length};
    },
});
