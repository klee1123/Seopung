<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!public int getRandom() {
		int random = 0;
		random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000;
		return random;
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	margin-top: 150px;
}

#searchPwd1 {
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

table+br+button+button {
	background: white;
	font-size: 15px;
	font-weight: bold;
	color: grey;
	margin-left: 25px;
	width: 170px;
	height: 35px;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer" id="searchPwd">
		<form action="<%=contextPath%>/searchPwd2.me" method="post">
			<fieldset id="searchPwd1" style="width: 460px; height: 430px;"
				align="center">
				<br>
				<p style="font-size: 22px; font-weight: bold; color: dimgray">비밀번호
					찾기</p>
				<p style="font-size: 16px; color: grey;">
					본인확인 이메일 주소와입력한 이메일 주소가<br> 같아야 인증번호를 받을 수 있습니다.
				</p>
				<br>
				<div style="border: 1px solid dimgray;"></div>
				<br>
				<table id="searchForm">
					<tr>
						<th>&nbsp;아이디</th>
						<td><input type="text" required name="userId"
							placeholder="아이디"></td>
						<td></td>
					</tr>
					<tr>
						<th>&nbsp;이메일</th>
						<td><input type="text" id="email" required name="email"
							placeholder="이메일"></td>
						<td><button type="button" onclick="send();">인증번호 발송</button></td>
					</tr>
					<tr>
						<th>&nbsp;이메일인증</th>
						<td><input type="text" id="checkNum" required
							placeholder="인증번호 입력"></td>
						<input type="hidden" readonly="readonly" name="code_check"
							id="code_check" value="<%=getRandom()%>">
						<td></td>
					</tr>
				</table>
				<br>
				<button type="submit" id="next">다음</button>
				<button onclick="location.href='<%=contextPath%>/searchId.me'"
					type="button">아이디 찾기</button>
			</fieldset>

		</form>
		<script>
		function send(){
			$.ajax({
				url:"<%=contextPath%>/send",
					data : {
						email : $("#email").val(),
						code_check : $("#code_check").val()
					},
					type : "post",
					success : function(data) {
						console.log("ajax통신 성공");
						alert(data);
					},
					error : function() {
						console.log("ajax통신 실패");
					}

				});
			}
			$(function() {
				$("#next").click(function() {
					if ($("#code_check").val() != $("#checkNum").val()) {
						alert("인증번호가 일치하지 않습니다.");
						$("#checkNum").val("")
						$("#checkNum").focus();
					}
				})
			});
		</script>
	</div>
</body>
</html>