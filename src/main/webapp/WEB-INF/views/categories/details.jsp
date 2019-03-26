<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../bootstrap.jsp"/>
<html>
<head>
    <title>Category ${category.name}</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<!-- Page Content -->
<div class="container">
    <div class="row">
        <jsp:include page="../sidebar.jsp"/>

        <div class="col-lg-9">
            <div class="row mt-4 mb-4">
                <h2>Category ${category.name}</h2>
            </div>
            <div class="row">
                <c:forEach var="item" items="${listProduct}">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card">
                            <a href="#"><img class="card-img-top" src="${item.thumbnail}" alt=""></a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="/product/${item.id}">${item.name}</a>
                                </h4>
                                <h5>$${item.price}</h5>
                                <p class="card-text">${item.description}</p>
                            </div>
                            <div class="card-footer">
                                <a href="/shop/order?id=${item.id}&quantity=1"><button class="btn btn-primary">Add to cart</button></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>
