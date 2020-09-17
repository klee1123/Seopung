<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
 <link rel="stylesheet" href="../../resources/css/style.css">
 <style>
        
       #logo{
           font-weight:bold;
           font-size:50px;
           color:white;

       } 

       #searchForm{
           margin-left:40px;
           margin-top:20px;
       }

       #search{
           height:40px;
           border:3px solid #ffdf5d;
           
       }
       .genric-btn{
           font-weight:bold;
           font-size:18px;
       }
    </style>
</head>
<body>
<!--메뉴바-->
    <img src="<%=contextPath %>/resources/images/menu_bg.png" width="1920px;" height="105px;">
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center" style="background:#00c0ff;">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="index.html" id="logo"> 서풍 </a>
                        

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.html" style="font-weight:bold; font-size:18px;">일정서비스</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="about.html"style="font-weight:bold; font-size:18px;">커뮤니티</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="packages.html" style="font-weight:bold; font-size:18px;">추천코스</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.html" style="font-weight:bold; font-size:18px;">고객센터</a>
                                </li>
                                <li class="nav-item">
                                    <form action="" id="searchForm"></form>
                                        <input type="search" name="search" id="search">
                                        <a href="#" class="genric-btn primary" >검색</a>
                                    </form>
                                    
                                </li>
                            </ul>
                        </div>
                        <a class="btn_1 d-none d-lg-block" href="http://www.naver.com" style="color:white;">로그인/회원가입</a>
                    </nav>
                </div>
            </div>
        </div>
    </header>
</body>
</html>