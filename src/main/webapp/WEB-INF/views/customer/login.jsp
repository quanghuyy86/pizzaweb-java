<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
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
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <main>
    	<div class="banner_title">
            <h1>Đăng nhập tài khoản</h1>
            <div class="breadcrum">
                <a href="${base}/home">Trang chủ</a> / Đăng nhập tài khoản
            </div>
        </div>
        <div class="container container_login">
            <div class="login">
                <fieldset>
                    <legend>Đăng nhập tài khoản</legend>
                    <form action="${base}/login_processing_url" method="POST">
                        <div class="form-group">
                            <label for="">Tài khoản:</label> <br>
                            <input type="text"  name="username" class="form-control" placeholder="Username">
                            <p class="error" id="error_email"></p>
                        </div>
                        <div class="form-group">
                            <label for="">Mật khẩu:</label> <br>
                            <input type="password" name="password" class="form-control" placeholder="Password">
                            <p class="error" id="error_password"></p>
                        </div>
                        <c:if test="${not empty param.login_error}">
							<div >
								Login attempt was not successful, try again!!!
							</div>
						</c:if>
                        <div class="form-group div-btn">
                            <button type="submit" class="btn btn-register">Đăng nhập</button>
                            <a href="${base}/register">Đăng ký</a>
                        </div>
                        <div class="other">
                            <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a> / <a href=""><i class="fa-brands fa-google"></i></a>
                        </div>
                    </form>
                </fieldset>
            </div>
            <div class="forgot_password">
                <span>Bạn quên mật khẩu? Nhập địa chỉ email của bạn để lấy lại mật khảu qua email</span> <br>
                <label for="">Email</label> <br>
                <input type="email" placeholder="Email" name="email" id="input_email">
                <button>Lấy lại mật khẩu</button>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <script src='${base}/js/register.js'></script>
</body>
</html>