<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../bootstrap.jsp"/>
<html>
<head>
    <title>Signup</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <form:form method="post" action="/auth/signup" modelAttribute="user" style="width: 100%">
                <div><h1>Sign Up</h1></div>
                <hr/>
                <div class="form-group">
                    <label>Username</label>
                    <form:input path="username" type="text" class="form-control" name="username" placeholder="Enter username" required="true"/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <form:input path="password" type="password" class="form-control" name="password" id="password" placeholder="Password" required="true"/>
                </div>
                <div class="form-group">
                    <label>Verify Password</label>
                    <input type="password" class="form-control" name="verifypassword" id="verifypassword" placeholder="Password" required="true" />
                </div>
                <button type="submit" class="btn btn-primary">Signup</button>
                <a href="/auth/login"><button type="button" class="btn btn-secondary">Login</button></a>
                <c:if test="${message != null}">
                    <div class="alert alert-primary" style="margin-top: 1rem;"><c:out value="${message}"/></div>
                </c:if>
                <div class="row mt-4">
                    <a href="/">Go Home</a>
                </div>
            </form:form>
        </div>
    </div>
    <script>
        var password = document.getElementById("password"), confirm_password = document.getElementById("verifypassword");

        function validatePassword(){
            if(password.value !== confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;
    </script>
</div>
</body>
</html>
