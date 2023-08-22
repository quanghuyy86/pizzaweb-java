function AddProductToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, 	// Id sản phẩm
		quanlity: quanlity, 	// Số lượng cho vào giỏ hàng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			//alert("Tổng số lượng sản phẩm có trong giỏ hàng là: " + jsonResult.totalItems)
			
			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#showTotalItemInCart").html(jsonResult.totalItems);
			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

		function DeleteProductTocart(baseUrl, productId) {
				//tạo javascript object
				let data = {
						productId: productId,
				};
				//$===jQuery
				//json == javascript object
				jQuery.ajax({
					url: baseUrl + "/cart/product/delete",
					type: "post",
					contentType: "application/json",
					data: JSON.stringify(data),
					
					dataType: "json",
					success: function(jsonResult) {
						$('.btn-xoa').on('click', function(){
							$(this).parents('.row').remove();
							let total = totalPrice();
							$('#totaPrice').text(formatPrice(total) + "VND")
						})
					},
					error: function(jqXhr, textStatus, errorMessage) {
						alert("error");
					}
				});
			}





