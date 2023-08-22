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
            <h1>Đăng ký tài khoản</h1>
            <div class="breadcrum">
                <a href="${base}/home">Trang chủ</a> / Đăng ký tài khoản
            </div>
        </div>
        <div class="register container">
        <!-- 
        <fieldset>
                <legend>
                    Đăng ký tài khoản
                </legend>
                <form action="" method="post">
                    <div class="form-group">
                        <label for="">Họ tên</label>
                        <input type="text" name="fullname" id="input_fullname"  field-name="họ tên">
                        <p class="error" id="error_fullname"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" name="email" id="input_email" field-name="email">
                        <p class="error" id="error_email"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Mật khẩu</label>
                        <input type="password" name="password" id="input_password" field-name="mật khẩu">
                        <p class="error" id="error_password"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Mật khẩu xác nhận</label>
                        <input type="password" name="password_confirm" id="input_password_confirm" field-name="lại mật khẩu">
                        <p class="error" id="error_password_confirm"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Giới tính</label>
                        <div>
                            <input type="radio" name="gender" value="1" checked>Nam <br>
                            <input type="radio" name="gender" value="2">Nữ
                        </div>
                    </div>
                    <div class="form-group div-btn">
                        <button onclick="dangKytaiKhoan()" type="submit" class="btn btn-register">Đăng ký</button>
                        <a href="../layout/login.html">Đăng nhập tài khoản</a>
                    </div>
                    <div class="other">
                        <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a> / <a href=""><i class="fa-brands fa-google"></i></a>
                    </div>
                </form>
            </fieldset>
         -->
            
            <fieldset>
                <legend>
                    Đăng ký tài khoản
                </legend>
                <sf:form modelAttribute="registerModel" action="${base}/register-spring-form" method="POST">
                    <div class="form-group">
                        <label for="">Họ tên</label>
                        <sf:input path="fullName" name="fullname" id="input_fullname"  field-name="họ tên"></sf:input>
                        <p class="error" id="error_fullname"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <sf:input path="email" name="email" id="input_email" field-name="email"></sf:input>
                        <p class="error" id="error_email"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Mật khẩu</label>
                        <sf:input path="password" name="password" id="input_password" field-name="mật khẩu"></sf:input>
                        <p class="error" id="error_password"></p>
                    </div>
                    <div class="form-group">
                        <label for="">Mật khẩu xác nhận</label>
                        <sf:input path="ConfirmPassword" name="password_confirm" id="input_password_confirm" field-name="lại mật khẩu"></sf:input>
                        <p class="error" id="error_password_confirm"></p>
                    </div>
                    <div class="form-group div-btn">
                        <button onclick="dangKytaiKhoan()" type="submit" class="btn btn-register">Đăng ký</button>
                        <a href="../layout/login.html">Đăng nhập tài khoản</a>
                    </div>
                    <div class="other">
                        <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a> / <a href=""><i class="fa-brands fa-google"></i></a>
                    </div>
                </sf:form>
            </fieldset>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <script src='${base}/js/register.js'></script>
</body>
</html>