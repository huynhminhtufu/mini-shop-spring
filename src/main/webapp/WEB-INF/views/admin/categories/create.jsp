<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-26
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../bootstrap.jsp"/>
<html>
<head>
    <title>Create</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h2>Create Category</h2>
            <hr/>
            <form:form method="post" action="./create" modelAttribute="category">
                <div class="form-group">
                    <label for="name">Category Name</label>
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Enter category name"/>
                </div>
                <button type="submit" class="btn btn-primary">Create new category</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
