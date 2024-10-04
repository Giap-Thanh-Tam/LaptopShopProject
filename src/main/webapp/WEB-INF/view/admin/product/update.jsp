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
                <title>Update Product</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#imageId");
                        const orgImage = "${newProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#imagePreview").attr("src", urlImage);
                            $("#imagePreview").css({ "display": "block" });
                        }

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                <h1 class="mt-4">Update Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Admin</a></li>
                                    <li class="breadcrumb-item active"> <a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Update Product</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-6 ">
                                            <h3>Update A Product</h3>
                                            <hr />
                                            <form:form action="/admin/product/update" method="post"
                                                modelAttribute="newProduct" class="row" enctype="multipart/form-data">
                                                <div class="mb-3 col-12 col-md-6" style=" display:none">
                                                    <label for="InputId1" class="form-label">Id</label>
                                                    <form:input type="text" class="form-control" id="InputId1"
                                                        path="id" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="InputName1" class="form-label">Name</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                        id="InputName1" path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="InputPrice1" class="form-label">Price</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                        id="InputPrice1" path="price" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="mb-3 col-12 ">
                                                    <c:set var="errorDetailDesc">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="InputdetailDesc1" class="form-label">Detail description
                                                    </label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                        id="InputdetailDesc1" path="detailDesc" />
                                                    ${errorDetailDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorShortDesc">
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="InputShortdesc1" class="form-label">Short
                                                        description</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                        id="InputShortdesc1" path="shortDesc" />
                                                    ${errorShortDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorQuantity">
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="InputQuantity1" class="form-label">Quantity</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        id="InputQuantity1" path="quantity" />
                                                    ${errorQuantity}
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="SelectFactory" class="form-label">Factory</label>
                                                    <form:select class="form-select" aria-label="Default select example"
                                                        id="SelectFactory" path="factory">

                                                        <form:option value="Apple(Macbook)">Apple(Macbook)</form:option>
                                                        <form:option value="Asus">Asus</form:option>
                                                        <form:option value="Lenovo">Lenovo</form:option>
                                                        <form:option value="Dell">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="Acer">Acer</form:option>
                                                    </form:select>
                                                </div>


                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="SelectTarget" class="form-label">Target</label>
                                                    <form:select class="form-select" aria-label="Default select example"
                                                        id="SelectTarget" path="target">

                                                        <form:option value="Gaming">Gaming</form:option>
                                                        <form:option value="Sinh viên - Văn phòng">Sinh viên - Văn phòng
                                                        </form:option>
                                                        <form:option value="Thiết kế đồ họa">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                                        <form:option value="Doanh nhân">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="imageId" class="form-label">Image</label>
                                                    <input class="form-control" type="file" id="imageId"
                                                        accept=".png, .jpg, .jpeg" name="imageNameFile" />
                                                </div>

                                                <div class="mb-3 col-12">
                                                    <img style="max-height: 250px; display: none;" alt="image preview"
                                                        id="imagePreview">
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                    <a href="/admin/product" class="btn btn-success"> Back</a>
                                                </div>

                                            </form:form>


                                        </div>
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