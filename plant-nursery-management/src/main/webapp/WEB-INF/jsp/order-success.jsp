<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Success</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background:#f5f7fa;
}
.card {
    border-radius:12px;
}
</style>

</head>
<body>
<div class="container mt-5">

    <div class="card shadow text-center p-5">

        <h2 class="text-success mb-3">🎉 Order Placed!</h2>

        <p class="fs-5">${successMsg}</p>

        <a href="${pageContext.request.contextPath}/orders/new"
           class="btn btn-success mt-3">➕ New Order</a>

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="btn btn-primary mt-3">🏠 Dashboard</a>

    </div>
</div>

</body>
</html>