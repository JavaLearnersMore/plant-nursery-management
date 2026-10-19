<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>Orders</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.order-card{
    border-radius:14px;
    box-shadow:0 6px 18px rgba(0,0,0,0.08);
    margin-bottom:25px;
    transition: 0.2s ease;
}
.order-card:hover{
    transform: translateY(-3px);
}
.order-title{
    font-weight:600;
}
.summary-row{
    background:#f9fafb;
    font-weight:600;
}
</style>
</head>

<body>

<%@ include file="common/header.jsp"%>

<div class="container mt-4">

    <h3 class="mb-4">🧾 Orders List</h3>

    <!-- If no orders -->
    <c:if test="${empty orders}">
        <div class="alert alert-info">No orders found.</div>
    </c:if>

    <c:forEach items="${orders}" var="o">

        <div class="card order-card">
            <div class="card-body">

                <div class="row">
                    <div class="col-md-6">
                        <h5 class="order-title">Order #${o.id}</h5>
                        <p class="mb-1"><strong>Customer:</strong> ${o.customerName}</p>
                        <p class="mb-1"><strong>Mobile:</strong> ${o.mobileNumber}</p>
                        <p class="mb-1">
                            <strong>Date:</strong>
                            <fmt:formatDate value="${o.orderDate}" pattern="dd MMM yyyy"/>
                        </p>
                    </div>

                    <div class="col-md-6 text-end">
                        <h4 class="text-success">₹ ${o.totalAmount}</h4>

                        <span class="badge
                            ${o.status=='PLACED' ? 'bg-primary' :
                              o.status=='PAID' ? 'bg-success' :
                              o.status=='CANCELLED' ? 'bg-danger' :
                              'bg-secondary'}">
                            ${o.status}
                        </span>
                    </div>
                </div>

                <hr>

                <h6>🌿 Plants Ordered</h6>

                <table class="table table-sm table-bordered mt-2">
                    <thead class="table-light">
                        <tr>
                            <th>Plant Name</th>
                            <th width="80">Qty</th>
                            <th width="120">Price</th>
                            <th width="120">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>

                    <c:set var="totalQty" value="0" />

                    <c:forEach items="${o.items}" var="item">
                        <tr>
                            <td>${item.plant.name}</td>
                            <td>${item.quantity}</td>
                            <td>₹ ${item.price}</td>
                            <td>₹ ${item.subtotal}</td>
                        </tr>

                        <!-- calculate total plants -->
                        <c:set var="totalQty" value="${totalQty + item.quantity}" />
                    </c:forEach>

                    <!-- summary -->
                    <tr class="summary-row">
                        <td colspan="1">Total Plants</td>
                        <td colspan="3">${totalQty}</td>
                    </tr>

                    </tbody>
                </table>

            </div>
        </div>

    </c:forEach>

</div>

<%@ include file="common/footer.jsp"%>

</body>
</html>