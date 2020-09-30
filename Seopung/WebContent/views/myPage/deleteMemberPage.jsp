<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     
     
     <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="resources/css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="resources/css/all.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="resources/css/flaticon.css">
        <link rel="stylesheet" href="resources/css/themify-icons.css">
        <link rel="stylesheet" href="resources/css/nice-select.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="resources/css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="resources/css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="resources/css/style.css">
    
<style>
        #delete_body>img{
            width: 750px;
            height:500px;
            resize: none;
            margin-left:60px;
        }
        
        
	
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="common/myPageSidebar.jsp" %>  
	
		<div class="myContent">
	    	<!-- 삭제되는 글 안내문 -->
	    	<div class="deleteMem">
			    <!-- 삭제되는 글 안내문 -->
			    <br>
			    <div id="delete_body">
			        <img src="resources/images/탈퇴.jpg" alt="">
			    </div>
			    <br>
			    <div align="center"; style="margin-right: 150px;">
			    
			    <button type="button" data-toggle="modal" data-target="#deleteForm" align="center" class="btn btn-secondary btn">회원탈퇴</button>
		
			    <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
				   <div class="modal" id="deleteForm" style="margin-top:200px;" >
				     <div class="modal-dialog">
				       <div class="modal-content" style="width:400px">
				       
				         <!-- Modal Header -->
				         <div class="modal-header">
				           <h4 class="modal-title" >회원탈퇴</h4>
				           <button type="button" class="close" data-dismiss="modal">&times;</button>
				         </div>
				         
				         <!-- Modal body -->
				         <div class="modal-body" align="center">
				           <b style="color:black">
						               탈퇴 후 복구가 불가능합니다. <br>
						               정말로 탈퇴 하시겠습니까?
				            </b><br><br>
				
				            <form action="deleteM.in" method="POST">
				             <input type="hidden" name="userId" value="<%=loginUser.getUserId()%>">
				                비밀번호 : 
				                <input type="password" name="userPwd" required>
				
				                <button type="submit" class="btn btn-danger btn-sm">탈퇴하기</button>
				            </form>
				         </div>
				         
				       </div>
				     </div>
				   </div>
			   </div>
	   
	    	</div>
	    </div>
	</div>
	
	
    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="resources/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="resources/js/jquery.magnific-popup.js"></script>
    
    
    
    
    <!-- particles js -->
    <script src="../../resources/js/owl.carousel.min.js"></script>
    <script src="../../resources/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="../../resources/js/slick.min.js"></script>
    <script src="../../resources/js/jquery.counterup.min.js"></script>
    <script src="../../resources/js/waypoints.min.js"></script>
    <script src="../../resources/js/contact.js"></script>
    <script src="../../resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="../../resources/js/jquery.form.js"></script>
    <script src="../../resources/js/jquery.validate.min.js"></script>
    <script src="../../resources/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="../../resources/js/custom.js"></script>
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>