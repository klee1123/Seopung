<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000 +1))) +10000;
	return random;
	}
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
       #pwdSpan{
           font-size: 12px;
       }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="common/myPageSidebar.jsp" %>
	<%
		int userNo = loginUser.getUserNo();
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String nickName = loginUser.getNickName();
		String email = loginUser.getEmail();
		String birth = loginUser.getBirth();
		String profile = loginUser.getProfile();
		String year = birth.substring(0, 4);
		String month = birth.substring(4, 6);
		String day = birth.substring(6);
		String intro = loginUser.getUserIntro() == null ? "" : loginUser.getUserIntro() ;
	%>
	
	<div class="myContent">
	
		<div class="personal_Info">
        
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;개인정보 조회 및 변경</h1>
            <hr>
        <div class="myInfo">
        <form action="updateInfo.in" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="userNo" value="<%=userNo%>">
            <button type="submit" class="btn btn-secondary btn-sm">저장</button>
             <br><br>
        
            <div class="infoPoto">
                <img src="<%=profile%>" id="profileImg" width="150px" height="150px" onchange="loadImg(this);";>
                <br><br>
                <p style="font-size: 12px;">1MB이하의 JPEG파일만 등록가능합니다.</p>
                <div id="myPageButton" align="center">
                    <button type="button" class="btn btn-secondary btn-sm" id="profileBtn">파일등록</button>
                    <button type="button" class="btn btn-secondary btn-sm" id="deleteProfile">삭제</button>
                </div>
            </div>
            <div class="changeInfo">
                
            <table id="infoTable">
                <tr>
                    <th align="left" width="100px">아이디</th>
                    <td><input type="text" name="userId" required value="<%= userId %>" readonly></td>
                    
                </tr>
                <tr>
                    <th align="left">이름</th>
                    <td><input type="text" name="userName" required value="<%= userName %>" readonly></td>
                    
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
                    <th align="left">이메일</th>
                    <td><input type="text" name="email" required value="<%= email %>"></td>
                    
                </tr>
                <tr>
                	<th align="left">변경할 이메일</th>
                	<td><input type="text" id="updateEmail" name="updateEmail" placeholder="이메일을 입력하세요."></td>
                    <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
                    <td><button type="button" onclick="emailChk();" class="btn btn-secondary btn-sm">이메일인증</button></td>
                </tr>
             	<tr>
             		<th>인증확인</th>
             		<td><input type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요">
                    <div id="ckeckCode"></div></td>
              		<!-- <td><input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>"></td> -->
             	</tr>
             	<tr><td><input type="hidden" id="ok" value="인증하기"></td></tr>
                <tr>
                    <th align="left">생년월일</th>
                    <td><input type="text" name="birth" value="<%= year %>년  <%=month %>월  <%=day %>일" ></td>
                     
                </tr>
                
            </table>
            <br>
            </div>
            <label><strong>자기소개</strong></label> <br>
            <textarea name="introduction" cols="80" rows="8"style="resize: none;"><%= intro %></textarea>
        </form>
        	<div id="fileArea">
                <input type="file" name="profile" id="profile" onchange="loadImg(this);">
            </div>
        </div>
    </div>
    <script>
    function checkCode(){
        var v1 = $("#code_check").value;
        var v2 = $("#code")value;
        if(v1 != v2) {
            document.getElementById("checkCode").style.color = "red";
            document.getElementById("checkCode").innerHTML = "잘못된인증번호입니다"
            makeNull();
        }else {
            document.getElementById("checkCode").style.color = "blue";
            document.getElementById("checkCode").innerHTML = "인증되었습니다"
            makeReal();
        }
    }

    function makeReal() {
        var hi = document.getElementById("ok");
        ok.type="submit";
    }
    function makeNull() {
        var hi = document.getElementById("hi");
        hi.type="hidden";
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
                <input type="hidden" name="userId" value="<%=loginUser.getUserId()%>">
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
               <button type="submit" class="btn btn-secondary" id="nickChkBtn">닉네임변경</button>
           </form>
        </div>
      </div>
    </div>
  </div>
  
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
	  				}else {
	  					nickView.innerHTML = ("사용가능한 닉네임 입니다.");
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
            <input type="hidden" name="userId" value="<%=loginUser.getUserId()%>">
                <table>
                    <tr>
                        <th>현재 비밀번호 </th>
                        <td><input type="password" name="userPwd" required></td>
                    </tr>
                    <tr>
                        <th> 변경할 비밀번호 </th>
                        <td><input type="password" name="updatePwd" id="pwd1" required></td>
                    </tr>
                    <tr>
                        <th>변경할 비밀번호 재입력 </th>
                        <td><input type="password" name="checkPwd" id="pwd2" required>
                    	<br><span id="pwdSpan"></span></td>
                    </tr>
                </table>
                <br>
               <button type="submit" class="btn btn-secondary" >비밀번호변경</button>
           </form>

        </div>
      </div>
    </div>
  </div>
  
  <!-- 
<!-- 이메일인증 버튼 클릭시 보여질 Modal-->
<div class="modal" id="updateEmailForm">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">이메일인증</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
        	<form action="" method="post" id="form1">
				<table>
					<tr>
						<th>변경할 이메일 </th>
						<td>
							<input type="text" id="receiver" name="receiver" placeholder="이메일을 입력하세요.">
						</td>
						<td>
							<input id="button" type="button" value="인증번호발송" class="btn btn-secondary btn-sm" onclick="emailChk();">
						</td>
						<td>
							<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
						</td>
					</tr>
				</table>
			</form>
			
		<button type="submit" class="btn btn-secondary">이메일확인</button>
        </div>
      </div>
    </div>
  </div>
  <script>
  -->         
  	function emailChk(){
  		var $updateEmail = $("#updateEmail");
  		$.ajax({
  			url:"<%= contextPath %>/sendEmail.in",
  			data:{updateEmail:$updateEmail.val(),code_check:$("#code_check").val()},
  			type:"post",
  			success:function(result){
  				
  				console.log("통신성공");
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
  </script>
    
    <script>
        $(function(){
            $("#fileArea").hide();
			
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
                  // 각 영역에 맞춰서 이미지 미리보기
                    //console.log(e.target.result);
                    $("#profileImg").attr("src",e.target.result);
                };
            }else {
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
	
	
</body>
</html>