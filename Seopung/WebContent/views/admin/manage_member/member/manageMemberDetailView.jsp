<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.adminMember.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width: 900px;
		margin: auto;
	}
	
	#memberListForm th {
		color: red;
	}
	
	#memberListForm input {
		text-align: center;
		width: 100%;
		height: 73%;
	}
	
	#memberListForm textarea {
		width: 100%;
	}
	
	#memberListForm>div {
		display: inline-block;
		margin: 30px;
	}
	
	#memberListForm td {
		height: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">회원상세조회</h1>
		-->
		
		<br>
		<div class="outer" align="center">
			<form action="<%= contextPath %>/adminPage/update.me" method="post" id="memberListForm" onsubmit="return validateForm()">
				<div>
					<table>
						<tr>
							<td colspan="2" align="center"><img
								src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
								alt="프로필사진" height="150px;"></td>
						</tr>
						<tr>
							<th width="15px">*</th>
							<td width="300px">닉네임</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="userNickname"  class="form-control"
								value="nickname" required></td>
						</tr>
						<tr>
							<td colspan="2">자기소개</td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="userSelfIntro" rows="5"  class="form-control"
									style="resize: none;">안녕하세요</textarea></td>
						</tr>
					</table>


				</div>

				<div>
					<table align="center">
						<tr>
							<th width="15px">*</th>
							<td width="90px">아이디</td>
							<td width="300px"><input type="text" value="userId"  class="form-control" readonly></td>
						</tr>
						<tr>
							<th>*</th>
							<td>성명</td>
							<td><input type="text" name="userName" id="userName" value="아무개"  class="form-control" onfocusin="validateNamein(this);"
							onfocusout="validateNameout(this);" required></td>
						</tr>
						<tr id="validateNameArea"></tr>
						<tr>
							<th>*</th>
							<td>생년월일</td>
							<td><input type="date" name="birthday" value="1999.09.09"  class="form-control" required></td>
						</tr>
						<tr>
							<th>*</th>
							<td>이메일</td>
							<td><input type="text" name="email" value="amugae@gmail.com"  class="form-control" required></td>
						</tr>
						<tr>
							<th></th>
							<td>가입일</td>
							<td><input type="text" value="2020.09.09"  class="form-control" readonly></td>
						</tr>
						<tr>
							<th></th>
							<td>탈퇴일</td>
							<td><input type="text" value="-" class="form-control" readonly></td>
						</tr>
						<tr>
							<th></th>
							<td>최종수정일</td>
							<td><input type="text" value="2020.09.09" class="form-control" readonly></td>
						</tr>
						<tr>
							<th></th>
							<td>상태</td>
							<td><input type="text" value="회원" class="form-control" readonly></td>
						</tr>
					</table>
				</div>

				<br>

				<div align="center">
					<button type="button" onclick="history.back();" class="btn btn-secondary">취소</button>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">탈퇴</button>
				</div>
			</form>
		</div>
		
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">회원 탈퇴</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<form action="<%=contextPath%>/adminPage/delete.me" method="post">
						<div class="modal-body">
							<input type="hidden" name="deleteAdminNo" value="">
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
	            
				var userName = document.getElementById("userName").value;

                var regExp1 = /^[가-힣]{2,}$/;

                if (regExp1.test(userName)) {
					return true;
				} else {
					alert("유효한 값을 입력해주세요.");
					return false;
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