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

#searchId1 {
	margin: auto;
	border: 1px solid grey;
}

#searchForm th {
	width: 100px;
	text-align: left;
	font-size: 17px;
	color: grey;
	line-height: 60px;
}

#searchForm input[type=text] {
	width: 200px;
	height: 30px;
}

td>button {
	font-weight: bold;
	border: none;
	width: 100px;
	height: 35px;
}

::placeholder {
	font-size: 15px;
	font-weight: bold;
	color: lightgrey
}

table+br+button {
	width: 80px;
	height: 35px;
	font-size: 15px;
	font-weight: bold;
	border: none;
	background: dimgray;
	color: white;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer" id="searchId">
		<form action="<%=contextPath%>/searchId2.me" method="post">
			<fieldset style="width: 460px; height: 330px;" id="searchId1"
				align="center">
				<p style="font-size: 22px; font-weight: bold; color: dimgray">아이디
					찾기</p>
				<p style="font-size: 16px; color: grey;">
					본인확인 이메일 주소와입력한 이메일 주소가<br> 같아야 아이디를 찾을 수 있습니다.
				</p>
				<br>
				<div style="border: 1px solid dimgray;"></div>
				<br>
				<table id="searchForm">
					<tr>
						<th>&nbsp;이름</th>
						<td><input type="text" name="userName" required
							placeholder="이름"></td>
						<td></td>
					</tr>
					<tr>
						<th>&nbsp;이메일</th>
						<td><input type="text" name="email" required
							placeholder="이메일"></td>
						<td></td>
					</tr>

				</table>
				<br>
				<button type="submit">다음</button>
			</fieldset>

		</form>
	</div>
</body>
</html>