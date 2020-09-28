<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.adminMember.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");

	String year = m.getBirth().substring(0, 4);
	String month = m.getBirth().substring(4, 6);
	String day = m.getBirth().substring(6);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<input type="hidden" name="userNo" value="<%= m.getUserNo()%>">
				<input type="hidden" name="profilePath" value="<%=m.getProfile() %>" id="profilePath">
				<div>
					<table>
						<tr>
							<td colspan="2" align="center">
								<%if(m.getProfile()==null || m.getProfile().equals("null")){ %>
								<img src="https://ucanr.edu/sb3/display_2018/images/default-user.png" 
								alt="프로필사진" height="180px;" width="180px;"  class="rounded-circle">
								<%}else{ %>
								<img src="<%=contextPath %>/<%=m.getProfile() %>" id="propicPreview"
								alt="프로필사진" height="180px;" width="180px;"  class="rounded-circle">
								<%if(m.getStatus().equals("Y")){  %>
								<br>
								<div align="right">
									<button type="button" class="btn btn-outline-secondary btn-sm" onclick="deletePropic();">삭제</button>
									<button type="button" class="btn btn-outline-secondary btn-sm" onclick="cancelDelete();">취소</button>
								</div>
								<%} %>
								<%} %>
							</td>
						</tr>
						<tr>
							<th width="15px">*</th>
							<td width="300px">닉네임</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="userNickname"  class="form-control"
								value="<%= m.getNickName() %>" required></td>
						</tr>
						<tr>
							<td colspan="2">자기소개</td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="userSelfIntro" rows="5"  class="form-control"
									style="resize: none;"><%=m.getUserIntro() %></textarea></td>
						</tr>
					</table>


				</div>

				<div>
					<table align="center">
						<tr>
							<th width="15px">*</th>
							<td width="90px">아이디</td>
							<td width="300px"><input type="text" value="<%=m.getUserId() %>"  class="form-control" readonly></td>
						</tr>
						<tr>
							<th>*</th>
							<td>성명</td>
							<td><input type="text" name="userName" id="userName" value="<%=m.getUserName() %>"  class="form-control" onfocusin="validateNamein(this);"
							onfocusout="validateNameout(this);" required></td>
						</tr>
						<tr id="validateNameArea"></tr>
						<tr>
							<th>*</th>
							<td>생년월일</td>
							<td class="form-row" style="padding-top:6px;padding-left:6px;">
					           <input type="number" value="<%=year%>" name="year" class="form-control mr-sm-2" min="1920" max="2020" style="width:110px;height:36px;" required>
					           <input type="number" value="<%=month%>" name="month" class="form-control mr-sm-2" min="1" max="12" style="width:85px;height:36px;" required>
					           <input type="number" value="<%=day%>" name="day" class="form-control mr-sm-2" min="1" max="31" style="width:85px;height:36px;" required>					           
							</td>
						</tr>
						<tr>
							<th>*</th>
							<td>이메일</td>
							<td><input type="text" name="email" value="<%=m.getEmail() %>"  class="form-control" required></td>
						</tr>
						<tr>
							<th></th>
							<td>가입일</td>
							<td><input type="text" value="<%=m.getEnrollDate() %>"  class="form-control" readonly></td>
						</tr>
						<tr>
							<th></th>
							<td>탈퇴일</td>
							<%if(m.getStatus().equals("Y")){ %>
							<td><input type="text" value="-" class="form-control" readonly></td>
							<%}else{ %>
							<td><input type="text" value="<%=m.getModifyDate() %>" class="form-control" readonly></td>
							<%} %>
						</tr>
						<tr>
							<th></th>
							<td>최종수정일</td>
							<td><input type="text" value="<%=m.getModifyDate() %>" class="form-control" readonly></td>
						</tr>
						<tr>
							<th></th>
							<td>상태</td>
							<%if(m.getStatus().equals("Y")){  %>
							<td><input type="text" value="회원" class="form-control" readonly></td>
							<%}else if(m.getStatus().equals("N")){ %>
							<td><input type="text" value="탈퇴" class="form-control" readonly></td>
							<%}else{ %>
							<td><input type="text" value="블랙리스트" class="form-control" readonly></td>
							<%} %>
						</tr>
					</table>
				</div>

				<br>

				<div align="center">
					<button type="button" onclick="location.href='<%=contextPath %>/adminPage/list.me?currentPage=1';" class="btn btn-secondary">취소</button>
					<%if(m.getStatus().equals("Y")){ %>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">탈퇴</button>
					<%} %>
				</div>
			</form>
			<br>
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
							<input type="hidden" name="deleteUserNo" value="<%=m.getUserNo()%>">
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
			
			
			// 프로필사진
			function deletePropic() {
				$("#propicPreview").attr("src", "https://ucanr.edu/sb3/display_2018/images/default-user.png");
				$("#profilePath").val("null");
			}
			
			function cancelDelete(){
				$("#propicPreview").attr("src", "<%=contextPath%>/<%=m.getProfile() %>");
				$("#profilePath").val("<%=m.getProfile() %>");
			}
		
			// 탈퇴, 블랙리스트 회원 read only로 변경
			$(function(){
				if("<%=m.getStatus()%>"!="Y"){
					$("#memberListForm input").attr('readonly', true);
					$("textarea[name='userSelfIntro']").attr('readonly', true);
				}
			});
		</script>


	</div>
	<!-- /.container-fluid -->
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>