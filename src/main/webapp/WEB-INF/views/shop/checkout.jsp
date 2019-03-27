<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-27
  Time: 01:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../bootstrap.jsp"/>
<html>
<head>
    <title>Checkout</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-lg-9 mt-4">
            <h2>Checkout success!</h2>

            <c:if test="${myCart.size() > 0}">
                <table class="table table-hover mt-4" style="width: 100%">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="row" items="${myCart}">
                        <tr>
                            <th scope="row">${row.product.id}</th>
                            <td>${row.product.name}</td>
                            <td>${row.quantity}</td>
                            <td>$${row.product.price}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${myCart != null && myCart.size() > 0}">
                <div class="alert alert-primary">
                    Total: $${total}. Thank you, hope you will go back soon!
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
