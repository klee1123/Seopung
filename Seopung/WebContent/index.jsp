<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  	<link rel="stylesheet" href="resouces/css/all.css">
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
  
	 <!-- 메뉴바 영역 -->
	<%@include file="views/common/menubar.jsp" %>
    <!-- banner 영역 -->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-7">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h5>Best way to tour</h5>
                            <h1>Lorem ipsum dolor amet consec</h1><br><br>
                            <a href="#" class="genric-btn primary e-large">일정 만들기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div>
         <!-- content영역(공지, 날씨, 인기글)-->
    <section class="search_your_country">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_donation_item">
                        <h4>donation</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipiscing 
                        elit sed do eiusmod tempor incididunt ut labore et 
                        dolore magna </p>
                        <a href="#" class="read_btn">read more</a>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_donation_item">
                        <h4>donation</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipiscing 
                        elit sed do eiusmod tempor incididunt ut labore et 
                        dolore magna </p>
                        <a href="#" class="read_btn">read more</a>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_donation_item">
                        <h4>donation</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipiscing 
                        elit sed do eiusmod tempor incididunt ut labore et 
                        dolore magna </p>
                        <a href="#" class="read_btn">read more</a>
                    </div>
                </div>
            </div>
        </div>
        <img src="resources/images/shape-1.png" alt="" class="feature_icon_1">
        <br><br>
        <img src="resources/images/shape-2.png" alt="" class="feature_icon_2">
    </section>
    </div>
    <!-- content 영역 (추천코스)-->
    <section class="blog_part padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="section_tittle">
                        
                        <h2>추천 코스</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit 
                        sed  do eiusmod tempor incididunt ut</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_blog_part">
                        <img src="resources/images/blog_1.png" alt="">
                        <div class="blog_text">
                            <h2>Luxerious Car Rental</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna 
                            aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                            <ul>
                                <li>
                                    <i class="ti-calendar"></i>
                                    <p>13th Dec</p>
                                </li>
                                <li>
                                    <i class="ti-heart"></i>
                                    <p>15</p>
                                </li>
                                <li>
                                    <i class="far fa-comment-dots"></i>
                                    <p>10</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_blog_part">
                        <img src="resources/images/blog_2.png" alt="">
                        <div class="blog_text">
                            <h2>Luxerious Car Rental</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna 
                            aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                            <ul>
                                <li>
                                    <i class="ti-calendar"></i>
                                    <p>13th Dec</p>
                                </li>
                                <li>
                                    <i class="ti-heart"></i>
                                    <p>15</p>
                                </li>
                                <li>
                                    <i class="far fa-comment-dots"></i>
                                    <p>10</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_blog_part">
                        <img src="resources/images/blog_3.png" alt="">
                        <div class="blog_text">
                            <h2>Luxerious Car Rental</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna 
                            aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                            <ul>
                                <li>
                                    <i class="ti-calendar"></i>
                                    <p>13th Dec</p>
                                </li>
                                <li>
                                    <i class="ti-heart"></i>
                                    <p>15</p>
                                </li>
                                <li>
                                    <i class="far fa-comment-dots"></i>
                                    <p>10</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<footer>
	<%@include file="views/common/footer.jsp" %>
	
	</footer>



</body>
</html>