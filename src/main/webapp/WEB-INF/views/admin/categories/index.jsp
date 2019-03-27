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

            <form method="get" action="/admin/categories">
                <div class="row mt-4">
                    <div class="input-group mb-3">
                        <input type="text" name="keyword" class="form-control" placeholder="Search..." value="${keyword}" aria-label="Search..." aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary" type="submit" id="button-addon2">Search</button>
                        </div>
                    </div>
                </div>
            </form>

            <c:if test="${total_page == 0}">
                <div class="alert alert-primary">
                    There is no result.
                </div>
            </c:if>

            <c:if test="${total_page != 0}">
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
            </c:if>

            <c:if test="${total_page != 0}">
            <ul class="pagination">
                <li class="page-item ${page <= 0 ? 'disabled' : ''}">
                    <a class="page-link" href="/admin/categories?page=${page - 1}&keyword=${keyword}" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <c:if test="${page > 0}">
                <li class="page-item"><a class="page-link" href="/admin/categories?page=${page - 1}&keyword=${keyword}">
                    ${page}
                </a></li>
                </c:if>
                <li class="page-item active" aria-current="page">
                    <a class="page-link" href="#">${page + 1} <span class="sr-only">(current)</span></a>
                </li>
                <c:if test="${page < total_page - 1}">
                <li class="page-item"><a class="page-link" href="/admin/categories?page=${page + 1}&keyword=${keyword}">${page + 2}</a></li>
                </c:if>
                <li class="page-item ${page >= total_page - 1 ? 'disabled' : ''}">
                    <a class="page-link" href="/admin/categories?page=${page + 1}&keyword=${keyword}">Next</a>
                </li>
            </ul>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>
