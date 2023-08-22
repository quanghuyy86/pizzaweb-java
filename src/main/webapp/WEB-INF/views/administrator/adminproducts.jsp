<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	<link href="${base}/css/app.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<!-- NAV -->
		<jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>

		<div class="main">
		
			<!-- main_nav -->
			<jsp:include page="/WEB-INF/views/administrator/layout/main_nav.jsp"></jsp:include>

			<main class="content">
				<div class="container-fluid p-0">
						<h1 class="h3 mb-3" style="float: left">Sản phẩm</h1>
						<a style="float: right; text-decoration: none; color: red;" href="${base}/admin/addproduct">Thêm sản phẩm</a>
					<table class="table table-bordered">
						<thead>
							<th>STT</th>
							<th>Ảnh</th>
							<th>tên sản phẩm</th>
							<th>Mô tả</th>
							<th>Giá</th>
							<th style="width: 200px;"></th>
						</thead>
						<tbody>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
							<tr>
								<td style="width: 100px;">1</td>
								<td>
									<img src="https://image-us.eva.vn/upload/3-2020/images/2020-09-08/image9-1599537286-983-width620height420.jpg" width="50%">
								</td>
								<td>
									Pizza bò
								</td>
								<td>
									Hương Vị Tuyệt Hảo
								</td>
								<td>
									250.000đ
								</td>
								<td>
									<button type="button" class="btn btn-danger">delete</button>
									<button type="button" class="btn btn-secondary">exit</button>
								</td>
							</tr>
						</tbody>
					  </table>
					
				</div>
			</main>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		</div>
	</div>

	<script src="${base}/js/app.js"></script>


</body>

</html>