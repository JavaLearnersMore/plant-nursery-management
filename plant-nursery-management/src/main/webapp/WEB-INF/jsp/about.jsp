<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>About</title>
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
<%@ include file="common/header.jsp" %>
<div class="container mt-5">
<h2>About Our Nursery 🌱</h2>
<p>
Plant Nursery Management System is a web-based application designed to simplify and automate
the daily operations of plant nursery. <br> It helps in managing plant inventory, customer orders,
expenses, and overall business activities efficiently.<br> We provide high-quality indoor and outdoor plants 
at affordable prices.Our mission is to make every home green and fresh. The system reduces manual work, improves
accuracy, and ensures proper record keeping. With a user-friendly interface and secure access, it helps 
administrators handle daily nursery activities smoothly and efficiently.
</p>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
