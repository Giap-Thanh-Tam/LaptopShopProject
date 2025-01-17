<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

                    <meta name='viewport' content='width=device-width, initial-scale=1'>
                    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

                </head>

                <body>

                    <jsp:include page="../layout/header.jsp" />


                    <!-- Checkout Page Start -->

                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active"> <a href="/">Trang chủ</a></li>
                                <li class="breadcrumb-item active"><a href="/cart">Chi tiết giỏ hàng</a></li>
                                <li class="breadcrumb-item active">Chi tiết thanh toán</li>
                            </ol>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá cả</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cartDetail" items="${cartDetails}">
                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${cartDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>

                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${cartDetail.product.id}">${cartDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" />
                                                        đ
                                                    </p>

                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">

                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}"
                                                            data-cart-detail-id="${cartDetail.id}"
                                                            data-cart-detail-price="${cartDetail.price}">


                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" />
                                                        đ
                                                    </p>


                                                </td>


                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>



                    <c:if test="${not empty cartDetails}">
                        <form:form action="/place-order" method="post" modelAttribute="cart">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="container-fluid pb-5">
                                <div class="container pb-5">
                                    <div class="row g-5">
                                        <div class="col-md-12 col-lg-6 ">
                                            <div class="row">
                                                <h2 class="">Thông tin người nhận</h2>
                                                <div class="form-item">
                                                    <div class="form-item w-100">
                                                        <label class="form-label mt-3">Tên người nhận</label>
                                                        <input type="text" class="form-control" name="receiverName">
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="form-item w-100">
                                                        <label class="form-label mt-3">Địa chỉ người nhận</label>
                                                        <input type="text" class="form-control" name="receiverAddress">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <label class="form-label mt-3">Số điện thoại</label>
                                                <input type="text" class="form-control" name="receiverPhone">
                                            </div>
                                            <div class="mt-4 "> <a href="/cart" class="d-flex align-items-center "><i
                                                        style='font-size:20px' class='fas'>&#xf104;</i>
                                                    <span style="padding-left: 8px;">Quay lại giỏ hàng
                                                    </span>
                                                </a>
                                            </div>

                                        </div>
                                        <div class="col-md-12 col-lg-6 5">
                                            <div class="table-responsive">
                                                <div class="bg-light rounded">
                                                    <div class="p-4">
                                                        <h2 class="display-6 mb-4">Thông Tin <span
                                                                class="fw-normal">Thanh
                                                                Toán</span>
                                                        </h2>
                                                        <div class="d-flex justify-content-between">
                                                            <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                            <div class="">
                                                                <p class="mb-0">0 đ</p>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-between mt-4">
                                                            <h5 class="mb-0 me-4">Hình thức</h5>
                                                            <div class="">
                                                                <p class="mb-0">Thanh toán khi nhận hàng (COD)</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                        <h5 class="mb-0 ps-4 me-4">Tổng số tiền</h5>
                                                        <p class="mb-0 pe-4" data-cart-total-price="${totalPrices}">
                                                            <fmt:formatNumber type="number" value="${totalPrices}" />
                                                            đ
                                                        </p>
                                                    </div>
                                                    <button type="submit"
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                                        Xác nhận thanh toán
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="submit"> thanh toán</button>

                        </form:form>
                    </c:if>
                    <!-- Checkout Page End -->

                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


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