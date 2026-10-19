<%@ page contentType="text/html;charset=UTF-8" %>

<!-- 🌱 NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success shadow">
  <div class="container">

    <a class="navbar-brand fw-bold"
       href="${pageContext.request.contextPath}/home">
       🌱 Plant Nursery
    </a>

    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">

      <!-- RIGHT SIDE MENU -->
      <ul class="navbar-nav ms-auto align-items-lg-center">

        <li class="nav-item">
          <a class="nav-link"
             href="${pageContext.request.contextPath}/home">Home</a>
        </li>

        <li class="nav-item">
          <a class="nav-link"
             href="${pageContext.request.contextPath}/plants">Plants</a>
        </li>

        <li class="nav-item">
          <a class="nav-link"
             href="${pageContext.request.contextPath}/about">About</a>
        </li>

        <li class="nav-item">
          <a class="nav-link"
             href="${pageContext.request.contextPath}/contact">Contact</a>
        </li>

        <li class="nav-item">
          <a class="nav-link"
             href="${pageContext.request.contextPath}/orders/new">Order</a>
        </li>

        <!-- Logout Button -->
        <li class="nav-item ms-lg-2">
          <a href="${pageContext.request.contextPath}/logout"
             class="btn btn-light btn-sm fw-bold">
             Logout
          </a>
        </li>

      </ul>

    </div>
  </div>
</nav>
