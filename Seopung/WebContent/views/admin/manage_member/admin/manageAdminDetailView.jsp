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
		<h1 class="h3 mb-4 text-gray-800">관리자 상세조회</h1>
		-->
		
		<br>
		
		<div class="outer" align="center">
			
			<form id="adminListForm">
				<table align="center">
						<tr>
							<th width="15px">*</th>
							<td width="120px">아이디</td>
							<td width="400px"><input type="text"
								value="<%=ad.getAdminId()%>" class="form-control" readonly></td>
						</tr>
						<tr>
							<th>*</th>
							<td>성명</td>
							<td><input type="text" value="<%= ad.getAdminName() %>"
								class="form-control" readonly></td>
						</tr>
						<tr>
							<th></th>
							<td>가입일</td>
							<td><input type="text" value="<%= ad.getEnrollDate() %>" readonly
								class="form-control"></td>
						</tr>
						<tr>
							<th></th>
							<td>탈퇴일</td>
							<% if(ad.getStatus().equals("Y")){%>
							<td><input type="text" value="-" readonly
								class="form-control"></td>
							<% }else{ %>
							<td><input type="text" value="<%= ad.getModifyDate() %>" readonly
								class="form-control"></td>
							<% } %>
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
							<% if(ad.getStatus().equals("Y")){%>
							<td><input type="text" value="회원" disabled
								class="form-control"></td>
							<%}else{ %>
							<td><input type="text" value="탈퇴" disabled
								class="form-control"></td>
							<%} %>
						</tr>
					</table>
					
					<br><br>
					
					<div align="center">
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
					</div>
				</form>

			<br><br><br>
			
		</div>

	</div>
	<!-- /.container-fluid -->


	<%@ include file="../../common/footer.jsp"%>

</body>
</html>