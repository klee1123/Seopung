<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>사이드메뉴바</title>

  <!-- Custom fonts for this template-->
  <link href="../../admin/adminResources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../admin/adminResources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      
      <br><br><br><br>
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- 개인정보조회 및 변경 -->
      <li class="nav-item">
        <a class="nav-link" href="">
          <span>개인정보조회 및 변경</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

       <!-- 일정관리 -->
       <li class="nav-item">
        <a class="nav-link" href="">
          <span>일정 관리</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- 동행인관리 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <span>동행인관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">동행인관리</h6>
            <a class="collapse-item" href="">신청 한 동행인</a>
            <a class="collapse-item" href="">신청 한 동행인</a>
            <a class="collapse-item" href="">동행목록</a>
          </div>
        </div>
      </li>

      <hr class="sidebar-divider">

      <!-- 스크랩 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <span>스크랩</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">스크랩</h6>
            <a class="collapse-item" href="">일정</a>
            <a class="collapse-item" href="">커뮤니티</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- 메세지함 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <span>메세지함</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">메세지함</h6>
            <a class="collapse-item" href="">메세지함</a>
            <a class="collapse-item" href="">받은 메세지함</a>
            <a class="collapse-item" href="">보낸 메세지함</a>
          </div>
        </div>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider">
      <!-- 1:1문의 -->
      <li class="nav-item">
        <a class="nav-link" href="">
          <span>1:1문의</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">
      <br><br><br><br>
      <!-- 탈퇴 -->
      <li class="nav-item">
        <a class="nav-link" href="">
          <span>탈퇴하기</span></a>
      </li>

     

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->

          <ul class="navbar-nav ml-auto">
            
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">userId12</span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  마이페이지
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  홈페이지
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- End of Topbar -->
	</div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
</body>
</html>