$(document).ready(function () {
	$.ajax({
		url: 'getId.php',
		dataType: 'json',
		type: "GET",
		success: function(data) {
		    console.log(data);
		    const show_cart = new Vue({
		        el: '#cart',
		        data() {
		        	if (data.code == "1") {
		        		return {products:data.products,show:false};
		        	}
		        	else {
		            	return {products:data.products,show:true};		        		
		        	}
		        },
		        methods: {
		        	saleprice (string) {
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
		        	},
		        	removeRow: function(index) {
	              		this.products.splice(index, 1);
	          		},
	          		deleteCookies(id) {
	          			console.log(id)
	          			products = $cookies.get("products");
	          			if ((parseInt(products)-parseInt(id)==0)) {
	          				$cookies.remove("products");	          						
	          			}
	          			else {
		          			$cookies.set("products", products.replace(id+",","").split(',').join(','));	          				          				
	          			}
	          			console.log($cookies.get("products"));
	          		},
	          		convertPrice: function(string) {
		        		if (string.includes('.')) {
		        			if (string.split('.').length == 3) {
	                            return (parseFloat(string)*1000000)	        				
		        			}
		        			else if (string.split('.').length == 2) {
		                            return (parseFloat(string)*1000)    					        				
		        			}
                        }
                        else {
                            return parseInt(string.split('.').join(""))
                        }	          			
	          		},
	          		calTotal: function(n) {
	          			let totalAll = 0
	          			let qty = $("#"+n+'price').val()
	          			let price = $("#"+n).find('td:eq(5)').html();
	          			let total = parseInt(qty)*parseInt(price)
	          			$("#"+n).find('td:eq(6)').html(total.toLocaleString('vi', {style : 'currency', currency : 'VND'}));
	          			$("#"+n).find('td:eq(7)').html(total)
	          			$("#cart tbody tr").each(function () {
	          				var tr = $(this);
	          				console.log(tr)
	          				let totalitem = tr.find('td:eq(7)').html()
	          				totalAll = totalAll + parseInt(tr.find('td:eq(7)').html())
	          				console.log(totalAll)
	          			})
	          		},
	          		calTotalAll: function() {
	          			
	          			$("#cart tbody tr").each(function () {
	          				var tr = $(this);
	          				let total = tr.find('td:ed(7)').html()
	          				totalAll += parseInt(total)
	          			})
	          			return totalAll
	          		}
	          	}
		    })
		}
	});
})