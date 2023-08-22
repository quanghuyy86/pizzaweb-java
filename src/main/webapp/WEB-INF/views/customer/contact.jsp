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
            <h1>Liên hệ với chúng tôi</h1>
            <div class="breadcrum">
                <a href="${base }/home">Trang chủ</a> / Liên hệ với chúng tôi
            </div>
        </div>
        <div class="register container">
            <fieldset>
            <!-- Simple Form -->
            	<!-- 
            	<legend>
                    Contact us
                </legend>
                <div>
                	${message}
                </div>
                <div>
                	<c:forEach var = "employee" items = "${employee }">
                		Nhân viên: ${employee.maNv} - ${employee.tenNv} <br>
                	</c:forEach>
                </div>
                <form action="${base}/contact" method="POST">
                    <div class="form-group">
                        <label for="">Họ tên</label>
                        <input type="text" name="fullName" id="input_fullname"  field-name="họ tên">
                        <p class="error" id="error_fullname"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" name="email" id="input_email" field-name="email">
                        <p class="error" id="error_email"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Giới tính</label>
                        <div>
                            <input type="radio" name="gender" value="1" checked>Nam <br>
                            <input type="radio" name="gender" value="2">Nữ
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Chú thích</label>
                        <textarea name="" id="" cols="70" rows="10"></textarea>
                    </div>
                    <div class="form-group div-btn">
                        <button  type="submit" class="btn btn-register">Submit</button>
                    </div>
                    <div class="other">
                        <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a> / <a href=""><i class="fa-brands fa-google"></i></a>
                    </div>
                </form>
            	 -->
            	

           
            
             <!-- Spring Form -->
             <!-- Mapping html form tới object contact -->
             <legend>
                    Contact us
                </legend>
                <sf:form modelAttribute="contactModel" action="${base}/contact-spring-form" method="POST">
                    <div class="form-group">
                        <label for="">First Name</label>
                        <sf:input path="firstName" name="firstName" ></sf:input>
                        <p class="error" id="error_fullname"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Last Name</label>
                        <sf:input path="lastName" name="lastName" ></sf:input>
                        <p class="error" id="error_fullname"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <sf:input path="email" name="email" id="input_email" field-name="email"></sf:input>
                        <p class="error" id="error_email"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Chú thích</label>
                        <sf:textarea path="message" name="message" id="" cols="70" rows="10" style = "width: 739px; height: 150px;"></sf:textarea>
                    </div>
                    <div class="form-group div-btn">
                        <button  type="submit" class="btn btn-register">Submit</button>
                    </div>
                    <div class="other">
                        <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a> / <a href=""><i class="fa-brands fa-google"></i></a>
                    </div>
                </sf:form>


             	<!-- Ajax -->
             	<!-- 
             	<legend>
                    Contact us
                </legend>
                <div>
                	${message}
                </div>
                <div>
                	<c:forEach var = "employee" items = "${employee }">
                		Nhân viên: ${employee.maNv} - ${employee.tenNv} <br>
                	</c:forEach>
                </div>
                <form>
                    <div class="form-group">
                        <label for="">Họ tên</label>
                        <input type="text" name="fullName" id="input_fullname"  field-name="họ tên">
                        <p class="error" id="error_fullname"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" name="email" id="input_email" field-name="email">
                        <p class="error" id="error_email"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Giới tính</label>
                        <div>
                            <input type="radio" name="gender" value="1" checked>Nam <br>
                            <input type="radio" name="gender" value="2">Nữ
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Chú thích</label>
                        <textarea name="" id="" cols="70" rows="10"></textarea>
                    </div>
                    <div class="form-group div-btn">
                        <button  type="button" onclick="Submit_Click();" class="btn btn-register">Submit</button>
                    </div>
                    <div class="other">
                        <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a> / <a href=""><i class="fa-brands fa-google"></i></a>
                    </div>
                </form>
             	 -->
             	

            </fieldset>
        </div>
    </main>
    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    
    <!-- Jquery -->
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    
    <!-- Js-Register -->
    <script src='${base}/js/register.js'></script>
    
    
    
    <script type="text/javascript">
    	function Submit_Click() {
			//tạo javascript object
			//json == javascript object
			let data = {
					fullName: $("#input_fullname").val(),
					email: $("#input_email").val(),
			};
			
			//Sử dụng hàm ajax của Jquery để gọi
			jQuery.ajax({
				url: 			"${base}/contact-ajax", //--> action
				type: 			"post",
				contentType: 	"application/json",
				data: 			JSON.stringify(data), //đổi kiểu dữ liệu của data thành string và có kiểu JSON
				
				dataType: "json", //Kiểu dữ liệu trả về từ controller là json
				success: function(jsonResult) {
					alert(jsonResult.StatusMessage)
				},
				error: function(jqXhr, textStatus, errorMessage) {
					
				}
			});
		}
    </script>
</body>
</html>