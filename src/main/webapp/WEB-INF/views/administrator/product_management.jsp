<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import thư viện spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">


	<title>Admin Add Product</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<link href="${base}/css/app.css" rel="stylesheet">

	<style>
	.login fieldset{
    box-sizing: border-box;
    border-radius: 10px;
    box-shadow: 0 0 5px #ccc;
    border: 1px solid #ccc;
	}

	legend{
    text-align: center;
    text-transform: uppercase;
    font-weight: bold;
    font-size: 25px;
	}

	form{
    padding: 15px;
	}

	.form-group{
    margin-top: 15px;
	}

	.form-group > input{
    width: 100%;
    box-sizing: border-box;
    height: 30px;
    border: 1px solid #ccc;
    border-radius: 5px;
	}

	.form-group > input:focus{
    outline: unset;
	}

	.form-group > textarea{
    display: block;
	}

	.div-btn{
    text-align: center;
	}

	.div-btn button{
    color: #f5f5f5; 
    background-color: red;   
    padding: 10px;
    border: none;
    margin-right: 15px;
	}
	</style>
</head>
<body>
	<div class="wrapper">
		<!-- NAV -->
		<jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>

		<div class="main">
		
			<!-- main_nav -->
			<jsp:include page="/WEB-INF/views/administrator/layout/main_nav.jsp"></jsp:include>

			<main class="content">
				<div class="register container">
					<fieldset>
						<legend>
							Thêm sản phẩm
						</legend>
						<sf:form modelAttribute="product" action="${base}/admin/product/management" method="post" enctype="multipart/form-data">
	
							<div class="form-group">
								<label for="">Product Id</label>
								<sf:input path="id" ></sf:input>
							</div>
							
							<div class="form-group">
								<label for="category">Category (required)</label>
								<sf:select path="categories.id" >
									<sf:options items="${categories }" itemValue="id" itemLabel="name" />									
								</sf:select>
							</div>
							
							<div class="form-group">
								<label for="title">Title (required)</label>
								<sf:input path="title" id="title" placeholder="Title" ></sf:input>
							</div>
							
							<div class="form-group">
								<label for="price">Price (required)</label>
								<sf:input autocomplete="off" path="price"  id="price" placeholder="Price" ></sf:input>
							</div>
							
							<div class="form-group">
								<label for="priceSale">Price Sale (required)</label>
								<sf:input  autocomplete="off" path="priceSale" id="priceSale" placeholder="Price sale"></sf:input>
							</div>
							
							<div class="form-group">
								<label for="short_description">Description (required)</label>
								<sf:textarea autocomplete="off" path="shortDes"  placeholder="Short Description" id="short_description" rows="3" cols="153" ></sf:textarea>
							</div>

							<div class="form-group">
								<label for="detail_description">Details (required)</label>
								<sf:textarea autocomplete="off" path="detail" id="detail_description" rows="3" cols="153" ></sf:textarea>								
							</div>
							
							<div class="form-group">
								<label  for="isHot">Is Hot Product?</label>
								<sf:checkbox class="checkbox" path="isHot"  id="isHot" />
								
							</div>
							
							<!-- Avatar -->
							<div class="form-group">
								<label for="fileProductAvatar">Avatar</label>
								<input type="file" id="fileProductAvatar" name="productAvatar">
							</div>
							<div class="form-group">
								<img alt="" style="width: 100px; height: 100px" src="${base }/upload/${product.avatar}">
							</div>
							
							<!-- Pictures -->
							<div class="form-group">
								<label for="fileProductPictures">Picture(Mutiple)</label>
								<input type="file" id="fileProductPictures" name="productPictures" multiple="multiple">
							</div>
							<div class="form-group">
								<c:forEach items="${product.productImages }" var="productImages">
									<img alt="" style="width: 100px; height: 100px" src="${base }/upload/${productImages.path}">
								</c:forEach>
							</div>
							
							
							<div class="form-group div-btn">
								<button type="submit" class="btn-register">Save Product</button>
							</div>

						</sf:form>
					</fieldset>
				</div>
			</main>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		</div>
	</div>

	<script src="${base}/js/app.js"></script>

</body>

</html>