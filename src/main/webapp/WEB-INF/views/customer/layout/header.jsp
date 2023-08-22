	<!-- Sử dụng tiếng Việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<header>
        <div class="container container_header">
            <div class="header_left">
                <img  src="/img/logo.png"/>
                <p>Pizza ngon - Giá rẻ - Vận chuyển tận nhà</p>
            </div>
            <div class="header_right">
                <a href="${base }/cart/checkout">
                    <i class="fa-solid fa-basket-shopping"></i>
                    <span id="showTotalItemInCart">
                    	${totalItems}
                    </span>
                </a>
                <div class="register_login">
                    <a href="${base}/login">Đăng nhập</a>/<a href="${base}/register">Đăng ký</a>
                </div>
            </div>
        </div>
    </header>
    <nav>
        <div class="container">
            <ul class="menu_main">
                <li > 
                    <a  href="${base}/home">Trang chủ</a>
                </li>
                <li>
                    <a href="">Thực đơn</a>
                    <div class="sub_menu">
                        <ul>
                            <li>
                                <a href="${base}/home">Pizza</a>
                            </li>
                            <li>
                                <a href="${base}/homeBBQ">Sườn BBQ</a>
                            </li>
                            <li>
                                <a href="${base}/spaghetti">Mỳ ý</a>
                            </li>
                            <li>
                                <a href="${base}/salad">Salad</a>
                            </li>
                            <li>
                                <a href="${base}/drink">Đồ uống</a>
                            </li>
                            <li>
                                <a href="${base}/combo">Combo</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="../layout/khuyenmai.html">Khuyến mại</a>
                </li>
                <li>
                    <a href="">Chính sách</a>
                </li>
                <li>
                    <a href="">Blog</a>
                </li>
                <li>
                    <a href="${base}/contact">Liên hệ</a>
                    <ol>
                        <li>Gọi điện ngay - Ship liền tay (24/7)</li>
                        <li><i class="fa-solid fa-phone"></i>  (024) 36.888.777</li>
                    </ol>
                </li>
            </ul>
        </div>
    </nav> 
    