
 function UpdateQuanlityCart(baseUrl, productId, quanlity){
	let data = {
		productId: productId, 	// Id sản phẩm
		quanlity: quanlity, 	// Số lượng cho vào giỏ hàng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			//tăng số lượng sản phẩm trong giỏ hàng trong icon
			$("#quanlity_" + productId).html(jsonResult.currentProductQuanlity);
			//$( ".totalPrice" ).html(jsonResult.totalPrice);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}






