<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8"%>
<div class="container row">
    <div class="col-3 p-3 card">
        <form action="/admin/product">
            <div class="product-search-info mt-3">
                <label class="mb-1"><b>Tên sản phẩm:</b></label>
                <input name="keyword" id="keyword" value="${param.keyword}" class="form-control" placeholder="Nhập tên sản phẩm để tìm" />
            </div>

            <div class="brand-search-info mt-3">
                <label><b>Loại sản phẩm:</b></label>
                <div class="mt-2">
                    <input type="radio" name="categoryId" checked value=""/>
                    <span>Tất cả</span>
                </div>
                <c:forEach var="c" items="${listCategory}">
                    <div class="mt-1">
                        <input name="categoryId" type="radio" value="${c.id}"
                               <c:if test="${param.categoryId==c.id}">checked</c:if>
                        />
                        <span>${c.name}</span>
                    </div>
                </c:forEach>
            </div>
            <button onclick="" type="submit" class="btn btn-primary mt-4 mb-4">Tìm kiếm</button>
        </form>
    </div>
    <div class="col-9">
        <a href="/admin/product/create" class="btn btn-success">Create product</a>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Id</th>
                <th scope="col">Price</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Image</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listProduct.content}" var="a" varStatus="i">
                <tr>
                    <th scope="row">${i.index +1}</th>
                    <td>${a.id}</td>
                    <td>${a.price}</td>
                    <td>${a.name}</td>
                    <td>${a.category.name}</td>
                    <td>
                        <img src="${a.image}" width="100" height="125">
                    </td>
                    <td>
                        <a href="/admin/product/update/${a.id}" class="btn btn-warning">Update</a>
                        <a onclick="return confirm('Bạn có muốn xóa sản phẩm này chứ')" href="/admin/product/delete/${a.id}" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="/admin/product?keyword=${param.keyword}&categoryId=${param.categoryId}&page=0">&laquo;</a></li>
                <li class="page-item"><a class="page-link" id="next" href="/admin/product?keyword=${param.keyword}&categoryId=${param.categoryId}&page=${listProduct.number-1}" <c:if test="${listProduct.number <= 0}">onclick="return false;"</c:if> >&lsaquo;</a></li>
                <li class="page-item"><a class="page-link" href="/admin/product?keyword=${param.keyword}&categoryId=${param.categoryId}&page=${listProduct.number+1}"  <c:if test="${listProduct.number >= listProduct.totalPages-1}">onclick="return false;"</c:if> >&rsaquo;</a></li>
                <li class="page-item"><a class="page-link" href="/admin/product?keyword=${param.keyword}&categoryId=${param.categoryId}&page=${listProduct.totalPages-1}">&raquo;</a></li>
            </ul>
        </nav>
    </div>
</div>