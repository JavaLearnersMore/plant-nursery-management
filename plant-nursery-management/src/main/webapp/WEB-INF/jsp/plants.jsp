<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Plants - Nursery</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .plant-card {
            transition: 0.3s;
            border-radius: 15px;
        }

        .plant-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .plant-img {
            height: 180px;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .stock-low {
            color: red;
            font-weight: bold;
        }

        .stock-ok {
            color: green;
            font-weight: bold;
        }

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

<body class="bg-light">

<!-- ✅ HEADER -->
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<div class="container mt-4 main-content">

    <!-- 🔍 SEARCH -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <form method="get" action="${pageContext.request.contextPath}/plants">
                <div class="row">

                    <div class="col-md-4">
                        <input type="text"
                               name="search"
                               value="${search}"
                               class="form-control"
                               placeholder="🔍 Search plants...">
                    </div>

                    <div class="col-md-2">
                        <button class="btn btn-success w-100">Search</button>
                    </div>

                    <!-- 👑 ADMIN ONLY -->
                    <sec:authorize access="hasRole('ADMIN')">
                        <div class="col-md-3">
                            <a href="${pageContext.request.contextPath}/add-plant"
                               class="btn btn-primary w-100">
                                ➕ Add Plant
                            </a>
                        </div>
                    </sec:authorize>

                </div>
            </form>
        </div>
    </div>

    <!-- 🌿 PLANTS GRID -->
    <div class="row">

        <c:choose>
            <c:when test="${empty plants}">
                <div class="alert alert-warning text-center">
                    No plants found 🌱
                </div>
            </c:when>

            <c:otherwise>
                <c:forEach var="p" items="${plants}">

                    <div class="col-md-4 mb-4">
                        <div class="card plant-card shadow-sm h-100">

                            <!-- IMAGE -->
                            <img src="${pageContext.request.contextPath}${p.imageUrl}"
                                 class="plant-img w-100"
                                 onerror="this.src='${pageContext.request.contextPath}/static/images/no-image.png'">

                            <div class="card-body">

                                <h5 class="card-title">${p.name}</h5>

                                <p class="text-muted mb-1">
                                    ₹${p.price}
                                </p>

                                <!-- STOCK -->
                                <p>
                                    Stock:
                                    <span class="${p.stock <= 5 ? 'stock-low' : 'stock-ok'}">
                                        ${p.stock}
                                    </span>
                                </p>

                                <!-- 🛒 ORDER BUTTON -->
                                <c:if test="${p.stock > 0}">
                                  <a href="${pageContext.request.contextPath}/orders/new?plantId=${p.id}"
									   class="btn btn-success w-100 mb-2">
									   🛒 Order Now
									</a>
                                </c:if>

                                <c:if test="${p.stock == 0}">
                                    <button class="btn btn-secondary w-100 mb-2" disabled>
                                       Out of Stock
                                    </button>
                                </c:if>

                                <!-- 👑 ADMIN CONTROLS -->
                                <sec:authorize access="hasRole('ADMIN')">
                                    <div class="d-flex gap-2">

                                        <a href="${pageContext.request.contextPath}/edit-plant/${p.id}"
                                           class="btn btn-warning btn-sm w-50">
                                            ✏ Edit
                                        </a>

                                        <a href="${pageContext.request.contextPath}/delete-plant/${p.id}"
                                           class="btn btn-danger btn-sm w-50"
                                           onclick="return confirm('Delete this plant?')">
                                            🗑 Delete
                                        </a>

                                    </div>
                                </sec:authorize>

                            </div>
                        </div>
                    </div>

                </c:forEach>
            </c:otherwise>
        </c:choose>

    </div>

    <!-- 📄 PAGINATION -->
    <c:if test="${totalPages > 1}">
        <nav>
            <ul class="pagination justify-content-center">

                <c:forEach begin="0" end="${totalPages-1}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/plants?page=${i}&search=${search}">
                            ${i+1}
                        </a>
                    </li>
                </c:forEach>

            </ul>
        </nav>
    </c:if>

</div>

<!-- ✅ FOOTER -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>