<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Plants</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .plant-img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 8px;
        }

        .table-card {
            border-radius: 15px;
        }

        .badge-stock {
            font-size: 13px;
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
<body class="bg-light">

<div class="container mt-4">

    <!-- HEADER -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="fw-bold">🌿 Admin Plant Management</h3>
        <a href="${pageContext.request.contextPath}/add-plant"
           class="btn btn-success">
            + Add Plant
        </a>
    </div>

    <!-- SEARCH (optional ready) -->
    <form method="get" action="${pageContext.request.contextPath}/admin/plants"
          class="row mb-3">

        <div class="col-md-4">
            <input type="text"
                   name="search"
                   value="${search}"
                   class="form-control"
                   placeholder="🔍 Search plant...">
        </div>

        <div class="col-md-2">
            <button class="btn btn-dark w-100">Search</button>
        </div>
    </form>

    <!-- TABLE -->
    <div class="card shadow table-card">
        <div class="card-body table-responsive">

            <table class="table table-hover align-middle text-center">

                <thead class="table-success">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th width="180">Action</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="p" items="${plants}">

                    <tr>
                        <td>${p.id}</td>

                        <td>
                            <img src="${pageContext.request.contextPath}${p.imageUrl}"
                                 class="plant-img"
                                 onerror="this.src='https://via.placeholder.com/70'">
                        </td>

                        <td class="fw-semibold">${p.name}</td>

                        <td>${p.category}</td>

                        <td class="text-success fw-bold">₹${p.price}</td>

                        <!-- STOCK BADGE -->
                        <td>
                            <c:choose>
                                <c:when test="${p.stock > 0}">
                                    <span class="badge bg-success badge-stock">
                                        In Stock (${p.stock})
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger badge-stock">
                                        Out of Stock
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <!-- ACTION BUTTONS -->
                        <td>

                            <a href="${pageContext.request.contextPath}/edit-plant/${p.id}"
                               class="btn btn-sm btn-primary">
                                ✏️ Edit
                            </a>

                            <a href="${pageContext.request.contextPath}/delete-plant/${p.id}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Delete this plant?')">
                                🗑 Delete
                            </a>

                        </td>
                    </tr>

                </c:forEach>

                <!-- EMPTY STATE -->
                <c:if test="${empty plants}">
                    <tr>
                        <td colspan="7" class="text-muted py-4">
                            No plants found
                        </td>
                    </tr>
                </c:if>

                </tbody>
            </table>

        </div>
    </div>

    <!-- PAGINATION (optional ready) -->
    <div class="mt-3 text-center">

        <c:forEach begin="0" end="${totalPages-1}" var="i">
            <a class="btn btn-sm btn-outline-success m-1"
               href="${pageContext.request.contextPath}/admin/plants?page=${i}&search=${search}">
                ${i+1}
            </a>
        </c:forEach>

    </div>

</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>
