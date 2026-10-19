<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nursery.entity.Plant" %>
<%
    List<Plant> plantList = (List<Plant>) request.getAttribute("plants");
%>
<!DOCTYPE html>
<html>
<head>
<title>New Order</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { background:#f5f7fa; }
.card { border-radius:12px; }
.table th { background:#198754; color:white; }
.total-box { font-size:22px; font-weight:bold; color:#198754; }
.btn-remove { background:#dc3545; color:white; }
</style>

<script>
let rowIndex = 1;
function updatePrice(select){
    let row = select.closest("tr");
    let price = select.options[select.selectedIndex].dataset.price || 0;

    row.querySelector(".price").innerText = price;
    calculateSubtotal(row);
}
function calculateSubtotal(row){
    let qty = row.querySelector(".qty").value || 0;
    let price = row.querySelector(".price").innerText || 0;

    let subtotal = qty * price;
    row.querySelector(".subtotal").innerText = subtotal.toFixed(2);
    calculateTotal();
}
function calculateTotal(){
    let total = 0;
    document.querySelectorAll(".subtotal").forEach(cell=>{
        total += parseFloat(cell.innerText) || 0;
    });
    document.getElementById("total").innerText = total.toFixed(2);
}
function addRow(){
    let table = document.getElementById("orderTable").getElementsByTagName('tbody')[0];
    let row = table.insertRow();
    row.innerHTML = `
    <td>
        <select name="items[${rowIndex}].plant.id" class="form-select" onchange="updatePrice(this)" required>
            <option value="">Select Plant</option>
            <% for(Plant p : plantList){ %>
                <option value="<%=p.getId()%>" data-price="<%=p.getPrice()%>">
                    <%=p.getName()%> (₹<%=p.getPrice()%>)
                </option>
            <% } %>
        </select>
    </td>
    <td>
        <input type="number" name="items[${rowIndex}].quantity"
               class="form-control qty" value="1" min="1" required
               oninput="calculateSubtotal(this.closest('tr'))">
    </td>
    <td class="price">0</td>
    <td class="subtotal">0</td>
    <td>
        <button type="button" class="btn btn-sm btn-remove" onclick="removeRow(this)">✖</button>
    </td>
    `;
    rowIndex++;
}
function removeRow(btn){
    btn.closest("tr").remove();
    calculateTotal();
}
</script>

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
<div class="container mt-4">

<div class="card shadow p-4">

<h3 class="text-success mb-4">🌿 New Order</h3>
<c:if test="${not empty successMsg}">
    <div class="alert alert-success">
        ${successMsg}
    </div>
</c:if>
<form action="${pageContext.request.contextPath}/orders/save" method="post">

<!-- Customer -->
<div class="row g-3">

<div class="col-md-3">
<label>Name</label>
<input type="text" name="customerName" class="form-control" required>
</div>

<div class="col-md-3">
<label>Mobile</label>
<input type="text" name="mobileNumber" class="form-control" required>
</div>

<div class="col-md-3">
<label>Email</label>
<input type="email" name="email" class="form-control">
</div>

<div class="col-md-3">
<label>Address</label>
<input type="text" name="address" class="form-control">
</div>
</div>
<!-- Table -->
<div class="table-responsive mt-4">
<table class="table table-bordered text-center" id="orderTable">

<thead>
<tr>
<th>🌱 Plant</th>
<th>Qty</th>
<th>Price</th>
<th>Subtotal</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<select name="items[0].plant.id" class="form-select" onchange="updatePrice(this)" required>
<option value="">Select Plant</option>
<% for(Plant p : plantList){ %>
<option value="<%=p.getId()%>" data-price="<%=p.getPrice()%>">
<%=p.getName()%> (₹<%=p.getPrice()%>)
</option>
<% } %>
</select>
</td>

<td>
<input type="number" name="items[0].quantity"
class="form-control qty" value="1" min="1" required
oninput="calculateSubtotal(this.closest('tr'))">
</td>

<td class="price">0</td>
<td class="subtotal">0</td>
<td>
<button type="button" class="btn btn-sm btn-remove" onclick="removeRow(this)">✖</button>
</td>
</tr>

</tbody>
</table>
</div>
<!-- Footer -->
<div class="d-flex justify-content-between mt-3">

<button type="button" class="btn btn-primary" onclick="addRow()">➕ Add Plant</button>

<div class="total-box">
Total: ₹ <span id="total">0.00</span>
</div>

</div>
<div class="text-end mt-4">
<button type="submit" class="btn btn-success btn-lg">💾 Place Order</button>
</div>
</form>
</div>

</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>