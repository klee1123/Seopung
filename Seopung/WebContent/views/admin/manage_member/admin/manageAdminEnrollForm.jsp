<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.outer {
		width: 500px;
		margin: auto;
	}
	
	#adminListForm th {
		color: red;
	}
	
	#adminListForm input {
		text-align: center;
		width: 100%;
		height: 73%;
	}
	
	#adminListForm td {
		height: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">관리자 등록</h1>
		-->
		
		<br>
		
		<div class="outer" align="center">
			<form action="<%= contextPath %>/adminPage/insert.ad" method="post" id="adminListForm"
				onsubmit="return validateForm()">

				<table align="center">
					<tr>
						<th width="15px">*</th>
						<td width="120px">아이디</td>
						<td width="400px"><input type="text" name="adminId"
							id="adminId" class="form-control" onfocusin="validateIdin(this);"
							onfocusout="validateIdout(this);"></td>
					</tr>
					<tr id="validateIdArea"></tr>
					<tr>
						<th>*</th>
						<td>비밀번호</td>
						<td><input type="password" name="adminPwd" id="adminPwd"
							class="form-control" onfocusin="validatePwdin(this);"
							onfocusout="validatePwdout(this);"></td>
					</tr>
					<tr id="validatePwdArea"></tr>
					<tr>
						<th>*</th>
						<td>비밀번호 확인</td>
						<td><input type="password" id="checkPwd" class="form-control"
							onfocusin="checkPwdin(this);" onfocusout="checkPwdout(this);"></td>
					</tr>
					<tr id="checkPwdArea"></tr>
					<tr>
						<th>*</th>
						<td>성명</td>
						<td><input type="text" name="adminName" id="adminName"
							class="form-control" onfocusin="validateNamein(this);"
							onfocusout="validateNameout(this);"></td>
					</tr>
					<tr id="validateNameArea"></tr>
				</table>

				<br>
				<br>
				<br>

				<div align="center">
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
			
			<br><br><br>

		</div>


		<script>
			var idcheck = 0;	
		
			// 아이디 중복 검사
			function idCheck(){
				var $adminId = $("#adminId");
				
				$.ajax({
					url:"<%=contextPath%>/idCheck.ad",
					data : {checkId : $adminId.val()},
					type : "get",
					success : function(result) {
						console.log(result);

						if (result == "fail") {
							idcheck = 0;
							$("#validateIdArea").html("<td></td><td></td><td style='font-size:12px; color:red;'>이미 존재하거나 탈퇴한 회원의 아이디입니다.</td>");
						} else {
							idcheck = 1;
							$("#validateIdArea").html("");
						}
					},
					error : function() {
						consoel.log("Ajax 통신 실패");
					}
				});
			}

			
			
			// 등록버튼 클릭시 전체 유효성 검사
			function validateForm() {

				var adminId = document.getElementById("adminId").value;
				var adminPwd = document.getElementById("adminPwd").value;
				var checkPwd = document.getElementById("checkPwd").value;
				var adminName = document.getElementById("adminName").value;

				var regExp1 = /^[a-z][a-z\d]{4,11}$/;
				var regExp2 = /^[a-z\d!@#$%^&*]{6,15}$/i;
				var regExp3 = /^[가-힣]{2,}$/;

				if (regExp1.test(adminId) && regExp2.test(adminPwd)
						&& (adminPwd == checkPwd) && regExp3.test(adminName)
						&& idcheck == 1) {
					return true;
				} else {
					alert("유효한 값을 입력해주세요.");
					return false;
				}

			}
			
			

			// 아이디 유효성 검사
			function validateIdin(input) {
				document.getElementById("validateIdArea").innerHTML = "<td></td><td></td><td style='font-size:12px;'>첫 글자가 영문 소문자인 5~12자 영문 소문자, 숫자를 입력해주세요.</td>";
			}

			function validateIdout(input) {

				var regExp = /^[a-z][a-z\d]{4,11}$/;

				if (regExp.test(input.value)) {

					idCheck();
					//document.getElementById("validateIdArea").innerHTML = "";
				} else {
					document.getElementById("validateIdArea").innerHTML = "<td></td><td></td><td style='font-size:12px; color:red;'>유효한 값을 입력해주세요.</td>";
				}
			}

			// 비밀번호 유효성 검사
			function validatePwdin(input) {
				document.getElementById("validatePwdArea").innerHTML = "<td></td><td></td><td style='font-size:12px;'>6~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</td>";
			}

			function validatePwdout(input) {

				var regExp = /^[a-z\d!@#$%^&*]{6,15}$/i;

				if (regExp.test(input.value)) {
					document.getElementById("validatePwdArea").innerHTML = "";
				} else {
					document.getElementById("validatePwdArea").innerHTML = "<td></td><td></td><td style='font-size:12px; color:red;'>유효한 값을 입력해주세요.</td>";
				}
			}

			// 비밀번호 일치 검사
			function checkPwdin(input) {
				document.getElementById("checkPwdArea").innerHTML = "";
			}

			function checkPwdout(input) {

				var adminPwd = document.getElementById("adminPwd").value;

				if (input.value == adminPwd) {
					document.getElementById("checkPwdArea").innerHTML = "";
				} else {
					document.getElementById("checkPwdArea").innerHTML = "<td></td><td></td><td style='font-size:12px; color:red;'>비밀번호가 일치하지 않습니다.</td>";
				}
			}

			// 이름 유효성 검사
			function validateNamein(input) {
				document.getElementById("validateNameArea").innerHTML = "";
			}

			function validateNameout(input) {
				var regExp = /^[가-힣]{2,}$/;

				if (regExp.test(input.value)) {
					document.getElementById("validateNameArea").innerHTML = "";
				} else {
					document.getElementById("validateNameArea").innerHTML = "<td></td><td></td><td style='font-size:12px; color:red;'>유효한 값을 입력해주세요.</td>";
				}
			}
		</script>

	</div>
	<!-- /.container-fluid -->

	<%@ include file="../../common/footer.jsp"%>

</body>
</html>