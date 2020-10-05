<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.Member.model.vo.Member"%>
<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000 +1))) +10000;
	return random;
	}
%>
<%
	
	Member m = (Member)request.getAttribute("m");

	int userNo = m.getUserNo();
	String userId = m.getUserId();
	String userName = m.getUserName();
	String nickName = m.getNickName();
	String email = m.getEmail();
	String birth = m.getBirth();
	String profile = m.getProfile();
	String year = birth.substring(0, 4);
	String month = birth.substring(4, 6);
	String day = birth.substring(6);
	String intro = m.getUserIntro().equals("null") ? "" : m.getUserIntro() ;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보조회 및 수정</title>

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
        
        .myInfo{
            width:1000px;
            height:800px;
            margin-left: 20px;
        } 
        .infoPoto{
            width: 30%;
            float: left;
        }
        .changeInfo{
            float: left;
            width:70%;
        }
        .infoPoto>img{
            width: 150px;
            height: 150px;
            padding: 10px;
            margin-left:20px;
        }
        
        #infoTable tr{
           height:50px;
       }
       #pwdSpan,#regPwd{
           font-size: 12px;
       }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="common/myPageSidebar.jsp" %>

	
	<div class="myContent">
	
		<div class="personal_Info">
        
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;개인정보 조회 및 변경</h1>
            <hr>
        <div class="myInfo">
        <form action="<%=contextPath%>/updateInfo.in" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="userNo" value="<%=userNo%>">
            <button type="submit" class="btn btn-secondary btn-sm">저장</button>
             <br><br>
        
            <div class="infoPoto">
            	<% if(profile.equals("null")) { %>
       			<img src="<%= contextPath %>/resources/images/회원.jpg" id="profileImg" width="150px" height="150px" onchange="loadImg(this);";>
       			<% }else { %>
                <img src="<%= contextPath %>/<%=profile%>"  
                		id="profileImg" width="150px" height="150px" onchange="loadImg(this);";>
                <%} %>
                <br><br>
                <p style="font-size: 12px;">10MB이하의 JPEG파일만 등록가능합니다.</p>
                <div id="myPageButton" align="center">
                    <button type="button" class="btn btn-secondary btn-sm" id="profileBtn">파일등록</button>
                    <button type="button" class="btn btn-secondary btn-sm" id="deleteProfile">삭제</button>
                </div>
            </div>
            <div class="changeInfo">
                
            <table id="infoTable">
                <tr>
                    <th align="left" width="100px">아이디</th>
                    <td><span name="userId"><%= userId %></span></td>
                </tr>
                <tr>
                    <th align="left">이름</th>
                    <td><span name="userName"><%= userName %></span></td>
                </tr>
                <tr>
                    <th align="left">닉네임</th>
                    <td><span style="width: 100px;"><%= nickName %>&nbsp;&nbsp;&nbsp;</span><button type="button" data-toggle="modal" data-target="#updateNickForm" class="btn btn-secondary btn-sm">닉네임변경</button></td>
                </tr>
                <tr>
                    <th align="left">비밀번호</th>
                    <td><button type="button" data-toggle="modal" data-target="#updatePwdForm" class="btn btn-secondary btn-sm">비밀번호변경</button></td>
                
                </tr>
                
                <tr>
                	<th align="left">변경할 이메일</th>
                	<td><input type="text" id="updateEmail" name="updateEmail" placeholder="현재 : <%= email %>">
                    <button type="button" onclick="emailChk();" class="btn btn-secondary btn-sm">이메일인증</button></td>
                    <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
                </tr>
             	<tr>
             		<th>인증확인</th>
             		<td><input type="text" name="code" id="code" placeholder="인증번호를 입력하세요">
             		<button type="button" onclick="emBtn();" class="btn btn-secondary btn-sm">인증확인</button></td>
                    
             	</tr>
                <tr>
                    <th align="left">생년월일</th>
                	<td><span name="birth"><%= year %>년  <%=month %>월  <%=day %>일</span></td>
                </tr>
                
            </table>
            <br>
            </div>
            <label><strong>자기소개</strong></label> <br>
            <textarea name="userIntro" id="intro" cols="80" rows="8"style="resize: none;"><%= intro %></textarea>
       		<div id="fileArea">
       			
                <input type="file" name="profile" id="profile" onchange="loadImg(this);">
            	
            </div>
        </form>
        </div>
    </div>
    <script>
   function emBtn(){
    	console.log("클릭됨");
    	var $codeChk = $("#code_check");
    	var $code = $("#code");
    	var $updateEmail = $("#updateEmail");
    	
    	if($codeChk.val() == $code.val()) {
    		$.ajax({
      			url:"<%= contextPath %>/updateEmail.me",
      			data:{
      				updateEmail:$updateEmail.val()
      			},
      			type:"post",
      			success:function(result){
      				if(result>0){
      					alert("변경 성공");
      					
      				}else{
      					alert("변경 실패");
      				
      				}
      				
      			},error:function(){
      				console.log("통신실패");
      			}
      		})
    	}else {
    		alert("정확한 인증번호를 작성해주세요");
    		$code.val("");
    	}
	 }
 	   
    
    </script>
    
    <!-- 닉네임변경 버튼 클릭시 보여질 Modal-->
<div class="modal" id="updateNickForm">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">닉네임 변경</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
            <form action="<%= contextPath %>/updateNick.me" method="POST" id="nickChange">
                <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
                <table>
                	<tr>
                		<th>현재닉네임</th>
                		<td><input type="text" name="userNick" id="userNick" required value="<%= nickName %>"></td>
                    <tr>
                        <th>변경할 닉네임</th>
                        <td><input type="text" name="updateNick" id="updateNick" required><button type="button" class="btn btn-secondary btn-sm" id="updateNick_Btn" onclick="nickCheck();">중복확인</button></td>
                    	
                    </tr>
                    <tr><td colspan="2" align="center"><span id=nickView></span></td></tr>
                </table>
                <br>
                <div id="nBtn">
               	<button type="submit" class="btn btn-secondary" id="nickChkBtn">닉네임변경</button>
           		</div>
           </form>
        </div>
      </div>
    </div>
  </div>
  <!-- 닉네임 유효성 -->
  <script>
        var regN = /^[a-z0-9가-힣]{1,10}$/i;
  	function nickCheck(){
  		
  		var $userNick = $("#updateNick");
  		var $nickChkBtn = $("#nickChkBtn");
  		$.ajax({
  			url:"<%= contextPath %>/nickChk.me",
  			data:{nickChk:$userNick.val()},
  			type:"get",
  			success:function(result){
  				
  				if(regN.test($userNick.val())){
	  				if(result == "fail"){
	  					nickView.innerHTML = ("이미 존재하는 닉네임 입니다");
	  					$userNick.val("");
	  					$userNick.focus();
	  					$("#nBtn").hide();
	  				}else {
	  					nickView.innerHTML = ("사용가능한 닉네임 입니다.");
	  					$("#nBtn").show();
	  				}
  				}else {
  					alert("유효한 닉네임이 아닙니다.")
  				}
  			},error:function(){
  				console.log("ajax 통신 실패!");
  			}
  		})
  	}
  </script>
    
    <!-- 비밀번호변경 버튼 클릭시 보여질 Modal -->
   <div class="modal" id="updatePwdForm">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">비밀번호변경</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
            <form action="<%= contextPath %>/updatePwd.me" method="POST">
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
                <table>
                    <tr>
                        <th>현재 비밀번호 </th>
                        <td><input type="password" name="userPwd" required></td>
                    </tr>
                    <tr>
                        <th> 변경할 비밀번호 </th>
                        <td><input type="password" name="updatePwd" id="pwd1" required></td>
                    </tr>
                    <tr><td colspan="2" align="center"><span id="regPwd"></span></td></tr>
                    <tr id="pwdTwo">
                        <th>변경할 비밀번호 재입력 </th>
                        <td><input type="password" name="checkPwd" id="pwd2" required>
                    	</td>
                    </tr>
                    <tr><td colspan="2" align="center"><span id="pwdSpan"></span></td></tr>
                </table>
                <br>
                <div id="pcBtn">
                <button type="button" class="btn btn-secondary" id="pwdChkBtn">인증확인</button>
                </div>
                <div id="pBtn">
               	<button type="submit" class="btn btn-secondary" id="pwdBtn">비밀번호변경</button>
           		</div>
           </form>
        </div>
      </div>
    </div>
  </div>
  <!-- 비밀번호 유효성 -->
  <script>
  var regExp = /^[a-z0-9!@#$%^&*]{8,15}$/i;
	$(function(){
		$("#pwd1").blur(function(){
			console.log($("#pwd1").val());
			if(regExp.test($("#pwd1").val())){
				$("#regPwd").html("");
			}else{
				$("#regPwd").html("유효한 비밀번호가 아닙니다");
				$("#pwd1").val("");
			}
		});
	}); 
    	$("#pwdChkBtn").click(function(){
    		if($("#pwd1").val() != "" && $("#pwd2").val() != "") {
	    		if($("#pwd1").val() != $("#pwd2").val()){
	    			$("#pwdSpan").html("똑같은 비밀번호를 적어주세요");
	    		}else {
	    			$("#pwdSpan").html("비밀번호가 일치합니다.");
	    			$("#pcBtn").hide();
	    			$("#pBtn").show();
	    		}
    		}else {
    			$("#pwdSpan").html("비밀번호를 적어주세요.");
    		}
    		
    	});
</script>

  <script>
  	function emailChk(){
  		var $updateEmail = $("#updateEmail");
  		$.ajax({
  			url:"<%= contextPath %>/sendEmail.in",
  			data:{updateEmail:$updateEmail.val(),code_check:$("#code_check").val()},
  			type:"post",
  			success:function(result){
  				
	  				if(result == "fail"){
	  					alert("이메일 전송 실패");
	  					
	  				}else {
	  					alert("이메일 전송 성공");
	  				}
  				
  			},error:function(){
  				console.log("ajax 통신 실패!");
  			}
  		})
  	}
  	
        $(function(){
            $("#fileArea").hide();
            $("#nBtn").hide();
            $("#pBtn").hide();
            $("#profileBtn").click(function(){
                $("#profile").click();
               
            });
        });

        function loadImg(inputFile) {
        	
        //console.log(inputFile.files.length);
            if(inputFile.files.length == 1){
                // 파일을 읽어들일 FileReader객체 생성
                var reader = new FileReader();
                // 파일을 읽어들이는 메소드
                // --> 읽어들이는 순간 그 파일만의 고유한 url부여
                reader.readAsDataURL(inputFile.files[0]);
                // 파일 읽기가 다 완료되었을 때 실행할 함수
                reader.onload = function(e){
                    $("#profileImg").attr("src",e.target.result);
                };
            }else if (inputFile.files.length == 0) {
            	
               $("#profileImg").attr("src", "resources/images/회원.jpg");
              
            }
        }
        $("#deleteProfile").click(function(){
            $("#profileImg").attr("src", "resources/images/회원.jpg");
        });
        
    </script>
	
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
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="resources/js/slick.min.js"></script>
    <script src="resources/js/jquery.counterup.min.js"></script>
    <script src="resources/js/waypoints.min.js"></script>
    <script src="resources/js/contact.js"></script>
    <script src="resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="resources/js/jquery.form.js"></script>
    <script src="resources/js/jquery.validate.min.js"></script>
    <script src="resources/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="resources/js/custom.js"></script>
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>