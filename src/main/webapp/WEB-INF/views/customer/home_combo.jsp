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
                    <a  href="${base}/home">
                        <i class="fa-solid fa-pizza-slice"></i>
                        <p>Pizza</p>
                    </a>
                </li>
                <li>
                    <a href="${base}/bbgribs">
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
                    <a href="${base}/drink">
                        <i class="fa-solid fa-martini-glass"></i>
                        <p>Đồ Uống</p>
                    </a>
                </li>
                <li>
                    <a class="active" href="${base}/combo">
                        <i class="fa-solid fa-futbol"></i>
                        <p>Combo</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="container list_products">
            <!--Start-->
            <div class="product">
                <div class="info">
                    <a href="">
                        <img src="img/products/combo/Combo-1.jpg" width="100%"/>
                    </a>
                    <div class="desc_product">
                        <h2 class="name_product">COMBO 01</h2>
                        <div class="price">120.000</div>
                        <div class="option">
                            <div class="amount">
                                <label>Số lượng</label>
                                <select>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                    <option value="">6</option>
                                    <option value="">7</option>
                                    <option value="">8</option>
                                    <option value="">9</option>
                                    <option value="">10</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="Purchase">
                        <button type="submit">Mua hàng</button>
                    </div>
                </div>
            </div>
            <!--End-->
            <!--Start-->
            <div class="product">
                <div class="info">
                    <a href="">
                        <img src="img/products/combo/Combo-2.jpg" width="100%"/>
                    </a>
                    <div class="desc_product">
                        <h2 class="name_product">COMBO 02</h2>
                        <div class="price">180.000</div>
                        <div class="option">
                            <div class="amount">
                                <label>Số lượng</label>
                                <select>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                    <option value="">6</option>
                                    <option value="">7</option>
                                    <option value="">8</option>
                                    <option value="">9</option>
                                    <option value="">10</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="Purchase">
                        <button type="submit">Mua hàng</button>
                    </div>
                </div>
            </div>
            <!--End-->
            <!--Start-->
            <div class="product">
                <div class="info">
                    <a href="">
                        <img src="img/products/combo/Combo-3.jpg" width="100%"/>
                    </a>
                    <div class="desc_product">
                        <h2 class="name_product">COMBO 03</h2>
                        <div class="price">300.000</div>
                        <div class="option">
                            <div class="amount">
                                <label>Số lượng</label>
                                <select>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                    <option value="">6</option>
                                    <option value="">7</option>
                                    <option value="">8</option>
                                    <option value="">9</option>
                                    <option value="">10</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="Purchase">
                        <button type="submit">Mua hàng</button>
                    </div>
                </div>
            </div>
            <!--End-->
            <!--Start-->
            <div class="product">
                <div class="info">
                    <a href="">
                        <img src="img/products/combo/Combo-4.jpg" width="100%"/>
                    </a>
                    <div class="desc_product">
                        <h2 class="name_product">COMBO 04</h2>
                        <div class="price">440.000</div>
                        <div class="option">
                            <div class="amount">
                                <label>Số lượng</label>
                                <select>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                    <option value="">6</option>
                                    <option value="">7</option>
                                    <option value="">8</option>
                                    <option value="">9</option>
                                    <option value="">10</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="Purchase">
                        <button type="submit">Mua hàng</button>
                    </div>
                </div>
            </div>
            <!--End-->
        </div>
    </main>
   
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
</html>