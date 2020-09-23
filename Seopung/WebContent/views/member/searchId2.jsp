<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	margin-top: 150px;
}

#searchId2 {
	margin-top: 100px;
	margin: auto;
	border: 1px solid grey;
}

#login {
	cursor: pointer;
	margin-right: 20px;
	border-radius: 5px;
	width: 173px;
	height: 40px;
	font-size: 14px;
	font-weight: bold;
	background: white;
}

#searchPwd {
	cursor: pointer;
	border-radius: 5px;
	width: 173px;
	height: 40px;
	font-size: 14px;
	font-weight: bold;
	background: white;
}

#close {
	cursor: pointer;
	border-radius: 5px;
	border: none;
	width: 90px;
	height: 40px;
	font-size: 14px;
	font-weight: bold;
	background: dimgray;
	color: white;
}

#userId {
	margin-left: 15px;
	font-size: 20px;
	border: 1px solid grey;
	line-height: 50px
}

input[type=radio] {
	width: 15px;
	height: 15px;
	border: 1px;
	font-size: 20px;
	margin-top: 20px
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer">
		<form action="">
			<fieldset id="searchId2" style="width: 460px; height: 420px;"
				align="center">
				<br>
				<p style="font-size: 22px; font-weight: bold; color: dimgray">아이디
					찾기</p>
				<p style="font-size: 16px; color: grey;">
					고객님의 정보와 일치하는<br> 아이디 찾기가 완료되었습니다.
				</p>
				<br>
				<div style="border: 1px solid dimgray;"></div>
				<br>
				<fieldset style="width: 430px; height: 120px;" id="userId">
					<input type="radio" id="userId1" name="id"><label
						for="userId1">user01</label><br> <input type="radio"
						id="userId2" name="id"><label for="userId2">user02</label>
				</fieldset>
				<br>
				<button id=login>로그인</button>
				<button id="searchPwd">비밀번호 찾기</button>
				<br>
				<br>
				<button id="close">닫기</button>
		</form>
	</div>
</body>
</html>