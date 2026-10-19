<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Contact</title>
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
<h2>Contact Us 📞</h2>

<p>Email: support@nursery.com</p>
<p>Phone: +91 7498555197</p>
<p>Location: India</p>

</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
