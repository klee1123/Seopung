<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    .accomRequest{
        width: 1000px;
        height: 800px;
        margin-left: 20px;
    }

    .head{
        background-color: #00c0ff; 
        color: white;

    }

    .modal{
        position: absolute;
        
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
	                    <tr align="center" class="head">
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
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;" data-toggle="modal" data-target="#accept">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px" data-toggle="modal" data-target="#refusal">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px" data-toggle="modal" data-target="#report">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk2">&nbsp;&nbsp;2.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk3">&nbsp;&nbsp;3.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk4">&nbsp;&nbsp;4.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk5">&nbsp;&nbsp;5.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk6">&nbsp;&nbsp;6.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk7">&nbsp;&nbsp;7.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk8">&nbsp;&nbsp;8.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk9">&nbsp;&nbsp;9.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

                        </tr>
                        <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk10">&nbsp;&nbsp;10.</td>
	                        <td>아이디 넣을칸</td>
	                        <td>이름</td>
	                        <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 30px; font-size: 10px; padding: 0 10px;">수락</a> /
                                <a href="#" class="genric-btn primary-border radius" style="height: 30px; font-size: 10px; padding: 0 10px">거절</a>
                            </td>
                            <td><a href="#" class="genric-btn danger-border radius" style=" height: 30px; font-size: 10px; padding: 0 5px">신고</a></td>

	                    </tr>
                       
	                </tbody>
				</table>
				
			
				</form>
                <!-- 수락 modal -->
                <div class="modal" id="accept">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">수락여부</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body" align="center">
                
                                <h4><b>
                                    동행을 수락하시겠습니까 ? <br>   
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

                <!-- 거절 모달 -->

                <div class="modal" id="refusal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">수락여부</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body" align="center">
                
                                <h4><b>
                                    동행을 거절하시겠습니까 ? <br>   
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
                <!-- 신고하기 modal -->

                <div class="modal" id="report">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">신고 작성</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                        
                                <form action="" method="post">
            
                                    <table>
                                        <tr>
                                            <th>신고 사유</th>
                                                
                                            <td>
                                                <div class="default-select" id="default-select_2">
                                                    <select>
                                                        <option value="1">영리목적, 홍보성</option>
                                                        <option value="1">불법성</option>
                                                        <option value="1">욕설,인신공격</option>
                                                        <option value="1">도배 및 광고</option>
                                                        <option value="1">개인정보 노출</option>
                                                        <option value="1">음란성, 선정성</option>
                                                        <option value="1">모방 또는 명의 도용</option>
                                                        <option value="1">기타</option>
                                                    </select>
                                                </div>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>신고 제목 &nbsp;</th>
                                            <td><input type="text" name="reportTitle" required></td>
                                        </tr>
                                        <tr>
                                            <th>신고 내용</th>
                                            <td><textarea name="reportContent" cols="30" rows="10" style="resize: none;" required></textarea></td>
                                        </tr>
                                    </table>
                                    <br>
                                    <button type="submit" class="genric-btn info-border radius">작성</button>
                                    <button type="reset" class="genric-btn danger-border radius">취소</button>
                                    
                                </form>
            
                            </div>
            
                        </div>
                    </div>
                </div>





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