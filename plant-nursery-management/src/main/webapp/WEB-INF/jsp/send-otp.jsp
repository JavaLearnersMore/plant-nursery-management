<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Send OTP</title>
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
    <h3 class="text-center">Enter Mobile</h3>

    <form action="send-login-otp" method="post">
        <input type="text" name="mobile"
               class="form-control mb-3"
               placeholder="+91XXXXXXXXXX" required>

        <button class="btn btn-success w-100">Send OTP</button>
    </form>
</div>

</body>
</html>
