<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Add Plant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
html, body {
    height: 100%;
    }

body {
    display: flex;
    flex-direction: column;
}

.main-content {
    flex: 1;
}

.footer {
    margin-top: auto;
}
</style>
</head>
<body>
<%@ include file="common/header.jsp" %>
<div class="container mt-4">
    <h3>🌱 Add New Plant</h3>

    <form:form method="post"
               action="${pageContext.request.contextPath}/save-plant"
               modelAttribute="plant"
               enctype="multipart/form-data">

        <form:input path="name" class="form-control mb-2" placeholder="Plant Name"/>
        <form:input path="category" class="form-control mb-2" placeholder="Category"/>
        <form:input path="price" class="form-control mb-2" placeholder="Price"/>
        <form:input path="stock" class="form-control mb-2" placeholder="Stock"/>
        <!-- IMAGE UPLOAD -->
        <input type="file" name="image" class="form-control mb-2"/>

        <form:textarea path="description" class="form-control mb-2" placeholder="Description"/>

        <button class="btn btn-success">Save</button>
    </form:form>

    <a href="${pageContext.request.contextPath}/home"
       class="btn btn-secondary mt-2">Back</a>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
