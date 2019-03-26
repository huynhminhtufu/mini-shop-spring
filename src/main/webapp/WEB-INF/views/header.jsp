<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/index">Shopping Online</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/index">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/shop/index">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin">AdminCP</a>
                    </li>
                    <c:url value="/j_spring_security_logout" var="logoutUrl" />
                    <li class="nav-item">
                        <a class="nav-link" href=${logoutUrl}>Logout</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/shop">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/signup">Signup</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>