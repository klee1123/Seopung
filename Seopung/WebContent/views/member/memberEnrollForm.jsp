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
<title>Insert title here</title>
<style>
.outer {
	margin-top: 120px;
}

#join>fieldset {
	width: 500px;
	height: 700px;
	border: 1px solid lightgrey;
	margin: auto;
	margin-top: 20px;
}

#join>span {
	font-size: 32px;
}

#join .head {
	margin-top: 40px;
	line-height: 15px;
	font-size: 25px;
}

.head2 {
	margin-right: 260px;
	line-height: 1px;
	font-size: 11px;
	color: grey;
}

#join2 {
	line-height: 50px;
	font-size: 16px;
}

input[type=text], input[type=password], input[type=email] {
	width: 250px;
	height: 25px;
	font-size: 12px;
}

table+button[type=submit], table+button+[type=reset] {
	margin-top: 40px;
	width: 200px;
	height: 40px;
	border: none;
	background: dimgray;
	color: white;
	font-weight: bold;
}

table button {
	border: none;
	width: 96px;
	height: 25px;
	border-radius: 5px;
	background: lightgrey;
	font-weight: bold;
	font-size: 13px;
	line-height: 20px;
}

input:placeholder {
	color: lightgrey;
	font-size: 10px;
}

#join2 th {
	width: 120px;
	text-align: left;
	color: grey;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer"></div>

	<form align="center" action="<%=contextPath %>/insert.me" id="join"
		method="post" onsubmit="retrun test();">
		<span>Seopung</span>
		<fieldset>
			<div class="head">서풍 회원가입 정보를 입력해주세요.</div>
			<br> <br>
			<div class="head2">
				<p>*는 필수 입력사항입니다.</p>
			</div>
			<br>
			<table id="join2">
				<tr>
					<th>&nbsp;&nbsp;*아이디</th>
					<td><input type="text" name="userId" id="Id" required
						maxlength="12" placeholder="&nbsp;4 ~ 12자 영문 대ㆍ소문자, 숫자"></td>
					<td>
						<button type="button" onclick="idCheck();">중복체크</button>
					</td>
				</tr>

				<tr>

					<th>&nbsp;&nbsp;*비밀번호</th>
					<td><input type="password" name="userPwd" required id="pwd"
						maxlength="15" placeholder="&nbsp;8 ~ 15자 영문 대ㆍ소문자, 숫자, 특수문자"></td>
					<td></td>
				</tr>
				<div id="validPwdArea"
					style="position: absolute; margin-top: 95px; margin-left: 120px; color: red;"></div>
				<tr>
					<th>&nbsp;&nbsp;*비밀번호 확인</th>
					<td><input type="password" required maxlength="15"
						id="checkPwd" placeholder="&nbsp; 비밀번호 확인"></td>
					<td></td>
				</tr>
				<tr>
					<th style="width: 109px;" align="left">&nbsp;&nbsp;*성명</th>
					<td><input type="text" name="userName" required maxlength="5"
						placeholder="&nbsp이름"></td>
					<td></td>
				</tr>
				<tr>
					<th style="width: 109px;" align="left">&nbsp;&nbsp;*닉네임</th>
					<td><input type="text" name="nickName" required
						placeholder="&nbsp 영문, 숫자, 한글 포함 10자"></td>
					<td><button type="button" onclick="nickCheck();">중복체크</button></td>
				</tr>
				<tr>
					<th style="width: 109px;" align="left">&nbsp;&nbsp;*생년월일</th>
					<td><input type="text" name="birth" required maxlength="8"
						placeholder="&nbsp생년월일8자리(ex19940322)"></td>
					<td><input type="radio" name="gender" value="M" id=g1 required>
						<label for="g1">남자</label> <input type="radio" name="gender"
						value="F" id=g2> <label for="g2">여자</label></td>
				</tr>

				<tr>
					<th style="width: 109px;" align="left">&nbsp;&nbsp;*이메일</th>
					<td><input type="email" name="email" id="email" required
						placeholder="&nbsp이메일"></td>
					<input type="hidden" readonly="readonly" name="code_check"
						id="code_check" value="<%=getRandom()%>">
					<td><button type="button" onclick="send();">인증번호 발송</button></td>

				</tr>
				<tr>
					<th style="width: 109px;" align="left">&nbsp;&nbsp;*이메일 인증</th>
					<td><input type="text" id="checkEmail" required placeholder="&nbsp인증번호 입력"></td>
					
					<td></td>
				</tr>
			</table>

			<button type="submit" disabled id="joinBtn" onclick="joinBtn();">회원가입</button>
			<button type="reset">취소</button>
		</fieldset>
	</form>
	</div>

	<%-- <form action="<%=contextPath %>/send" method="post" id="form1">
	<table>
		<tr>
			<td>
				<input type="text" id="receiver" name="receiver" placeholder="이메일을 입력하세요.">
			</td>
			<td>
				<input id="submit" type="submit" value="인증번호발송">
			</td>
			<td>
				<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
			</td>
		</tr>
	</table> 
	</form> --%>
	<!-- ajax로  -->
	<script>	
		function send(){
			$.ajax({
				url:"<%=contextPath%>/send",
				data:{
					email:$("#email").val(),
					code_check:$("#code_check").val()
				},
				type:"post",
				success:function(data){
					console.log("ajax통신 성공");
					alert(data);
				},
				error:function(){
					console.log("ajax통신 실패");
				}
				
			});
			
			
			
		}
		
		
		var regI =/^[a-z0-9]{4,12}$/i;
		function idCheck(){
			var $userId = $("#join2 input[name=userId]");
			$.ajax({
				url:"<%=contextPath%>/idCheck.me",
				data:{checkId:$userId.val()},
				type:"get",
				success:function(result){
					if(regI.test($userId.val())){
						
					if(result == "fail"){
						alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
						$userId.val("");
						$userId.focus();
					}else{
						if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
							$userId.attr("readonly", true);
							$("#joinBtn").removeAttr("disabled");
						}else{
							$userId.focus();
						}
					}
					
					}else{
						alert("유효한 아이디가 아닙니다.");
					}
				},
				error:function(){
					console.log("통신실패");
				}
			});
		}
		var regN = /^[a-z0-9가-힣]{1,10}$/i;
		function nickCheck(){
			var $nickName = $("#join2 input[name=nickName]");
			$.ajax({
				url:"<%=contextPath%>/nickCheck.me",
				data:{checkNick:$nickName.val()},
				type:"get",
				success:function(result){
					
					if(regN.test($nickName.val())){
						if(result == "fail"){
							alert("이미 존재하는 닉네임입니다.");
							$nickName.val("");
							$nickName.focus();
						}else{
							if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
								$nickName.attr("readonly", true);
							}else{
								$nickName.focus
							}
						}
					}else{
						alert("유효한 닉네임이아닙니다.")
					}
				},
				error:function(){
					
				}
			})
		}
			
				
			
		
		
			$(function(){
				var pwd = $("#pwd");
				var checkPwd= $("#checkPwd");
				$("#joinBtn").click(function(){
					if(pwd.val() != checkPwd.val()){
						alert("비밀번호가 일치하지 않습니다.");
						checkPwd.val("");
						checkPwd.focus();
					}		
					if($("#code_check").val() != $("#checkEmail").val()){
						alert("인증번호가 일치하지 않습니다.");
						$("#checkEmail").val("");
						$("#checkEmail").focus();
					}					
				});
			});
		
			var regP = /^[a-z0-9!@#$%^&*]{8,15}$/i;
		$(function(){
			$("#pwd").blur(function(){
				console.log($("#pwd").val());
				if(regP.test($("#pwd").val())){
					$("#validPwdArea").html("");
				}else{
					$("#validPwdArea").html("유효한 비밀번호가 아닙니다");
				}
				
			});
			
		});
	</script>

</body>
</html>