<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
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

<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<!-- ✅ HERO -->
<div class="container mt-5 text-center">
  <h2 class="mb-3">Welcome to Plant Nursery Management 🌿</h2>
  <p class="text-muted">Buy fresh plants for your beautiful home </p>
<p class="lead text-center mt-4">
Welcome to our <strong>Plant Nursery Management System</strong> 🌱 — a smart and efficient solution designed to simplify nursery operations. 
This system helps manage plant inventory, track stock availability, process customer orders, and monitor expenses and profits in real-time. 
With secure login, user-friendly interface, and mobile-friendly design, it ensures smooth and hassle-free management of your nursery business. 
Grow your business digitally and make plant management smarter, faster, and more reliable.
</p>
  <a href="${pageContext.request.contextPath}/plants"
     class="btn btn-success m-2">Browse Plants</a>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
