<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Update User</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #43cea2, #185a9d);
}
.card {
    border-radius: 15px;
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
<!-- ✅ NAVBAR INCLUDE -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-success text-white text-center">
                    <h4>✏️ Update User</h4>
                </div>

                <div class="card-body">

                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/update-user">

                        <!-- hidden id -->
                        <input type="hidden" name="id" value="${user.id}">

                        <!-- username (readonly) -->
                        <div class="mb-3">
                            <label>Username</label>
                            <input type="text"
                                   class="form-control"
                                   value="${user.username}"
                                   readonly>
                        </div>

                        <!-- full name -->
                        <div class="mb-3">
                            <label>Full Name</label>
                            <input type="text"
                                   name="fullName"
                                   value="${user.fullName}"
                                   class="form-control"
                                   required>
                        </div>

                        <!-- email -->
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email"
                                   name="email"
                                   value="${user.emailId}"
                                   class="form-control"
                                   required>
                        </div>

                        <!-- mobile -->
                        <div class="mb-3">
                            <label>Mobile</label>
                            <input type="text"
                                   name="mobileNumber"
                                   value="${user.mobileNumber}"
                                   class="form-control"
                                   required>
                        </div>
                        <!-- Address -->
                        <div class="mb-3">
                            <label>Address</label>
                            <input type="text"
                                   name="address"
                                   value="${user.address}"
                                   class="form-control"
                                   required>
                        </div>

                        <!-- role -->
                        <div class="mb-3">
                            <label>Role</label>
                            <select name="role" class="form-select">
                                <option value="ROLE_USER"
                                    ${user.role=='ROLE_USER'?'selected':''}>
                                    USER
                                </option>
                                <option value="ROLE_ADMIN"
                                    ${user.role=='ROLE_ADMIN'?'selected':''}>
                                    ADMIN
                                </option>
                            </select>
                        </div>

                        <!-- enabled -->
                        <div class="mb-3">
                            <label>Status</label>
                            <select name="enabled" class="form-select">
                                <option value="true"
                                    ${user.enabled ? 'selected' : ''}>
                                    Active
                                </option>
                                <option value="false"
                                    ${!user.enabled ? 'selected' : ''}>
                                    Disabled
                                </option>
                            </select>
                        </div>

                        <button class="btn btn-success w-100">
                            Update User
                        </button>

                        <a href="${pageContext.request.contextPath}/admin/users"
                           class="btn btn-secondary w-100 mt-2">
                           Cancel
                        </a>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>
<!-- ✅ FOOTER INCLUDE -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp">
</body>
</html>
