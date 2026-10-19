<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Verify OTP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="col-md-4 offset-md-4">
    <div class="card shadow">
      <div class="card-header text-center">
        <h4>🔐 Enter OTP</h4>
      </div>
      <div class="card-body">

        <form method="post" action="verify-otp">
          <input name="otp" class="form-control mb-3" placeholder="Enter OTP">
          <button class="btn btn-success w-100">Verify</button>
        </form>

        <div class="text-center mt-3">
          <a href="resend-otp">Resend OTP</a>
        </div>

      </div>
    </div>
  </div>
</div>

</body>
</html>
