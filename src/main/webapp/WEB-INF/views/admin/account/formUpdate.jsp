<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form:form class="container" modelAttribute="account" enctype="multipart/form-data" method="post">
    <div class="mb-3">
        <label class="form-label">Name</label>
        <form:input path="username" class="form-control"></form:input>
        <form:errors class="text-danger" path="username"></form:errors>
    </div>
    <div class="mb-3">
        <label class="form-label">Password</label>
        <form:input path="password" class="form-control"></form:input>
        <form:errors class="text-danger" path="password"></form:errors>
    </div>
    <div class="mb-3">
        <label class="form-label">Fullname</label>
        <form:input path="fullname" class="form-control"></form:input>
        <form:errors class="text-danger" path="fullname"></form:errors>
    </div>
    <div class="mb-3">
        <label class="form-label">Email</label>
        <form:input path="email" class="form-control"></form:input>
        <form:errors class="text-danger" path="email"></form:errors>
    </div>
    <button formaction="/admin/account/update/save/${account.username}" class="btn btn-primary">Save</button>
</form:form>