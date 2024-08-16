<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Update User</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Update User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Admin</a></li>
                                    <li class="breadcrumb-item active"> <a href="/admin/user">User</a></li>
                                    <li class="breadcrumb-item active">Update User</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-6 ">
                                            <h3>Update A User</h3>
                                            <hr />
                                            <form:form action="/admin/user/update" method="post"
                                                modelAttribute="newUser">
                                                <div class="mb-3" style="display:none">
                                                    <label for="InputId1" class="form-label">Id</label>
                                                    <form:input type="text" class="form-control" id="InputId1"
                                                        path="id" />
                                                </div>
                                                <div class="mb-3">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="InputEmail1" class="form-label">Email</label>
                                                    <form:input type="email"
                                                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        id="InputEmail1" path="email" />
                                                    ${errorEmail}

                                                    <div class="mb-3 col-12 col-md-6" style="display:none">
                                                        <c:set var="errorPassword">
                                                            <form:errors path="password" cssClass="invalid-feedback" />
                                                        </c:set>

                                                        <label for="InputPassword1" class="form-label ">Password</label>
                                                        <form:input type="password"
                                                            class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                            id="InputPassword1" path="password" />
                                                        ${errorPassword}


                                                    </div>

                                                </div>
                                                <div class="mb-3">
                                                    <label for="InputPhonenumber1" class="form-label">Phone
                                                        number</label>
                                                    <form:input type="text" class="form-control" id="InputPhonenumber1"
                                                        path="phone" />
                                                </div>
                                                <div class="mb-3">
                                                    <c:set var="errorFullName">
                                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="InputFullname1" class="form-label ">Full
                                                        name</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                        id="InputFullname1" path="fullName" />
                                                    ${errorFullName}
                                                </div>
                                                <div class="mb-3">
                                                    <label for="InputAddress1" class="form-label">Address</label>
                                                    <form:input type="text" class="form-control" id="InputAddress1"
                                                        path="address" />
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
                <!-- <script src="js/scripts.js"></script> -->

            </body>

            </html>