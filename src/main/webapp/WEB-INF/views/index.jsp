<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="bootstrap.jsp"/>
<html>
<head>
    <title>Homepage - Shopping Online</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <jsp:include page="sidebar.jsp"/>

        <div class="col-lg-9">
            <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <form method="get" action="/index">
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
            <div class="row">
                <c:forEach var="item" items="${listProduct}">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card">
                            <a href="/product?id=${item.id}"><img class="card-img-top" src="${item.thumbnail}" alt=""></a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="/product?id=${item.id}">${item.name}</a>
                                </h4>
                                <h5>$${item.price}</h5>
                                <p class="card-text">${item.description}</p>
                                <p class="card-text">Stock: ${item.amount}</p>
                            </div>
                            <div class="card-footer">
                                <a href="/product?id=${item.id}"><button class="btn btn-info">Details</button></a>
                                <a href="/shop/order?id=${item.id}&quantity=1"><button class="btn btn-primary">Add to cart</button></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            </c:if>

            <c:if test="${total_page != 0}">
                <ul class="pagination">
                    <li class="page-item ${page <= 0 ? 'disabled' : ''}">
                        <a class="page-link" href="/index?page=${page - 1}&keyword=${keyword}" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>
                    <c:if test="${page > 0}">
                        <li class="page-item"><a class="page-link" href="/index?page=${page - 1}&keyword=${keyword}">
                                ${page}
                        </a></li>
                    </c:if>
                    <li class="page-item active" aria-current="page">
                        <a class="page-link" href="#">${page + 1} <span class="sr-only">(current)</span></a>
                    </li>
                    <c:if test="${page < total_page - 1}">
                        <li class="page-item"><a class="page-link" href="/index?page=${page + 1}&keyword=${keyword}">${page + 2}</a></li>
                    </c:if>
                    <li class="page-item ${page >= total_page - 1 ? 'disabled' : ''}">
                        <a class="page-link" href="/index?page=${page + 1}&keyword=${keyword}">Next</a>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
