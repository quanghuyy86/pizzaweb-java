<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html><html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">


	<title>Admin Product</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
	
</head>

<body>
	<div class="wrapper">
		<!-- NAV -->
		<jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>

		<div class="main">
		
			<!-- main_nav -->
			<jsp:include page="/WEB-INF/views/administrator/layout/main_nav.jsp"></jsp:include>

			<main class="content">
				<form action="${base }/admin/product/list" method="get">
					<!-- tìm kiếm sản phẩm trên danh sách -->
					<div class="container-fluid p-0" style="float: left; margin-bottom: -40px;">
						<input id="page" name="page" value="${productSearch.currentPage }">	
						<!-- tìm kiếm theo tên sản phẩm -->
						<input type="text" id="keyword" name="keyword" placeholder="Search" autocomplete="off" style="margin-right: 5px;" value="${productSearch.keyword }" >
								
						<!-- tìm kiếm theo danh mục sản phẩm -->
						<select  name="categoryId" id="categoryId" style="margin-right: 5px; border: 1px solid #99999;height: 26px; border-radius: 3px;" >
							<option value="0">All</option>
								<c:forEach items="${categories}" var="category">
									<option value="${category.id }">${category.name }</option>
								</c:forEach>
						</select>
								
						<button type="submit" id="btnSearch" name="btnSearch" value="Search" class="btn btn-danger">Seach</button>
					</div>
					<div>
						<a class="btn btn-secondary" href="${base }/admin/product/management/" role="button" style="float: right; margin-bottom: 10px; lin">Add New</a>
					</div>
			
				<div class="container-fluid p-0">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">Number</th>
								<th scope="col">Title</th>
								<th scope="col">Price</th>
								<th scope="col">Category</th>
								<th scope="col">Deleted/Not deleted</th>
								<th scope="col">Avatar</th>
								<th scope="col" style="width: 200px;">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products.data}" var="product" varStatus="loop">
									<tr>
										<th scope="row" width="5%">
											${loop.index + 1}
										</th>
										<td>
											${product.title }
										</td>
										<td>
											<!-- định dạng tiền tệ -->
											<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${product.price }" type="currency" />
										</td>
										<td>
											${product.categories.name }
										</td>
										<td>
											<span id="_product_status_${product.id} }">
												<c:choose>
													<c:when test="${product.status }">
														<input type="checkbox" checked="checked" >
													</c:when>
													<c:otherwise>
														<input type="checkbox" >
													</c:otherwise>
												</c:choose>
											</span>
										</td>
										<td>
											<img src="${base }/upload/${product.avatar}" width="100" height="100">
										</td>
										<td width="15%">
											<div>
												<a class="btn btn-secondary" href="${base }/admin/product/management/${product.id}">Edit</a>
												<a class="btn btn-danger" role="button" onclick="DeleteProduct(${product.id})">Delete</a>
											</div>
										</td>
									</tr>
								</c:forEach>
						</tbody>
					  </table>
					  <!-- phân trang -->
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>
		
					
				</div>
			</form>	
			</main>

			
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		<script src="${base}/js/app.js"></script>
		
		<script type="text/javascript">
			function DeleteProduct(productId) {
				//tạo javascript object
				var data = {
						id: productId,
				};
				//$===jQuery
				//json == javascript object
				jQuery.ajax({
					url: '${base}' + "/admin/product/delete",
					type: "post",
					contentType: "application/json",
					data: JSON.stringify(data),
					
					dataType: "json",
					success: function(jsonResult) {
						location.reload(); //refresh lại trang web
					},
					error: function(jqXhr, textStatus, errorMessage) {
						alert("error");
					}
				});
			}
		</script>
		
		<script type="text/javascript">
		
			$( document ).ready(function() {
				
				// đặt giá trị của category ứng với điều kiện search trước đó
				$("#categoryId").val(${productSearch.categoryId});
				
				$(function() {
				    $("#paging").pagination({
				    	currentPage: ${products.currentPage}, 	//trang hiện tại
				        items: ${products.totalItems},			//tổng số sản phẩm
				        itemsOnPage: ${products.sizeOfPage}, 	//số sản phẩm trên 1 trang
				        cssStyle: 'light-theme',
				        onPageClick: function(pageNumber, event) {
				        	$('#page').val(pageNumber);
				        	$('#btnSearch').trigger('click');
						},
				    });
				});
			});			
		</script>
		</div>
	</div>



</body>

</html>