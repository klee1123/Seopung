<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  	<link rel="stylesheet" href="resouces/css/all.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <!-- 달력 -->
    <script src="resources/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
   	<script>
   	  $( function() {
        $( "#calendar" ).datepicker({
          firstDay: 1
        });
      });
  	</script>
    <style>
    	#mainRecommendTable{
            width:300px;
        }
        #mainRecommendTable a{
            text-decoration: none;
            color:black;
        }
        #mainRecommendTable tr{
            height:40px;
        }
        .blog_text img{
            width: 100%;
            height: 100%;
        }
        .single_donation_item{
        
            font-size: 18px;
        }
        
        .ui-datepicker{ font-size: 20px; width:280px; height: 300px; }
    </style>
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
                            <h5 style="font-family: 'Do Hyeon', sans-serif;">나만의 여행 플래너 서풍</h5>
                            <h1 style="font-family: 'Do Hyeon', sans-serif; font-size: 35px;">쉽고 빠르게 여행을 기록하세요</h1><br><br>
                            <a href="#" class="genric-btn primary e-large" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px;">일정 만들기</a>
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
                       	<div id="calendar"></div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_donation_item" style="margin-left: 40px;">
                        <h4>공지사항</h4><br>
                        <p><table id="mainRecommendTable" >
                            <tr><td><a href="">공지사항 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">공지사항 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">공지사항 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">공지사항 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">공지사항 제목공지사항 제목</a></td></tr>
                        </table></p><br>
                        <a href="#" style="text-decoration: none; color: black;">더보기</a>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_donation_item">
                        <h4>인기글</h4><br>
                        <p><table id="mainRecommendTable" >
                            <tr><td><a href="">인기글 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">인기글 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">인기글 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">인기글 제목공지사항 제목</a></td></tr>
                            <tr><td><a href="">인기글 제목공지사항 제목</a></td></tr>
                        </table></p><br> 
                        <a href="#" style="text-decoration: none; color: black;">더보기</a>
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
                        <p>내가 계획한 일정과 서울 주요 관광지 정보를 빠르고 쉽게 찾을 수 있습니다. 서풍에서 제공하는 추천코스를 활용해보세요!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_blog_part">
                        <div class="blog_text">
                            <h2>제목</h2>
                            <div class="recommendRank" style="width: 200; height:250px;border: 1px solid black;">
                            <a href=""><img src="resources/달.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_blog_part">
                        <div class="blog_text">
                            <h2>제목</h2>
                            <div class="recommendRank" style="width: 200; height:250px;border: 1px solid black;">
                                <a href=""><img src="resources/달.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_blog_part">
                        <div class="blog_text">
                            <h2>제목</h2>
                            <div class="recommendRank" style="width: 200; height:250px;border: 1px solid black;">
                                <a href=""><img src="resources/달.jpg" alt=""></a>
                            </div>
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