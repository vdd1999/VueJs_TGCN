$(document).ready(function() {
    $.ajax({
        url: 'http://localhost:8888/VueJs/getProduct.php',
        dataType: 'json',
        type: "GET",
        success: function(data) {
            console.log(data);
            const show_trending = new Vue({
                el: '#show-product',
                data() {
                    return {products:data.all, count: data.all.length};
                },
                computed: {
                    changeCount: function() {
                        return this.count-1
                    }
                },
                methods: {
                    deleteData: function(name,id) {
                        if(confirm("Are you sure you want to remove "+ name +"?"))
                            {
                                $.ajax({
                                    url: 'delete.php',
                                    data: {id:id},
                                    type: "POST",
                                    success: function(data) {
                                        console.log(data)
                                        $('#error').html(data.msg);
                                        $('#msg').fadeIn();
                                        $('#msg').fadeOut(3000);
                                    }
                                });
                            }
                    },
                    removeRow: function(index) {
                        this.products.splice(index, 1);
                    },
                    convertImg: function(string) {
                        if (string.substring(0, 5) == 'https') {
                            return string
                        }
                        else {
                            return './images/'+string
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
        },
        error: function(data){
            console.log(data);
        }
    }) 
})
//ko dc