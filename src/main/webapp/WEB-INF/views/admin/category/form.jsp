<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form:form class="container" action="/admin/category/create/save" modelAttribute="category" enctype="multipart/form-data" method="post">
    <div class="mb-3">
    <label class="form-label">Name</label>
    <form:input path="name" class="form-control"></form:input>
    <form:errors class="text-danger" path="name"></form:errors>
    </div>
    <button <c:if test="${category.id != null}">formaction="/admin/category/update/save/${category.id}" </c:if> class="btn btn-primary">Save</button>
</form:form>