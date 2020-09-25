<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Admin ad = (Admin)request.getAttribute("ad");
%>
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
		<h1 class="h3 mb-4 text-gray-800">개인 정보 조회</h1>
		-->
		
		<br>
		
		<div class="outer" align="center">
			
			<form action="<%= contextPath %>/update.ad" method="post" id="adminListForm" onsubmit="return validateForm()">
				<input type="hidden" name="adminNo" value="<%=ad.getAdminNo()%>">
				<table align="center">
					<tr>
						<th width="15px">*</th>
						<td width="120px">아이디</td>
						<td width="400px"><input type="text" name="adminId" value="<%=ad.getAdminId()%>"
							class="form-control" readonly></td>
					</tr>
					<tr>
						<th>*</th>
						<td>비밀번호</td>
						<td><input type="password" name="adminPwd" id="adminPwd" value="<%=ad.getAdminPwd()%>"
							class="form-control" onfocusin="validatePwdin(this);"
							onfocusout="validatePwdout(this);"></td>
					</tr>
					<tr id="validatePwdArea"></tr>
					<tr>
						<th>*</th>
						<td>비밀번호 확인</td>
						<td><input type="password" id="checkPwd" class="form-control" value="<%=ad.getAdminPwd()%>"
							onfocusin="checkPwdin(this);" onfocusout="checkPwdout(this);"></td>
					</tr>
					<tr id="checkPwdArea"></tr>
					<tr>
						<th>*</th>
						<td>성명</td>
						<td><input type="text" name="adminName" id="adminName" value="<%= ad.getAdminName() %>"
							class="form-control" onfocusin="validateNamein(this);"
							onfocusout="validateNameout(this);"></td>
					</tr>
					<tr id="validateNameArea"></tr>
					<tr>
						<th></th>
						<td>가입일</td>
						<td><input type="text" value="<%= ad.getEnrollDate() %>" disabled
							class="form-control"></td>
					</tr>
					<tr>
						<th></th>
						<td>최종수정일</td>
						<td><input type="text" value="<%=ad.getModifyDate() %>" disabled
							class="form-control"></td>
					</tr>
					<tr>
						<th></th>
						<td>상태</td>
						<td><input type="text" value="관리자" disabled
							class="form-control"></td>
					</tr>
				</table>
				
				<br><br><br>

				<div align="center">
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">탈퇴</button>
				</div>
			</form>
			
			<br><br><br>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">관리자 탈퇴</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<form action="<%=contextPath%>/delete.ad" method="post">
						<div class="modal-body">
							<input type="hidden" name="deleteAdminNo" value="<%=ad.getAdminNo()%>">
							탈퇴를 원하시면 아래 [탈퇴] 버튼을 선택하여 주십시오.
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Modal end -->


		<script>
		
			// 수정버튼 클릭시 전체 유효성 검사
			function validateForm() {
	            
				var adminPwd = document.getElementById("adminPwd").value;
				var checkPwd = document.getElementById("checkPwd").value;
				var adminName = document.getElementById("adminName").value;

                var regExp1 = /^[a-z\d!@#$%^&*]{6,15}$/i;
                var regExp2 = /^[가-힣]{2,}$/;

                if ((regExp1.test(adminPwd)) && (adminPwd == checkPwd) 
                		&& regExp2.test(adminName)) {
					return true;
				} else {
					alert("유효한 값을 입력해주세요.");
					return false;
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