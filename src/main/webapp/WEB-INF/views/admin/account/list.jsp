<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <a href="/admin/account/create" class="btn btn-success">Create new account</a>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">User name</th>
            <th scope="col">Email</th>
            <th scope="col">Full name</th>
            <th scope="col">Password</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listAccount}" var="a" varStatus="i">
            <tr>
                <th scope="row">${i.index +1}</th>
                <td>${a.username}</td>
                <td>${a.email}</td>
                <td>${a.fullname}</td>
                <td>${a.password}</td>
                <td>
                    <a href="/admin/account/update/${a.username}" class="btn btn-warning">Update</a>
                    <a onclick="return confirm('Bạn có muốn xóa tài khoản này chứ')" href="/admin/account/delete/${a.username}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>