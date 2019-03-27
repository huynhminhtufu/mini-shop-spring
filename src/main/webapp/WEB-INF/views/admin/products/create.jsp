<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../bootstrap.jsp"/>
<html>
<head>
    <title>Create</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h2>Create Product</h2>
            <hr/>
            <form:form method="post" action="./create" modelAttribute="product">
                <div class="form-group">
                    <label for="category">Category</label>
                    <form:select path="category.id" class="custom-select">
                        <option value="-1" disabled>Select a cate</option>
                        <c:forEach var="item" items="${listCategory}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="form-group">
                    <label for="name">Product Name</label>
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Enter product name"/>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <form:input path="description" type="text" class="form-control" id="description" placeholder="Enter product description"/>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <form:input path="price" type="text" class="form-control" id="price" placeholder="Enter product price"/>
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <form:input path="amount" type="text" class="form-control" id="amount" placeholder="Enter product amount"/>
                </div>
                <div class="form-group">
                    <label for="thumbnail">Thumbnail</label>
                    <form:input path="thumbnail" type="text" class="form-control" id="thumbnail" value="https://cdn.tgdd.vn/Products/Images/42/113263/samsung-galaxy-s9-black-600x600.jpg"/>
                </div>
                <button type="submit" class="btn btn-primary">Create new product</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>