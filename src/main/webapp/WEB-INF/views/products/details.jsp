<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../bootstrap.jsp"/>
<html>
<head>
    <title>Product ${product.name}</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
    <div class="row">
        <jsp:include page="../sidebar.jsp"/>
        <div class="col-lg-9">
            <div class="card mt-4">
                <img class="card-img-top img-fluid" src="${product.thumbnail}" style="max-width: 400px" alt="">
                <div class="card-body">
                    <h3 class="card-title">${product.name}</h3>
                    <h4>$${product.price}</h4>
                    <p class="card-text">${product.description}</p>
                    <p class="card-text">Stock: ${product.amount}</p>
                    <a href="/shop/order?id=${product.id}&quantity=1"><button class="btn btn-primary">Add to cart</button></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
