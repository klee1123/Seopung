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

   
    <style>
    	#mainPlanRec{
            width:250px;
        }
        #mainPlanRec a{
            text-decoration: none;
            color: rgb(75, 75, 75);
            font-size : 15px;
        }
        #mainPlanRec tr{
            height:40px;
        }
        #mainNotice{
            width:250px;
        }
        #mainNotice a{
            text-decoration: none;
            color: rgb(75, 75, 75);
            font-size : 15px;
        }
        #mainNotice tr{
            height:40px;
        }
        .blog_text img{
            width: 100%;
            height: 100%;
        }
        .single_donation_item{
            font-size: 18px;
            width : 300px;
        }
        #fontStyle{
        	color: rgb(75, 75, 75);
        	font-size:20px;
        	font-weight: bold;
        }
        #caImg{
        	border:1px solid rgb(230,230,230);
        	border-radius:5px;
        	height:310px;
        }
        
        
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
                            <h5 style="font-family: 'Do Hyeon', sans-serif;">쉽고 빠르게 여행을 계획하세요</h5><br><br>
                            <%if (loginUser != null) { %>
                             <a href="views/plan/planMakePage.jsp" onClick="planMake_click();" class="genric-btn primary e-large" 
                             style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; color: rgb(75, 75, 75); font-weight:100;">일정 만들기</a>
                           	
                           	<% } else { %>
                           	
	                         <a href="" onClick="alert('로그인이 필요한 서비스입니다.')" class="genric-btn primary e-large" 
	                         style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; color: rgb(75, 75, 75); font-weight:100;">일정 만들기</a>
                          
                           	<% } %>	
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
                   <!--  <div class="single_donation_item" style="border: 1px solid black;">  --> 
                       	<img id="caImg" class="single_donation_item" src="resources/images/calendar.jpg"  >
                    <!-- </div> -->
                </div>
                
                <div class="col-lg-4 col-sm-6">
                    <div class="single_donation_item" style="margin-left: 20px;border: 1px solid rgb(230,230,230);">
                        <p id="fontStyle">공지사항</p><br>
                        <p><table id="mainNotice" >
                           <!-- <tr>
                           		<td><a href="">공지사항 제목 공지사항 제목</a></td>
                           </tr>  -->
                        </table></p><br>
                        <a href="<%= contextPath %>/list.no?currentPage=1" style="text-decoration: none; color: black; font-size:13px">공지사항 더보기</a>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6" >
                    <div class="single_donation_item" style="margin-left: 20px;border: 1px solid rgb(230,230,230);">
                        <p id="fontStyle">인기글</p><br>
                        <p><table id="mainPlanRec" >
                           <!-- <tr>
                           		<td><a href="">인기글 제목</a></td>
                            </tr>  --> 
                            </table></p><br> 
                        <a href="<%= contextPath %>/list.pl?currentPage=1" style="text-decoration: none; color: black; font-size:13px"">일정 더보기</a>
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
                        <p id="fontStyle" style="font-size:25px">추천 코스</p>
                        <p>내가 계획한 일정과 서울 주요 관광지 정보를 빠르고 쉽게 찾을 수 있습니다. 서풍에서 제공하는 추천코스를 활용해보세요!</p>
                    </div>
                </div>
            </div>
	          <div class="row" id="row">
	              <!-- <div class="col-lg-4 col-sm-6">
	                    <div class="single_blog_part">
	                        <div class="blog_text">
	                            <p>제목</h2>
	                            <div class="recommendRank" style="width: 200; height:250px;border: 1px solid black;">
	                            <a href=""><img src="resources/달.jpg" alt=""></a>
	                            </div>
	                        </div>
	                    </div>
	               </div> -->
             </div>
        </div>
    </section>
	<script>
		$(function(){
			selectRecommendList();
			selectPlanList();
		});
		
		function selectRecommendList(){
			
			$.ajax({
					url:"<%=contextPath%>/IndexRe.in",
					type:"get",
					success:function(list){
						
						var result = "";
						for(var i=0; i<3; i++) {
							result += 
									
					                "<div class='col-lg-4 col-sm-6'>" +
					                    "<div class='single_blog_part'>" +
					                        "<div class='blog_text'>" +
					                            "<p id='fontStyle' style='font-size:20px'>" + list[i].title + "</p>" + "<br>" +
					                            "<div class='recommendRank' id='recommendR' style='width: 200; height:250px;'>" +
					                            "<a href='<%=contextPath%>/detailList.re?cno=" + list[i].reNo + "'><img src=" + list[i].thumb + "></a>" +
					                            "</div>" +
					                        "</div>" +
					                    "</div>" +
					                 "</div>";
							
						}
						$("#row").html(result);
						
					},error:function(){
						console.log("ajax통신 실패")
					}
			});
		}
	</script>
	<script>
		$(function(){
			selectPlanList();
		});
		
		function selectPlanList(){
			$.ajax({
					url:"<%=contextPath%>/IndexPl.in",
					type:"get",
					success:function(list){
						
						var result = "";
						for(var i=0; i<5; i++) {
							result += 
								"<tr>" +
                       				"<td>" + 
                       					"<a href='<%=contextPath%>/detail.pl?pno=" + list[i].planNo + "'>" + list[i].planTitle + "</a>" + 
                       				"</td>" +
                       			"</tr>";
						}
						$("#mainPlanRec").html(result)
					},error:function(){
						console.log("ajax통신 실패");
					}
			})
		}
	</script>
	
	<script>
		$(function(){
			selectNoticeList();
		});
		
		function selectNoticeList(){
			$.ajax({
					url:"<%=contextPath%>/IndexNo.in",
					type:"get",
					success:function(list){
						var result = "";
						for(var i=0; i<5; i++) {
							result +=
								"<tr>" +
                       				"<td>" + 
                       					"<a href='<%=contextPath%>/detail.no?nno=" + list[i].noticeNo + "'>" + list[i].noticeTitle + "</a>" +
                       				"</td>" +
                       			"</tr>";
						}
						$("#mainNotice").html(result);
					},error:function(){
						console.log("ajax통신실패");
					}
			})
		}
	</script>

  	
	<footer>
	
	<%@include file="views/common/footer.jsp" %>
	</footer>



</body>
</html>