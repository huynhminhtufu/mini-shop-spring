<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../bootstrap.jsp"/>
<html>
<head>
    <title>Login</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
        <form method="post" action="<c:url value='/j_spring_security_check'/>" style="width: 100%">
            <div><h1>Login Page</h1></div>
            <hr/>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="username" placeholder="Enter username">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <a href="/auth/signup"><button type="button" class="btn btn-secondary">Signup</button></a>
            <c:if test="${message != null}">
                <div class="alert alert-primary" style="margin-top: 1rem;"><c:out value="${message}"/></div>
            </c:if>
            <div class="row mt-4">
                <a href="/">Go Home</a>
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>
