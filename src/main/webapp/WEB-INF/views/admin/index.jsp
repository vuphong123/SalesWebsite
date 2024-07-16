<%--
  Created by IntelliJ IDEA.
  User: vutua
  Date: 7/16/2024
  Time: 7:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid pt-4 px-0">
  <div class="row g-4">
    <div class="col-sm-12 col-md-6 col-xl-4">
      <div class="h-100 bg-light rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-2">
          <h6 class="mb-0">Messages</h6>
          <a href="">Hiển thị tất cả</a>
        </div>
        <div class="d-flex align-items-center border-bottom py-3">
          <img class="rounded-circle flex-shrink-0" src="/static/images/users/user1.jpg" alt=""
               style="width: 40px; height: 40px;">
          <div class="w-100 ms-3">
            <div class="d-flex w-100 justify-content-between">
              <h6 class="mb-0">Vũ Tuấn Phong</h6>
              <small>15 minutes ago</small>
            </div>
            <span>Short message goes here...</span>
          </div>
        </div>
        <div class="d-flex align-items-center border-bottom py-3">
          <img class="rounded-circle flex-shrink-0" src="/static/images/users/user2.jpg" alt=""
               style="width: 40px; height: 40px;">
          <div class="w-100 ms-3">
            <div class="d-flex w-100 justify-content-between">
              <h6 class="mb-0">Vũ Văn Phong</h6>
              <small>15 minutes ago</small>
            </div>
            <span>Short message goes here...</span>
          </div>
        </div>
        <div class="d-flex align-items-center border-bottom py-3">
          <img class="rounded-circle flex-shrink-0" src="/static/images/users/user3.jpg" alt=""
               style="width: 40px; height: 40px;">
          <div class="w-100 ms-3">
            <div class="d-flex w-100 justify-content-between">
              <h6 class="mb-0">Phong Tuấn Vũ</h6>
              <small>15 minutes ago</small>
            </div>
            <span>Short message goes here...</span>
          </div>
        </div>
        <div class="d-flex align-items-center pt-3">
          <img class="rounded-circle flex-shrink-0" src="/static/images/users/user4.jpg" alt=""
               style="width: 40px; height: 40px;">
          <div class="w-100 ms-3">
            <div class="d-flex w-100 justify-content-between">
              <h6 class="mb-0">Lê Tuấn Phong</h6>
              <small>15 minutes ago</small>
            </div>
            <span>Short message goes here...</span>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-12 col-md-6 col-xl-4">
      <div class="h-100 bg-light rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
          <h6 class="mb-0">Lịch</h6>
          <a href="">Hiển thị tất cả</a>
        </div>
        <div id="calender"></div>
      </div>
    </div>
    <div class="col-sm-12 col-md-6 col-xl-4">
      <div class="h-100 bg-light rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
          <h6 class="mb-0">Danh sách công việc</h6>
          <a href="">Hiển thị tất cả</a>
        </div>
        <div class="d-flex mb-2">
          <input class="form-control bg-transparent" type="text" placeholder="Nhiệm vụ">
          <form action="/admin/sendemail" method="post">
            <button type="submit" class="btn btn-primary ms-2">Thêm</button>
          </form>
        </div>
        <div class="d-flex align-items-center border-bottom py-2">
          <input class="form-check-input m-0" type="checkbox">
          <div class="w-100 ms-3">
            <div class="d-flex w-100 align-items-center justify-content-between">
              <span>Thống kê doanh thu...</span>
              <button class="btn btn-sm">
                <i class="fa fa-times"></i>
              </button>
            </div>
          </div>
        </div>
        <div class="d-flex align-items-center border-bottom py-2">
          <input class="form-check-input m-0" type="checkbox">
          <div class="w-100 ms-3">
            <div class="d-flex w-100 align-items-center justify-content-between">
              <span>Thêm sản phẩm mới...</span>
              <button class="btn btn-sm">
                <i class="fa fa-times"></i>
              </button>
            </div>
          </div>
        </div>
        <div class="d-flex align-items-center border-bottom py-2">
          <input class="form-check-input m-0" type="checkbox" checked>
          <div class="w-100 ms-3">
            <div class="d-flex w-100 align-items-center justify-content-between">
              <span><del>Báo cáo số lượng tồn kho...</del></span>
              <button class="btn btn-sm text-primary">
                <i class="fa fa-times"></i>
              </button>
            </div>
          </div>
        </div>
        <div class="d-flex align-items-center pt-2">
          <input class="form-check-input m-0" type="checkbox">
          <div class="w-100 ms-3">
            <div class="d-flex w-100 align-items-center justify-content-between">
              <span>Thêm 10 mã giảm giá...</span>
              <button class="btn btn-sm">
                <i class="fa fa-times"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-12 col-xl-6">
      <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Thành viên</h6>
        <div class="owl-carousel testimonial-carousel">
          <div class="testimonial-item text-center">
            <img class="img-fluid rounded-circle mx-auto mb-4" src="/static/images/users/user1.jpg"
                 style="width: 100px; height: 100px;">
            <h5 class="mb-1">Vũ Tuấn Phong</h5>
            <p>PC02991</p>
            <p class="mb-0">Tester</p>
          </div>
          <div class="testimonial-item text-center">
            <img class="img-fluid rounded-circle mx-auto mb-4" src="/static/images/users/user2.jpg"
                 style="width: 100px; height: 100px;">
            <h5 class="mb-1">Vũ Tuấn Phong</h5>
            <p>PC02874</p>
            <p class="mb-0">Product Maneger</p>
          </div>
          <div class="testimonial-item text-center">
            <img class="img-fluid rounded-circle mx-auto mb-4" src="/static/images/users/user3.jpg"
                 style="width: 100px; height: 100px;">
            <h5 class="mb-1">Vũ Tuấn Phong</h5>
            <p>PC02975</p>
            <p class="mb-0">Back-end Developer</p>
          </div>
          <div class="testimonial-item text-center">
            <img class="img-fluid rounded-circle mx-auto mb-4" src="/static/images/users/user4.jpg"
                 style="width: 100px; height: 100px;">
            <h5 class="mb-1">Vũ Tuấn Phong</h5>
            <p>PC02834</p>
            <p class="mb-0">Front-end Developer</p>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-12 col-xl-6">
      <div class="bg-light rounded h-100 p-4">
        <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15717.496499758201!2d105.7412984871582!3d9.985922300000016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a089ec579b8db7%3A0xaca174fcb9796633!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEZQVCBQb2x5dGVjaG5pYyBD4bqnbiBUaMah!5e0!3m2!1sen!2s!4v1684923264425!5m2!1sen!2s"
                width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>
    </div>
  </div>
</div>
<script>
  $('#calender').datetimepicker({
    inline: true,
    format: 'L'
  });
  $(".testimonial-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1000,
    items: 1,
    dots: true,
    loop: true,
    nav: false
  });
</script>