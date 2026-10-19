<h3 class="text-center mt-5">Forgot Password</h3>

<form method="post"
      action="${pageContext.request.contextPath}/send-login-otp"
      class="container col-md-4">

    <input name="username"
           class="form-control mb-3"
           placeholder="Enter Username"
           required/>

    <button class="btn btn-success w-100">
        Send OTP
    </button>
</form>
