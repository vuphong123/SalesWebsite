<%@ page pageEncoding="utf-8"%>
<%--<div class="wrapper">--%>
    <aside id="sidebar">
        <div class="d-flex">
            <button class="toggle-btn" type="button">
                <i class="lni lni-grid-alt"></i>
            </button>
            <div class="sidebar-logo">
                <a href="/">PhongShop</a>
            </div>
        </div>
        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a href="/admin/main" class="sidebar-link">
                    <i class="lni lni-home"></i>
                    <span>Trang chủ</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="/admin/account" class="sidebar-link">
                    <i class="lni lni-user"></i>
                    <span>Người dùng</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                   data-bs-target="#product" aria-expanded="false" aria-controls="product">
                    <i class="lni lni-shopping-basket"></i>
                    <span>Quản lý sản phẩm</span>
                </a>
                <ul id="product" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">Tất cả sản phẩm</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">Thêm sản phẩm</a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                   data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
                    <i class="lni lni-bar-chart"></i>
                    <span>Thống kê</span>
                </a>
                <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">Hóa đơn</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">Doanh thu</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">Loại sản phẩm</a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-popup"></i>
                    <span>Notification</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-cog"></i>
                    <span>Setting</span>
                </a>
            </li>
        </ul>
        <div class="sidebar-footer">
            <a href="#" class="sidebar-link">
                <i class="lni lni-exit"></i>
                <span>Logout</span>
            </a>
        </div>
    </aside>
<%--    <div class="main p-3">--%>
<%--        <div class="text-center">--%>
<%--            <h1>--%>
<%--                Sidebar Bootstrap 5--%>
<%--            </h1>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
