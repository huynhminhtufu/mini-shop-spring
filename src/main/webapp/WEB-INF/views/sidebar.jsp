<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-3">
    <h1 class="my-4">Mini Project</h1>

    <ul class="list-group mt-2">
        <li class="list-group-item active">User box</li>
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="principal" property="principal" />
            <li class="list-group-item">Hello, <strong>${principal.username}</strong></li>
            <c:url value="/j_spring_security_logout" var="logoutUrl" />
            <li class="list-group-item"><a href=${logoutUrl}>Logout</a></li>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <li class="list-group-item"><a href="/auth/login">Login</a></li>
            <li class="list-group-item"><a href="/auth/signup">Signup</a></li>
        </sec:authorize>
    </ul>

    <div class="list-group mt-4 mb-4">
        <c:forEach var="item" items="${listCategory}" varStatus="status">
            <c:if test="${status.first}">
                <span class="list-group-item active">Categories</span>
            </c:if>
            <a href="/category?id=${item.id}" class="list-group-item">${item.name}</a>
        </c:forEach>
    </div>
</div>