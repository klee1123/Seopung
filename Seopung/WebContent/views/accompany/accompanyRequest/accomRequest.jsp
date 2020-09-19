<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .accomRequest{
        width: 1000px;
        height: 800px;
        margin-left: 20px;
    }


</style>


</head>



<body>

  

    <%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../../myPage/common/myPageSidebar.jsp" %>
	
	
	<class class="accomRequest">
	
		<div class="accomTitle">
	        
	            <h1>&nbsp;&nbsp;&nbsp;신청 온 동행인</h1>
	            <hr>
	        
			<div class="request"> <br>
				
						
	            <form action="" method="POST">
	            
				<br><br>
				
	            <table id="accomList" align="center">
	                <thead>
	                    <tr align="center">
	                        <th><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
	                        <th width="150">아이디</th>
	                        <th width="100">이름</th>
	                        <th width="100">신청날짜</th>
                            <th width="150">동행내용</th>
                            <th width="200">수락여부</th>
                            <th width="50">신고</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;2.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;3.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;4.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;5.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;6.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;7.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;8.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;9.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
                            <td><button>신고</button></td>

	                    </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk10">&nbsp;&nbsp;10.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><button>수락</button> /
                                <button>거절</button>
                            </td>
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