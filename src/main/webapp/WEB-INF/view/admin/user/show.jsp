<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Detail ${id}</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <!-- <link rel="stylesheet" href="/css/demo.css"> -->
        </head>

        <body>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 mx-auto">
                        <div style="display: flex; justify-content: space-between;">
                            <h1>User Detail with id = ${id}</h1>
                            <a href="/admin/user/create" class="btn btn-primary">Create Users</a>
                        </div>
                        <hr>
                        <div class="card" style="width: 50%;">
                            <div class="card-header">
                                User information
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Id: ${id}</li>
                                <li class="list-group-item">Email: ${email}</li>
                                <li class="list-group-item">Fullname: ${fullName}</li>
                                <li class="list-group-item">Address: ${Address}</li>
                            </ul>
                        </div>
                        </ul>


                    </div>
                </div>
            </div>
        </body>

        </html>