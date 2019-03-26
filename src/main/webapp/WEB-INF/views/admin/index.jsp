<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../bootstrap.jsp"/>
<html>
<head>
    <title>AdminCP</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
    <div class="row mt-4">
        <div class="col-lg-12">
            <h2 class="mb-4">AdminCP</h2>
            <div class="row mb-2"><a href="/admin/products"><button class="btn btn-primary">Product Management</button></a></div>
            <div class="row mb-2"><a href="/admin/categories"><button class="btn btn-secondary">Category Magagement</button></a></div>
        </div>
    </div>
</div>
</body>
</html>
