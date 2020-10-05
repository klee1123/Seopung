<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="../../../resources/css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="../../../resources/css/owl.carousel.min.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="../../../resources/css/all.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="../../../resources/css/flaticon.css">
        <link rel="stylesheet" href="../../../resources/css/themify-icons.css">
        <link rel="stylesheet" href="../../../resources/css/nice-select.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="../../../resources/css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="../../../resources/css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="../../../resources/css/style.css">

<style>
        .accomResponse{
      
      margin-top: 30px;
      float: left;

      width: 1000px;
      height: 800px;
  }



</style>





</head>
<body>

    <%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../../myPage/common/myPageSidebar.jsp" %>

    <class class="accomResponse">
	
		<div class="accomTitle">
	        
	            <h1>&nbsp;&nbsp;&nbsp;<b style="color:black;">신청 한 동행인</b></h1>
	            <hr>
	        
			<div class="response"> <br>
				
						
	            <form action="<%=contextPath %>/response.ac" method="GET">
	            
				<br><br>
				
	            <table id="accomRp"  align="center" class ="table table-hover">
	                <thead>
	                    <tr align="center" class="head">
	                        <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
	                        <th width="150">아이디</th>
	                        <th width="100"></th>
	                        <th width="100">신청날짜</th>
                            <th width="150">일정제목</th>
                            <th width="200">동행진행과정</th>
                            <th width="70"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
	                        <td >아이디 넣을칸</td>
	                        <td></td>
	                        <td>2020.09.19</td>
                            <td><a href="#">asdasdasd</a></td>
                            <td>수락</td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#cancel"  style="font-size: 10px;" hidden>동행취소</a></td>

                        </tr>

                        <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
	                        <td >아이디 넣을칸</td>
	                        <td></td>
	                        <td>2020.09.19</td>
                            <td><a href="#">asdasdasd</a></td>
                            <td>진행중</td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#cancel"  style="font-size: 10px;">동행취소</a></td>

                        </tr>

                        <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
	                        <td >아이디 넣을칸</td>
	                        <td></td>
	                        <td>2020.09.19</td>
                            <td><a href="#">asdasdasd</a></td>
                            <td>거절</td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#cancel"  style="font-size: 10px;" hidden>동행취소칸(진행중만 나옴)</a></td>

                        </tr>

                        <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
	                        <td >아이디 넣을칸</td>
	                        <td></td>
	                        <td>2020.09.19</td>
                            <td><a href="#">asdasdasd</a></td>
                            <td>수락</td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#cancel"  style="font-size: 10px;" hidden>동행취소칸(진행중만 나옴)</a></td>

                        </tr>

                        <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
	                        <td >아이디 넣을칸</td>
	                        <td></td>
	                        <td>2020.09.19</td>
                            <td><a href="#">asdasdasd</a></td>
                            <td>수락</td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#cancel"  style="font-size: 10px;" hidden>동행취소칸(진행중만 나옴)</a></td>

                        </tr>

                     

                       
	                </tbody>
				</table>
				
			
                </form>
                

                
                <div class="modal" id="cancel">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">취소여부</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body" align="center">
                
                                <h4><b>
                                    동행신청을 취소하시겠습니까 ? <br>   
                                </b>
                                </h4>
                                <br>
            
                                <form action="" method="post">
                        
                                    <button type="submit" class="genric-btn info-border radius">확인</button>
                                    <button type="reset" class="genric-btn danger-border radius">취소</button>
                                </form>
            
                            </div>


                        </div>
                    </div>
                </div>


                    <br><br>
                    <div class="pagingArea" align="center">
        
                        <div align="center">
                            <button class="btn btn-secondary btn-sm">&lt;&lt;</button>
                            <button class="btn btn-secondary btn-sm">&lt;</button>

                            <button class="btn btn-outline-secondary btn-sm">1</button>
                            <button class="btn btn-outline-secondary btn-sm">2</button>
                            <button class="btn btn-outline-secondary btn-sm">3</button>
                            <button class="btn btn-outline-secondary btn-sm">4</button>
                            <button class="btn btn-outline-secondary btn-sm">5</button>

                            <button class="btn btn-secondary btn-sm">&gt;</button>
                            <button class="btn btn-secondary btn-sm">&gt;&gt;</button>
                        
                        </div>
                    </div>
	        </div>
	    
	    </div>   
    </class>
    
    
    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="../../../resources/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="../../../resources/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="../../../resources/js/jquery.magnific-popup.js"></script>
    
    
    
    
    <!-- particles js -->
    <script src="../../../resources/js/owl.carousel.min.js"></script>
    <script src="../../../resources/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="../../../resources/js/slick.min.js"></script>
    <script src="../../../resources/js/jquery.counterup.min.js"></script>
    <script src="../../../resources/js/waypoints.min.js"></script>
    <script src="../../../resources/js/contact.js"></script>
    <script src="../../../resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="../../../resources/js/jquery.form.js"></script>
    <script src="../../../resources/js/jquery.validate.min.js"></script>
    <script src="../../../resources/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="../../../resources/js/custom.js"></script>






    
</body>
</html>