<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/static/css/main.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary p-0">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">PhongShop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
<%--      <div class="navbar-nav">--%>
<%--        <a class="nav-item nav-link active" href="/">Sản phẩm</a>--%>
<%--        <a class="nav-item nav-link" href="/about">Giới thiệu</a>--%>
<%--      </div>--%>
      <form class="d-flex nav-item m-2 ms-auto" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
      <ul class="navbar-nav ms-auto d-flex">
        <li class="nav-item no-arrow">
          <a href="/cart" class="nav-link m-2 text-light">
            <img alt="" style="width:35px"
                 src="/static/images/cart.png" />
            (${cart.total})
            <c:if test="${username.getUsername() !=null}">${username.getUsername()}</c:if>
          </a>
        </li>
        <li class="nav-item no-arrow">
          <a class="nav-link dropdown-toggle p-0" data-bs-toggle="dropdown" href="#">
            <img alt="" class="rounded-circle" style="width:60px"
                 src="/static/images/user.svg" />
          </a>
          <div class="dropdown-menu dropdown-menu-end">
            <c:if test="${sessionScope.account != null}">
              <a class="dropdown-item" href="/logout">
                Đăng xuất
              </a>
            </c:if>
            <c:if test="${sessionScope.account == null}">
              <a class="dropdown-item" href="/login">
                Đăng nhập
              </a>
            </c:if>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>