<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.Member.model.vo.LoginUser, com.kh.admin.model.vo.Admin" %>
<%
	String contextPath = request.getContextPath();

	LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
	// > 로그인 전 : null
	// > 로그인 후 : 로그인성공한 관리자정보들이 담겨있는 객체
	
	String alertMsg = (String)session.getAttribute("alertMsg");

	String pageTitle = "";
	if(request.getAttribute("pageTitle")!=null){		
		pageTitle = (String)request.getAttribute("pageTitle");
	}
	
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>서풍-관리자페이지</title>

<!-- summerNote -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<!-- Custom fonts for this template-->
<link href="<%= request.getContextPath() %>/views/admin/adminResources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%= request.getContextPath() %>/views/admin/adminResources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<%= request.getContextPath() %>/views/admin/adminResources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


<script>

	(function () {
		var msg = "<%= alertMsg %>";
		
		if(msg != "null"){ // 메서지가 담겨있을 경우
			alert(msg);
			// 알람창 띄워준 후에 session에 담긴 메세지 지워야됨
			// 안그러면 menubar.jsp가 포함되어있는 페이지 열때마다 alert 계속 뜰거임
			<% session.removeAttribute("alertMsg"); %>
		}	
	}());
</script>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - 로고 -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=contextPath%>/adminPage">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-fw fa-cog"></i>
        </div>
        <div class="sidebar-brand-text mx-3">관리자페이지</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - 게시물관리 Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtiliti" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-folder"></i>
          <span>사용자관리</span>
        </a>
        <div id="collapseUtiliti" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%=contextPath%>/adminPage/list.ad?currentPage=1">관리자</a>
            <a class="collapse-item" href="<%=contextPath%>/adminPage/list.me?currentPage=1">회원</a>
            <a class="collapse-item" href="<%=contextPath%>/adminPage/list.bl?currentPage=1">블랙리스트</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - 게시물관리 Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-table"></i>
          <span>게시물관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%= contextPath %>/adminPage/list.pl?currentPage=1">일정관리</a>
            <a class="collapse-item" href="<%= contextPath %>/adminPage/list.co?currentPage=1">커뮤니티관리</a>
            <a class="collapse-item" href="<%= contextPath %>/adminPage/list.re?currentPage=1">추천코스관리</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - 통계관리 Collapse Menu 
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>통계관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="">회원통계</a>
            <a class="collapse-item" href="">일정통계</a>
          </div>
        </div>
      </li>-->

      <!-- Divider 
      <hr class="sidebar-divider">-->

      <!-- Nav Item - 고객센터 Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilitie" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>고객센터</span>
        </a>
        <div id="collapseUtilitie" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <!--<a class="collapse-item" href="">FAQ</a> /// 주소 겹치지 않게 주의 -->
            <a class="collapse-item" href="<%= contextPath %>/adminPage/list.no?currentPage=1">공지사항</a>
            <a class="collapse-item" href="<%= contextPath %>/adminPage/list.iq?currentPage=1">1:1문의</a>
            <a class="collapse-item" href="<%= contextPath %>/adminPage/list.rp?currentPage=1">신고내역</a>
          </div>
        </div>
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
          <h3 class="text-gray-800">&nbsp;<%= pageTitle %></h3>
          
          <!-- Topbar Navbar -->
		 <%if(loginUser!=null && loginUser.getCategory() == 2){ %>
          <ul class="navbar-nav ml-auto">
            
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-700"><%=loginUser.getUserName()%></span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="<%=contextPath%>/adminPage/myPage.ad?adminNo=<%=loginUser.getUserNo()%>">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  프로필
                </a>
                <a class="dropdown-item" href="<%=contextPath%>">
                  <i class="fas fa-laugh fa-sm fa-fw mr-2 text-gray-400"></i>
                  	홈페이지
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  로그아웃
                </a>
              </div>
            </li>
          </ul>
          <%} %>
        </nav>
        <!-- End of Topbar -->


</body>
</html>