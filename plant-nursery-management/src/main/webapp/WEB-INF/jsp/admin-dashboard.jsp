<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	<%@ include file="common/header.jsp"%>
	<div class="container mt-5">
		<h2>🧾 Admin Dashboard</h2>

		<div class="row mt-4">

			<div class="col-md-3">
				<div class="card text-center shadow">
					<div class="card-body">
						<h5>Manage Plants</h5>
						<a href="${pageContext.request.contextPath}/add-plant"
							class="btn btn-success btn-sm">Add Plant</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-md-3">
				<div class="card text-center shadow">
					<div class="card-body">
						<h5>Manage Users</h5>
						<a href="${pageContext.request.contextPath}/users"
							class="btn btn-success btn-sm">Users</a>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="row mt-4">

    <div class="col-md-3">
        <div class="card text-center shadow bg-success text-white">
            <div class="card-body">
                <h5>Total Sales</h5>
                <h4>₹ ${sales}</h4>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card text-center shadow bg-danger text-white">
            <div class="card-body">
                <h5>Total Expenses</h5>
                <h4>₹ ${expenses}</h4>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card text-center shadow bg-primary text-white">
            <div class="card-body">
                <h5>Net Profit</h5>
                <h4>₹ ${profit}</h4>
            </div>
        </div>
    </div>

</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>
