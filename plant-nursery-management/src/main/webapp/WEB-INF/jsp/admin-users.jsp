<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - User Management</title>
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

<!-- <nav class="navbar navbar-dark bg-success"> -->
<!--     <div class="container"> -->
<!--         <a class="navbar-brand" href="/admin/dashboard">🌱 Admin Dashboard</a> -->
<!--         <a href="/logout" class="btn btn-light btn-sm">Logout</a> -->
<!--     </div> -->
<!-- </nav> -->

<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<div class="container mt-5">
    <h2 class="text-center mb-4">User Management</h2>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email Address</th>
                <tH>mobileNumber</tt></th>
                <th>Address</th>
                <th>Role</th>
                <th>Login Attempts</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.emailId}</td>
                    <td>${user.mobileNumber}</td>
                    <td>${user.address}</td>
                    <td>${user.role}</td>
                    <td>${user.loginAttempts}</td>
                    <td>
					    <a href="${pageContext.request.contextPath}/admin/update-user/${user.id}"
					       class="btn btn-warning btn-sm">Edit</a>
					    <a href="${pageContext.request.contextPath}/admin/delete-user/${user.id}"
					       class="btn btn-danger btn-sm"
					       onclick="return confirm('Delete this user?')">
					       Delete
					    </a>
                    </td>

                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">Back to Dashboard</a>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>
