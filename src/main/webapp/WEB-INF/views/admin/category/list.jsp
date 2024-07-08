<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <a href="/admin/category/create" class="btn btn-success">Create new category</a>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listCate}" var="a" varStatus="i">
            <tr>
                <th scope="row">${i.index +1}</th>
                <td>${a.id}</td>
                <td>${a.name}</td>
                <td>
                    <a href="/admin/category/update/${a.id}" class="btn btn-warning">Update</a>
                    <a onclick="return confirm('Bạn có muốn nhóm sản phẩm này chứ')" href="/admin/category/delete/${a.id}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>