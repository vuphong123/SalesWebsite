<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<table class="table">
    <thead>
        <tr>
            <th>Sản phẩm</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${cart.items}">
            <form action="/cart/update/${item.product.id}" method="post">
                <input type="hidden" name="id" value="${item.product.id}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price * item.quantity}</td>
                </tr>
            </form>
        </c:forEach>
    </tbody>
</table>
<div class="my-2">Tổng số tiền: ${cart.amount}</div>
<form method="POST" action="/purchase" id="purchase">
    <div>
        <label class="mb-1">Địa chỉ nhận hàng:</label>
        <textarea class="form-control" rows="2" name="address"></textarea>
    </div>
    <div>
        <button class="mt-2 btn btn-primary" type="button" onclick="check('purchase')">Đặt mua</button>
    </div>
</form>
<script>
    check = function (value){
        Swal.fire({
                icon: "success",
                title: "Đặt hàng thành công",
                showConfirmButton: false,
                timer: 1500,
            }).then((confirms) => {
                if (confirms) {
                    document.getElementById(value).submit();
                }
            });
            // Swal.fire({
            //     icon: "success",
            //     title: "Đặt hàng thành công",
            //     showConfirmButton: true,
            //     showDenyButton: true,
            //     confirmButtonText: "Save",
            // }).then((result) => {
            //     if (result.isConfirmed) {
            //         document.getElementById(value).submit();
            //     }
            // });
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>