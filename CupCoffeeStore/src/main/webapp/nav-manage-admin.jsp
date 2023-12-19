<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header start -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light position-relative">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img
            style="width: 40px"
            src="https://www.pma-india.org/assets/frontend/img/pma-images/project-management-blue.png"
            alt=""
          />
        </a>

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="QuanLySanPham"
                >Quản lý sản phẩm</a
              >
            </li>
            
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="QuanLySanPham"
                >Quản lý danh mục</a
              >
            </li>
            
          </ul>
        </div>
      </div>

      <div class="d-flex align-items-start">
        <img class="avata" src="https://demos.themeselection.com/materio-bootstrap-html-admin-template/assets/img/avatars/17.png" style="width: 50px; border-radius: 99px; margin-right: 15px; cursor: pointer;" alt="" >
      </div>

      <div class="py-4 px-3 rounded-2 flex-column box-admin position-absolute bg-white d-none" style="width: 350px; top: 60px; right: 0; border: 1px solid #eee; display: flex">
        <a href="#" class="d-flex text-decoration-none align-items-center">
          <img  src="https://demos.themeselection.com/materio-bootstrap-html-admin-template/assets/img/avatars/17.png" style="width: 50px; border-radius: 99px; margin-right: 15px;" alt="" >
          <span class="fs-5 text-dark"><%=(session.getAttribute("name")) == null ? "" : session.getAttribute("name") %></span>
        </a>
        <a href="Logout" class="btn btn-dark mt-4">Logout</a>
      </div>
    </nav>
    
    