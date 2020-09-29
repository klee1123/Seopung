<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.kh.Member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script><link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

.modal-title {
	margin-left: 130px;
	font-weight: bold;
	color: grey;
}

.modal-footer>button {
	margin-right: 20px;
}

.modal-footer a {
	margin: 12px;
	color: grey;
	text-decoration: none;
}

.modal-footer a:hover {
	color: lightgrey;
}
</style>
<script>
$(function(){
	var msg = "<%=alertMsg%>";
	
	if(msg!= "null"){
		alert(msg);
		<% session.removeAttribute("alertMsg");%>
	}
	
});


</script>

<body>
	<!--메뉴바-->
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="<%=contextPath%>"
							style="font-family: 'Do Hyeon', sans-serif; font-size: 50px; color: white">서풍</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav" style="margin-right: 30px;">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 일정서비스 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="">일정만들기</a> <a
											class="dropdown-item" href="">일정검색</a>
									</div></li>
								<li class="nav-item"><a class="nav-link" href="<%=contextPath%>/list.co?currentPage=1">커뮤니티</a>
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
							<div style="width: 210px;">
								<form action="search.do" method="get">
									<div class="input-group mb-3"
										style="margin-left: 25px; margin-top: 15px; margin-bottom: 15px;">
										<input type="text" class="form-control" name="keyword"
											placeholder="검색">
										<div class="input-group-append">
											<button class="btn btn-warning" type="submit">
												<img
													src="<%=contextPath%>/resources/images/icon_magnifier.png"
													width="15px;">
											</button>
										</div>
									</div>
								</form>
							</div>

						</div>
						<%
							if (loginUser == null) {
						%>
						<a class="btn btn-light" href="#" data-toggle="modal"
							data-target="#loginForm"
							style="font-weight: bold; color: rgb(75, 75, 75);">로그인/회원가입</a>
						<%
							} else {
						%>
						<ul>
							<li><span style="white-space: nowrap; margin-left: px;"><span
									style="font-weight: bold;">&nbsp;&nbsp;&nbsp;<%=loginUser.getUserName()%>님</span>
									어서오세요.</span><br> <span>
									<button onclick="location.href='<%=contextPath%>/myPage.me'"
										style="border: none; border-radius: 5px; color: white; background: #fec104;">마이페이지</button>
									<button onclick="location.href='<%=contextPath%>/logout.me'"
										style="border: none; border-radius: 5px; color: white; background: #fec104;">로그아웃</button>
							</span></li>
						</ul>

						<%
							}
						%>
					</nav>
				</div>
			</div>
		</div>
	</header>



	<div class="modal" id="loginForm">
		<div class="modal-dialog" style="width: 368px; display: table">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">로그인</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" align="center">
						
						<form action="<%=contextPath%>/login.me" method="post" onsubmit="return false;">
							<input type="text" name="userId" id="userId"
								style="width: 250px; height: 35px;" placeholder="ID" >
							<input type="password" name="userPwd" id="userPwd"
								style="width: 250px; height: 35px;" placeholder="PASSWORD"
								>
							<div style="color:red; font-weight:bold; margin:5px; font-size:8px;" id="errorMsg"></div>				
							<!-- <button type="submit" class="btn btn-secondary" data-dismiss="modal" style="width:310px; margin-right:15px;">Login</button>-->
							<button onclick="login();" type="submit" class="btn btn-secondary"  style="width:310px; margin-right:15px;" >로그인</button>
						</form>
					
						
						<script>
							
							function login(){
								var id = $("#userId").val();
								var pwd = $("#userPwd").val();
								$.ajax({
									url:"<%=contextPath%>/login.me",
									data:{userId:$("#userId").val(),
										 userPwd:$("#userPwd").val()
										},
									type:"post",
									success:function(member){
							
										  if(member == "null"){
										$("#errorMsg").html("가입하지 않은 아이디거나, 잘못된 비밀번호입니다.");
										$("#userId").val("");
										$("#userPwd").val("");
										if(id == ""){
											$("#errorMsg").html("아이디를 입력해주세요.");
										}else if(pwd == ""){
											$("#errorMsg").html("비밀번호를 입력해주세요.");
										}
											
										}else{
											$("#loginForm").modal("hide");
											location.reload(true);
										}  
										
										  
										},
									error:function(){
										console.log("ajax 통신 실패");
									}
									
								});
							}
							
						</script>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<table style="margin-right: 20px;">
							<tr>
								<td><a href="<%=contextPath%>/agreeform.me">회원가입</a>|</td>
								<td><a href="<%=contextPath%>/searchId.me">아이디찾기</a>|</td>
								<td><a href="<%=contextPath%>/searchPwd.me">비밀번호찾기</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="<%=contextPath%>/resources/js/bootstrap.min.js"></script>

	<script src="<%=contextPath%>/resources/js/bootstrap.min.js"></script>

</body>
</html>