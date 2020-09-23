<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">관리자 상세조회</h1>

		<div class="outer" align="center">
			<form action="" method="post" id="adminListForm">
				<table align="center">
					<tr>
						<th width="15px">*</th>
						<td width="120px">아이디</td>
						<td width="400px"><input type="text" name="adminId"
							value="adminid" class="form-control"
							onfocusin="validateIdin(this);"
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
						<td><input type="password" class="form-control"
							onfocusin="checkPwdin(this);" onfocusout="checkPwdout(this);"></td>
					</tr>
					<tr id="checkPwdArea"></tr>
					<tr>
						<th>*</th>
						<td>성명</td>
						<td><input type="text" name="adminName" value="관리자"
							class="form-control" onfocusin="validateNamein(this);"
							onfocusout="validateNameout(this);"></td>
					</tr>
					<tr id="validateNameArea"></tr>
					<tr>
						<th></th>
						<td>가입일</td>
						<td><input type="text" value="2020.09.09" disabled
							class="form-control"></td>
					</tr>
					<tr>
						<th></th>
						<td>탈퇴일</td>
						<td><input type="text" value="-" disabled
							class="form-control"></td>
					</tr>
					<tr>
						<th></th>
						<td>최종수정일</td>
						<td><input type="text" value="2020.09.09" disabled
							class="form-control"></td>
					</tr>
					<tr>
						<th></th>
						<td>상태</td>
						<td><input type="text" value="회원" disabled
							class="form-control"></td>
					</tr>
				</table>
				
				<br><br><br><br>

				<div align="center">
					<button type="button" class="btn btn-secondary">취소</button>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger">탈퇴</button>
				</div>
			</form>

			<br>
		</div>

		<script>
			// 아이디 유효성 검사
			function validateIdin(input) {
				document.getElementById("validateIdArea").innerHTML = "<td></td><td></td><td style='font-size:12px;'>첫 글자가 영문 소문자인 5~12자 영문 소문자, 숫자를 입력해주세요.</td>";
			}

			function validateIdout(input) {

				var regExp = /^[a-z][a-z\d]{4,11}$/;

				if (regExp.test(input.value)) {
					document.getElementById("validateIdArea").innerHTML = "";
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
				regExp = /^[가-힣]{2,}$/;

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