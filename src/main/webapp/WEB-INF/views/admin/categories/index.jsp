<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../bootstrap.jsp"/>
<html>
<head>
    <title>Admin Categories Manage</title>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div class="container">
    <div class="row mt-4">
        <div class="col-lg-6">
            <h2>Categories Management</h2>
            <hr/>
            <a href="/admin/categories/create"><button class="btn btn-primary mb-2">Create new</button></a>

            <table class="table table-hover" style="width: 100%">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="row" items="${listCategories}">
                    <tr>
                        <th scope="row">${row.id}</th>
                        <td>${row.name}</td>
                        <td>
                            <a href="/admin/categories/edit?id=${row.id}"><button class="btn btn-secondary">Edit</button></a>
                            <a href="/admin/categories/delete?id=${row.id}"><button class="btn btn-danger">Delete</button></a>
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
