<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                    <meta name="author" content="Hỏi Dân IT" />
                    <title>Update Order</title>

                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />

                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Update Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/admin">Admin</a></li>
                                        <li class="breadcrumb-item active"> <a href="/admin/order">Order</a></li>
                                        <li class="breadcrumb-item active">Update Order</li>
                                    </ol>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-6 ">
                                                <h3>Update An Order</h3>
                                                <hr />
                                                <form:form action="/admin/order/update" method="post"
                                                    modelAttribute="order">
                                                    <div class="mb-3">
                                                        <label for="id" class="form-label">Id</label>
                                                        <form:input type="text" class="form-control" id="id" path="id"
                                                            style="pointer-events: none; color:#AAA; background:#F5F5F5;" />

                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="totalPrice" class="form-label">Total Price</label>
                                                        <c:set var="formattedPrice">
                                                            <fmt:formatNumber type="number"
                                                                value="${order.totalPrice}" />
                                                        </c:set>

                                                        <form:input type="text" class="form-control" id="user"
                                                            path="user.fullName"
                                                            style="pointer-events: none; color:#AAA; background:#F5F5F5;"
                                                            value="${formattedPrice} đ" />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="user" class="form-label">User</label>
                                                        <form:input type="text" class="form-control" id="user"
                                                            path="user.fullName"
                                                            style="pointer-events: none; color:#AAA; background:#F5F5F5;" />
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="statuy" class="form-label">Status</label>
                                                        <form:select class="form-select"
                                                            aria-label="Default select example" id="status"
                                                            path="status">
                                                            <form:option value="PENDING">PENDING</form:option>
                                                            <form:option value="SHIPPING">SHIPPING</form:option>
                                                            <form:option value="COMPLETE">COMPLETE</form:option>
                                                            <form:option value="CANCEL">CANCELED</form:option>
                                                        </form:select>
                                                    </div>
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                    <a href="/admin/user" class="btn btn-success">Back</a>
                                                </form:form>


                                            </div>
                                        </div>
                                    </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>