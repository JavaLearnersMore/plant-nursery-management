<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Create Account</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #11998e, #38ef7d);
    min-height: 100vh;
}

.register-card {
    border-radius: 18px;
}

.form-control:focus {
    box-shadow: none;
    border-color: #28a745;
}
</style>

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
<div class="container">
  <div class="row justify-content-center align-items-center" style="min-height:100vh;">
    <div class="col-md-6">

      <div class="card shadow register-card">
        <div class="card-header text-center bg-success text-white">
          <h4>🌱 Create Nursery Account</h4>
        </div>
        <div class="card-body">
          <form method="post"
                action="${pageContext.request.contextPath}/register">
            <!-- Full Name -->
            <div class="mb-2">
              <label>Full Name</label>
              <input name="fullName"
                     class="form-control"
                     required>
            </div>
            <!-- SUsername -->
            <div class="mb-2">
              <label>Username</label>
              <input name="username"
                     class="form-control"
                     required>
            </div>
            <!-- Email -->
            <div class="mb-2">
              <label>Email</label>
              <input name="emailId"
                     type="email"
                     class="form-control"
                     required>
            </div>

            <!-- Mobile -->
            <div class="mb-2">
              <label>Mobile Number</label>
              <input name="mobileNumber"
                     pattern="[0-9]{10}"
                     class="form-control"
                     placeholder="10 digit mobile"
                     required>
            </div>

            <!-- Password -->
            <div class="mb-2">
              <label>Password</label>
              <input name="password"
                     type="password"
                     class="form-control"
                     required>
            </div>
            <!-- Confirm Password -->
            <div class="mb-2">
              <label>Confirm Password</label>
              <input name="confirmPassword"
                     type="password"
                     class="form-control"
                     required>
            </div>
            <!-- Role -->
            <div class="mb-3">
              <label>Register As</label>
              <select name="role" class="form-control" required>
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
              </select>
            </div>
             <!-- Address -->
            <div class="mb-2">
              <label>Address</label>
              <input name="address"
                     class="form-control"
                     required>
            </div>
            <!-- Terms -->
            <div class="form-check mb-3">
              <input class="form-check-input"
                     type="checkbox"
                     required>
              <label class="form-check-label">
                I agree to Terms & Conditions
              </label>
            </div>

            <button class="btn btn-success w-100">
              Create Account
            </button>

          </form>

          <!-- Login link -->
          <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login">
              Already have account? Login
            </a>
          </div>

          <!-- error -->
          <%
            if (request.getParameter("error") != null) {
          %>
            <div class="alert alert-danger mt-3 text-center">
              Registration failed. Username or Email exists.
            </div>
          <%
            }
          %>

        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>
