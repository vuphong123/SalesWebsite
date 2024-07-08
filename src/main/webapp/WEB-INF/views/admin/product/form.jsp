<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<style>
    .image-upload-container {
        display: flex;
        align-items: center;
    }
    #imagePreview {
        max-width: 100px;
        max-height: 100px;
        margin-left: 15px;
    }
    #imageUpdate {
        max-width: 100px;
        max-height: 100px;
        margin-left: 15px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<form:form class="container" action="/admin/product/create/save" modelAttribute="product" enctype="multipart/form-data">
    <div class="mb-3">
        <label class="form-label">Name</label>
        <form:input path="name" class="form-control"></form:input>
        <form:errors class="text-danger" path="name"></form:errors>
    </div>
    <div class="mb-3">
        <label class="form-label">Price</label>
        <form:input path="price" class="form-control" ></form:input>
        <form:errors class="text-danger" path="price"></form:errors>
    </div>
    <div class="container mt-5">
        <div class="image-upload-container">
            <div class="form-group">
                <label class="form-label">Image</label>
                <input type="file" class="form-control" id="imageUpload" name="anh" accept="image/*" multiple="multiple">
            </div>
            <img id="imagePreview" alt="Image Preview">
            <c:if test="${product.image != null}">
                <img id="imageUpdate" src="${product.image}" alt="Image Update">
            </c:if>
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label">Category</label>
        <form:select path="category" cssClass="form-select">
            <form:options items="${listCategory}" itemValue="id" itemLabel="name"></form:options>
        </form:select>
    </div>
    <button <c:if test="${product.id != null}">formaction="/admin/product/update/save/${product.id}" </c:if> class="btn btn-primary">Save</button>
</form:form>
<script>
        document.getElementById('imageUpload').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
        const img = document.getElementById('imagePreview');
        img.src = e.target.result;
        img.style.display = 'block';
    };
        reader.readAsDataURL(file);
    }
    });
</script>