<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script><link rel="stylesheet"

<script>
	<src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"

	href="<%=contextPath%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/all.css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
	
<style>
.genric-btn {
	font-weight: bold;
	font-size: 18px;
}

#navbarSupportedContent a {
	font-size: 18px;
	font-weight: bold;
}

.main_menu {
	background: #00c0ff;
}

.collapse+a {
	color: white;
	font-weight: bold;
}

.collapse+a:hover {
	color: lightgrey
}
.modal-title{
    margin-left:130px;
    font-weight:bold;
    color:grey;
    }
 
.modal-footer>button{
    margin-right:20px;
}
.modal-footer a{
    margin:12px;
    color:grey;
    text-decoration:none;
}
.modal-footer a:hover{
    color:lightgrey;
}

</style>
</head>
<body>
	<!--메뉴바-->
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="index.html"
							style="font-family: 'Do Hyeon', sans-serif; font-size: 50px; color: white">서풍</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 일정서비스 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="">일정만들기</a> <a
											class="dropdown-item" href="">일정검색</a>
									</div></li>
								<li class="nav-item"><a class="nav-link" href="about.html">커뮤니티</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="packages.html">추천코스</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown1" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
										<a class="dropdown-item" href="">고객센터</a> <a
											class="dropdown-item" href="">FAQ</a> <a
											class="dropdown-item" href="">1:1문의</a>
									</div></li>
							</ul>
							<form>
								<input type="text"
									style="border: 3px solid #fec104; width: 140px; height: 38px; margin-left: 20px; margin-bottom: 20px; margin-top: 20px;">
								<button class="btn btn-warning" 
									style="font-weight: bold; color: rgb(75, 75, 75);">검색</button>
							</form>

						</div>

						<a class="btn btn-light" href="#" data-toggle="modal" data-target="#loginForm"
							style="font-weight: bold; color: rgb(75, 75, 75);">로그인/회원가입</a>
					</nav>
				</div>
			</div>
		</div>
	</header>


                    
    <div class="modal" id="loginForm">
        <div class="modal-dialog" style="width:368px; display:table"> 
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">로그인</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body" align="center">
              <form action="">
              <input type="text" name="userId" style="width:250px; height:35px; " placeholder="ID" required>
              <input type="password" name="userPwd" style="width:250px; height:35px; " placeholder="PASSWORD" required>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="submit" class="btn btn-secondary" data-dismiss="modal" style="width:300px; margin-right:15px;">Login</button>
              <table  style="margin-right:20px;">
                  <tr>
                      <td><a href="" >회원가입</a>|</td>
                      <td><a href="" >아이디찾기</a>|</td>
                      <td><a href="" ">비밀번호찾기</a></td>
                  </tr>
              </table>
            </div>
          </form>   
          </div>
        </div>
      </div>
      
    </div>
    
    <script src="<%=contextPath%>/resources/js/bootstrap.min.js"></script>

	<script src="<%=contextPath%>/resources/js/bootstrap.min.js"></script>

</body>
</html>