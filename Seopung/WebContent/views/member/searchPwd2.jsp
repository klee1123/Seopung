<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	margin-top: 150px;
}

#searchPwd2 {
	margin: auto;
	border: 1px solid grey;
}

#searchForm th {
	width: 120px;
	text-align: left;
	font-size: 17px;
	color: grey;
	line-height: 60px;
}

#searchForm input[type=password] {
	width: 280px;
	height: 30px;
}

td>button {
	font-weight: bold;
	border: none;
	width: 100px;
	height: 35px;
}

table+br+button {
	background: dimgrey;
	font-size: 15px;
	font-weight: bold;
	color: white;
	margin-left: 25px;
	width: 220px;
	height: 35px;
}

</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer" id="Pwd">
		<form action="<%=contextPath%>/changePwd.me" method="post">
			<fieldset id="searchPwd2" style="width: 460px; height: 380px;"
				align="center">
				<br>
				<input type="hidden" name="userId" id="userId" value="<%=id%>">
				<p style="font-size: 22px; font-weight: bold; color: dimgray">비밀번호
					변경</p>
				<p style="font-size: 16px; color: grey;">
					인증이 완료되었습니다. <br> 변경하실 비밀번호를 입력해주세요.
				</p>
				<br>
				<div style="border: 1px solid dimgray;"></div>
				<br>
				<table id="searchForm">
					<tr>
						<th>&nbsp;비밀번호</th>
						<td><input type="password" name="pwd" id="pwd" required
							placeholder="&nbsp;8 ~15자 영문 대ㆍ소문자, 숫자, 특수문자"></td>

					</tr>
					<tr>
						<th>&nbsp;비밀번호 확인</th>
						<td><input type="password" id="checkPwd" name="checkPwd" required
							placeholder="&nbsp;8 ~15자 영문 대ㆍ소문자, 숫자, 특수문자"></td>

					</tr>
					<div id="validPwdArea" style=" color:red; margin-top:50px; margin-left:120px; position:absolute;"></div>
				</table>
				<br>

				<button id="change" type="submit">비밀번호 변경</button>
			</fieldset>

		</form>
	</div>
	<script>
	$(function(){
		var pwd = $("#pwd");
		var checkPwd= $("#checkPwd");
		$("#change").click(function(){
			if(pwd.val() != checkPwd.val()){
				alert("비밀번호가 일치하지 않습니다.");
				checkPwd.val("");
				checkPwd.focus();
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
				$("#pwd").val("");
			}
			
		});
		
	});
		
	</script>
</body>
</html>