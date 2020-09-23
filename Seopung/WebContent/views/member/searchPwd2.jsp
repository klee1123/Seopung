<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	margin-top: 120px;
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

#searchForm input[type=text] {
	width: 250px;
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
	<div class="outer" id="changePwd">
		<form action="">
			<fieldset id="searchPwd2" style="width: 460px; height: 380px;"
				align="center">
				<br>
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
						<td><input type="text" name="userName"
							placeholder="&nbsp;8 ~15자 영문 대ㆍ소문자, 숫자, 특수문자"></td>

					</tr>
					<tr>
						<th>&nbsp;비밀번호 확인</th>
						<td><input type="text" name="email"
							placeholder="&nbsp;8 ~15자 영문 대ㆍ소문자, 숫자, 특수문자"></td>

					</tr>

				</table>
				<br>

				<button>비밀번호 변경</button>
			</fieldset>

		</form>
	</div>
</body>
</html>