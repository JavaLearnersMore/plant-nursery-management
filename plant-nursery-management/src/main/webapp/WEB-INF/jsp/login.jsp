<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Nursery Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background: linear-gradient(135deg, #43cea2, #185a9d);
    height: 100vh;
}
.login-card {
    border-radius: 15px;
}
.otp-box {
    display: none;
}
</style>
</head>
<script>
function sendOtp() {

    const form = document.getElementById("loginForm");
    const formData = new FormData(form);
    fetch("${pageContext.request.contextPath}/send-otp-login", {
        method: "POST",
        body: formData
    })
    .then(res => res.text())
    .then(data => {

         if (data === "OTP_SENT") {
            // hide login form
            document.getElementById("loginForm").style.display = "none";
            // show otp box
            document.querySelector(".otp-box").style.display = "block";
        } else {
            alert("Invalid username or password");
        }

    })
    .catch(err => {
        console.error(err);
        alert("Server error");
    });
}
</script>

<body>
<div class="container">
  <div class="row justify-content-center align-items-center" style="height:100vh;">
    <div class="col-md-4">
      <div class="card shadow login-card">
        <div class="card-header text-center bg-success text-white">
          <h4>Nursery Login</h4>
        </div>
        <div class="card-body">

          <!-- ================= STEP 1 LOGIN ================= -->
          <form id="loginForm"
                method="post"
                action="${pageContext.request.contextPath}/send-otp-login">
            <div class="mb-2">
              <input name="username"
                     class="form-control"
                     placeholder="Username"
                     required>
            </div>
            <div class="mb-2">
              <input name="password"
                     type="password"
                     class="form-control"
                     placeholder="Password"
                     required>
            </div>
            <button type="button"
             onclick="sendOtp()"
             class="btn btn-success w-100">
            Login & Send OTP
           </button>
          </form>

          <!-- ================= OTP VERIFY ================= -->
          <form id="otpForm"
                class="otp-box mt-3"
                method="post"
                action="${pageContext.request.contextPath}/verify-otp">

            <input type="hidden" name="username" value="${sessionScope.otpUser}">

            <div class="mb-2">
              <input name="otp"
                     class="form-control"
                     placeholder="Enter OTP"
                     required>
            </div>

            <button type="submit"
                    class="btn btn-primary w-100">
              Verify OTP
            </button>

            <div class="text-center mt-2">
              <a href="${pageContext.request.contextPath}/resend-otp">
                Resend OTP
              </a>
            </div>
          </form>

          <!-- ================= ERROR ================= -->
          <%
            if (request.getParameter("error") != null) {
          %>
            <div class="alert alert-danger mt-3 text-center">
              Invalid username or password
            </div>
          <%
            }
          %>

          <%
            if (request.getParameter("otpError") != null) {
          %>
            <div class="alert alert-danger mt-3 text-center">
              Invalid or Expired OTP
            </div>
          <%
            }
          %>

          <!-- ================= REGISTER ================= -->
          <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/register">
              Create Account
            </a>
          </div>

        </div>
      </div>

    </div>
  </div>
</div>

<!-- ================= JS ================= -->
<script>
/* show OTP box after password success */
<%
    if (session.getAttribute("showOtp") != null) {
%>
    document.getElementById("loginForm").style.display = "none";
    document.querySelector(".otp-box").style.display = "block";
<%
    }
%>
</script>

</body>
</html>
