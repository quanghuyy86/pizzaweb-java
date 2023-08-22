<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Pizza Express Pizza</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <style>
        .cartsuccesscard h1 {
            color: #88B04B;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-weight: 900;
            font-size: 40px;
            margin-bottom: 10px;
        }
        
        .cartsuccesscard p {
            color: #404F5E;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-size: 20px;
            margin: 0;
        }
        
        .cartsuccesscard i {
            color: #9ABC66;
            font-size: 100px;
            line-height: 200px;
            margin-left: -15px;
        }
        
        .cartsuccesscard {
            background: white;
            padding: 60px;
            border-radius: 4px;
            box-shadow: 0 2px 3px #C8D0D8;
            display: inline-block;
            margin: 0 auto;
        }
        </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <main>
        <div style="margin: 50px;" class="information">
            <div class="cartsuccesscard">
                <div style="border-radius: 200px; height: 200px; width: 200px; background: #F8FAF5; margin: 0 auto;">
                    <i class="checkmark">✓</i>
                </div>
                <h1>Thành công</h1>
                <p>
                    We received your purchase request;<br /> we'll be in touch shortly!
                </p>
            </div>
        </div>
    </main>
    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
   
</body>
</html>