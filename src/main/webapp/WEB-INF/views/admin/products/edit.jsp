<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-27
  Time: 00:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../bootstrap.jsp"/>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h2>Edit Product</h2>
            <hr/>
            <form:form method="post" action="./edit" modelAttribute="product">
                <form:input path="id" value="${product.id}" type="hidden"/>
                <div class="form-group">
                    <label for="category">Category</label>
                    <form:select path="category.id" class="custom-select">
                        <option value="-1" disabled>Select a cate</option>
                        <c:forEach var="item" items="${listCategory}">
                            <c:choose>
                                <c:when test="${item.id == product.category.id}">
                                    <option value="${item.id}" selected="true">${item.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${item.id}">${item.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="form-group">
                    <label for="name">Product Name</label>
                    <form:input path="name" type="text" class="form-control" id="name" valie="${product.name}"/>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <form:input path="description" type="text" class="form-control" id="description" value="${product.description}"/>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <form:input path="price" type="text" class="form-control" id="price" value="${product.price}"/>
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <form:input path="amount" type="text" class="form-control" id="amount" value="${product.amount}"/>
                </div>
                <div class="form-group">
                    <label for="thumbnail">Thumbnail</label>
                    <form:input path="thumbnail" type="text" class="form-control" id="thumbnail" value="${product.thumbnail}"/>
                </div>
                <button type="submit" class="btn btn-primary">Edit product</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
