<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../bootstrap.jsp"/>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <h2 class="mt-4">Shopping Cart</h2>
            <c:if test="${myCart == null || myCart.size() == 0}">
                <div class="alert alert-primary mt-4">Your cart is empty, let's add something!</div>
            </c:if>
            <c:if test="${myCart.size() > 0}">
                <table class="table table-hover mt-4" style="width: 100%">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="row" items="${myCart}">
                        <tr>
                            <th scope="row">${row.product.id}</th>
                            <td>${row.product.name}</td>
                            <td>${row.quantity}</td>
                            <td>
                                <a href="/shop/order?id=${row.product.id}&quantity=1"><button class="btn">+</button></a>
                                <a href="/shop/order?id=${row.product.id}&quantity=-1"><button class="btn">-</button></a>
                                <a href="/shop/delete?id=${row.product.id}"><button class="btn btn-danger">Delete</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${myCart != null && myCart.size() > 0}">
                <a href="/shop/checkout"><button class="btn btn-primary">Checkout now!</button></a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
