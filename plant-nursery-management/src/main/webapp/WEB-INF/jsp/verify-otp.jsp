<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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

<div class="container mt-5" style="max-width:400px;">
    <h3 class="text-center">Verify OTP</h3>

    <c:if test="${not empty message}">
        <div class="alert alert-danger">${message}</div>
    </c:if>

    <form action="verify-login-otp" method="post">
        <input type="text" name="otp"
               class="form-control mb-3"
               placeholder="Enter OTP" required>

        <button class="btn btn-primary w-100">Verify OTP</button>
    </form>
</div>

</body>
</html>
