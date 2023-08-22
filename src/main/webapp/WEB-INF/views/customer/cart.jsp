<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import thư viện spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Pizza Express Pizza</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <main>
        <div class="banner_title">
            <h1>Giỏ hàng của bạn</h1>
            <div class="breadcrum">
                <a href="${base }/home">Trang chủ</a> / Giỏ hàng của bạn
            </div>
        </div>
        <div class="list_product container">
        	
        	<c:forEach var="ci" items="${cart.cartItems }">
        		<div class="row">
        			<div class="product_info">
        				<a href="">
        					<img style="width: 100%" alt="" src="${base }/upload/${ci.avatar }">
        				</a>
        				<div class="desc">
        					<h2>
								${ci.productName }       				
        					</h2>
        					<div class="brand">Thương hiệu: Pizza Express</div>
                        	<div class="origin">Xuất xứ: VietNam</div>
                        	<div class="price" style="margin-top: 0px">
                        		<fmt:formatNumber value = "${ci.priceUnit }" type = "currency"/>
                        	</div>
        				</div>
        			</div>
        			<div class="action">
                    	<div class="slg_sp">
                        	<button type="button"  value="-" onclick="UpdateQuanlityCart('${base}', ${ci.productId}, -1)">-</button>

                        	<input type="text" id="quanlity_${ci.productId }"  value="${ci.quanlity }" class="input_slg">

                        	<button type="button" value="+" onclick="UpdateQuanlityCart('${base}', ${ci.productId}, 1)">+</button>
                    	</div>
                    	<div class="total_1_sp" data-type="${ci.priceUnit }">
                    	    
                    	    <strong id="priceUnit_${ci.productId }"><fmt:formatNumber value = "${ci.priceUnit }" type = "currency"/></strong>
                    	</div>
                    	<button class="btn-xoa" type="button" onclick="DeleteProductTocart('${base}', ${ci.productId });">Xóa</button>
                	</div>
        		</div>
        	</c:forEach>

        </div>

        <form action="${base }/cart/checkout" method="post">
			<div class="total_price container">
            	<fmt:setLocale value="vi_VN"/>
            	<span>Tổng tiền: </span> <strong id="totalPrice"><fmt:formatNumber value = "${sessionScope.totalPrice }" type = "currency"/></strong> 

        	</div>
            <div class="row ">
                <div class="customer_information">
                    <div class="">Thông tin khách hàng</div>
                    <div class="">
                    
                        <div class="form-group" style="margin-bottom: 5px;">
                            <label for="customerPhone">Họ và tên khách hàng</label>
                            <input type="text" class="form-control" id="customerFullName" name="customerFullName" value="${userLogined.username }" placeholder="Full name">
                        </div>
                        <div class="form-group" style="margin-bottom: 5px;">
                            <label for="customerEmail">Địa chỉ Email</label>
                            <input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${userLogined.email }" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group" style="margin-bottom: 5px;">
                            <label for="customerPhone">Phone</label>
                            <input type="tel" class="form-control" id="customerPhone" name="customerPhone" value="${userLogined.phone }" placeholder="Phone">
                        </div>
                        <div class="form-group" style="margin-bottom: 5px;">
                            <label for="customerAddress">Địa chỉ giao hàng</label>
                            <input type="text" class="form-control" id="customerAddress" name="customerAddress" value="${userLogined.shippingAddress }" placeholder="Address">
                        </div>
                    </div>
                </div>
                <div class="pay">
                        <button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Thanh toán</button>
				</div>
        	</div>
        </form>
    </main>
    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    
    
    <script type="text/javascript">
    
    
    
    
    function UpdateQuanlityCart(baseUrl, productId, quanlity) {

    	let data = {
    		productId: productId, 	
    		quanlity: quanlity,
    	};

    	jQuery.ajax({
    		url: baseUrl + "/ajax/updateQuanlityCart", //->action
    		type: "post",
    		contentType: "application/json",
    		data: JSON.stringify(data),

    		dataType: "json", // kieu du lieu tra ve tu controller la json
    		success: function(jsonResult) {
  
    			$("#quanlity_" + productId).val(jsonResult.currentProductQuanlity);

    			
    		},
    		error: function(jqXhr, textStatus, errorMessage) {
    			
    		}
    	});
    }
    </script>
    

</body>
</html>