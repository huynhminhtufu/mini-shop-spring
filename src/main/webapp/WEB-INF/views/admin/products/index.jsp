<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../bootstrap.jsp"/>
<html>
<head>
    <title>Admin Products Manage</title>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div class="container">
    <div class="row mt-4">
        <div class="col-lg-12">
            <h2>Products Management</h2>
            <hr/>
            <a href="/admin/products/create"><button class="btn btn-primary mb-2">Create new</button></a>

            <table class="table table-hover" style="width: 100%">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Category</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price</th>
                    <th scope="col">Amount</th>
                    <th scope="col">Thumbnail</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${listProducts}">
                        <tr>
                            <th scope="row">${row.id}</th>
                            <td>${row.category.name}</td>
                            <td>${row.name}</td>
                            <td>${row.description}</td>
                            <td>${row.price}</td>
                            <td>${row.amount}</td>
                            <td>${row.thumbnail}</td>
                            <td>
                                <a href="/admin/products/edit?id=${row.id}"><button class="btn btn-primary">Edit</button></a>
                                <a href="/admin/products/delete?id=${row.id}"><button class="btn btn-danger">Delete</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>