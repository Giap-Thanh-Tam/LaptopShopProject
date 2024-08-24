<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Fruitables - Vegetable Website Template</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->


                <!-- Navbar start -->
                <div class="container-fluid fixed-top">

                    <div class="container px-0">
                        <nav class="navbar navbar-light bg-white navbar-expand-xl">
                            <a href="/" class="navbar-brand">
                                <h1 class="text-primary display-6">Cửa hàng Laptop</h1>
                            </a>
                            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarCollapse">
                                <span class="fa fa-bars text-primary"></span>
                            </button>
                            <div class="collapse navbar-collapse bg-white mx-5
                            justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav ">
                                    <a href="/" class="nav-item nav-link active">Trang chủ</a>
                                    <a href="/product/detail" class="nav-item nav-link">Sản phẩm</a>
                                </div>
                                <div class="d-flex m-3 me-0">
                                    <!-- Sign in -->
                                    <c:if test="${not empty pageContext.request.userPrincipal}">

                                        <a href="#" class="position-relative me-4 my-auto">
                                            <i class="fa fa-shopping-bag fa-2x"></i>
                                            <span
                                                class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                                style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                                        </a>
                                        <div class="dropdown my-auto">
                                            <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                                data-bs-toggle="dropdown" aria-expanded="false"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fas fa-user fa-2x"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-menu-end p-4" aria-
                                                labelledby="dropdownMenuLink">
                                                <li class="d-flex align-items-center flex-column"
                                                    style="min-width: 300px;">
                                                    <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                        src="/images/product/1711078092373-asus-01.png" />
                                                    <div class="text-center my-3">
                                                        <c:out value="${pageContext.request.userPrincipal.name}" />
                                                    </div>
                                                </li>
                                                <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                                                <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li>
                                                    <form method="post" action="/logout">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button class="dropdown-item">Đăng xuất</button>
                                                    </form>
                                                </li>
                                            </ul>
                                        </div>
                                    </c:if>
                                    <!-- Guest -->
                                    <c:if test="${empty pageContext.request.userPrincipal}">

                                        <a href="/login" class="position-relative me-4 my-auto">
                                            Đăng nhập
                                        </a>

                                    </c:if>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
                <!-- Navbar End -->



                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>