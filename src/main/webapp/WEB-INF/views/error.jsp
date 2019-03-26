<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="bootstrap.jsp"/>
<html>
<head>
    <title>Error</title>
</head>
<body>
<div class="container">
    <div class="row">
        <h2>Error ${message}, please go back.</h2>
        <hr/>
        <button class="btn btn-primary" onclick="window.history.go(-1); return false;" type="button">Go back</button>
    </div>
</div>
</body>
</html>
