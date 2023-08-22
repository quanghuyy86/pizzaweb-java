<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<!-- header -->
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <main>
        <div class="slider">
            <img src="/img/banner/banner1.png" width="100%"/>
        </div>
        <div class="container products">
            <h1>Thực đơn</h1>
            <ul class="menu">
                <li>
                    <a href="${base}/home">
                        <i class="fa-solid fa-pizza-slice"></i>
                        <p>Pizza</p>
                    </a>
                </li>
                <li>
                    <a href="${base}/homeBBQ">
                        <i class="fa-solid fa-bowl-food"></i>
                        <p>Sườn BBQ</p>
                    </a>
                </li>
                <li>
                    <a href="${base}/spaghetti">
                        <i class="fa-solid fa-bowl-rice"></i>
                        <p>Mì ý</p>
                    </a>
                </li>
                <li>
                    <a href="${base}/salad">
                        <i class="fa-solid fa-utensils"></i>
                        <p>Salad</p>
                    </a>
                </li>
                <li>
                    <a class="active" href="${base}/drink">
                        <i class="fa-solid fa-martini-glass"></i>
                        <p>Đồ Uống</p>
                    </a>
                </li>
                <li>
                    <a href="${base}/combo">
                        <i class="fa-solid fa-futbol"></i>
                        <p>Combo</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="container list_products">
            <c:forEach  var="product" items="${products }">
            		<div class="product">
            			<div class="info">
            					<a href="">
            						<img src="upload/${product.avatar }"  width="100%"/>
        						</a>
      							<div class="desc_product">
            						<h2 class="name_product">${product.title }</h2>
            						<div class="price">
            							<strong><fmt:formatNumber value = "${product.price}" type = "currency"/></strong>
            						</div>
            					</div>
        						<div class="Purchase">
           				 			<button type="button" onclick="AddProductToCart('${base}', ${product.id }, 1 )">Add to cart</button>
        						</div>
            			</div>
            		</div>
				</c:forEach>
            
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>
</html>