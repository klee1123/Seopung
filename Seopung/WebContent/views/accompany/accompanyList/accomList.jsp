<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
            .accomList{
                width: 1000px;
                height: 800px;
                margin-left: 20px;
            }

            


        </style>

    </head>
<body>
    
    
    

    <%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../../myPage/common/myPageSidebar.jsp" %>
	

    
		<class class="myContent">
	
		<div class="accompany">
	        
	            <h1>&nbsp;&nbsp;&nbsp;동행목록</h1>
	            <hr>
	        
			<div class="accompanyList"> <br>
				
                    

                
	            <form action="" method="POST">
                    
				<br><br>
				
	            <table id="accomList" align="center" >
	                <thead>
	                    <tr align="center" style="background-color: #00c0ff; color: white;">
	                        <th><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
	                        <th width="150">아이디</th>
	                        <th width="100">이름</th>
	                        <th width="120"></th>
                            <th width="150"></th>
                            <th width="120"></th>
                            <th width="90"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr align="center">
	                        <td><input type="checkbox" class="primary-checkbox" id="default-checkbox" name="chk1">&nbsp;&nbsp;1.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; ">프로필</a></td>
                            <td><a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 8px;">메세지보내기</a></td>
                            <td><a href="#" class="genric-btn danger-border radius" style="height: 30px; font-size: 8px;">동행삭제</a></td>
                            <td><a href="#" class="genric-btn danger-border radius" style="height: 30px; font-size: 8px;">신고</a></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox" class="primary-checkbox" id="default-checkbox" name="chk2">&nbsp;&nbsp;2.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk3">&nbsp;&nbsp;3.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk4">&nbsp;&nbsp;4.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk5">&nbsp;&nbsp;5.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk6">&nbsp;&nbsp;6.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk7">&nbsp;&nbsp;7.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk8">&nbsp;&nbsp;8.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk9">&nbsp;&nbsp;9.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

                        </tr>
                        
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk10">&nbsp;&nbsp;10.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td><button>프로필보기</button></td>
                            <td><button>메세지보내기</button></td>
                            <td><button>동행삭제</button></td>
                            <td><button>신고</button></td>

	                    </tr>
	                </tbody>
				</table>
				
			
                </form>
                
            
	            <br><br>
	            <div class="pagingArea" align="center">
	
	                <!-- 맨 처음으로 (<<) -->
	                <button> &lt;&lt; </button>
	                <!-- 이전 페이지로 (<) -->
	                <button> &lt; </button>
	    
	                <button>1</button>
	                <button>2</button>
	                <button>3</button>
	                <button>4</button>
	                <button>5</button>
	                
	                <!-- 다음 페이지로 (>) -->
	                <button> &gt; </button>
	                <!-- 맨 끝으로 (>>) -->
	                <button> &gt;&gt; </button>
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