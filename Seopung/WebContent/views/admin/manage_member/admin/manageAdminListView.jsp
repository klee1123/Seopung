<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.PageInfo, com.kh.admin.model.vo.Admin" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Admin> list = (ArrayList<Admin>)request.getAttribute("list");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.outer {
		margin: auto;
		width: 1000px;
	}
</style>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">관리자 목록</h1>

		<br>

		<div class="outer">

			<table align="center" width="1000">
				<tr>
					<td width="830">
						<form action="" method="GET">
							<label for="">관리자ID</label> <input type="text"
								placeholder="아이디 입력" name="adminId">
							<button type="submit" onclick="location.href='<%=contextPath %>/search.ad';" class="btn btn-secondary btn-sm">조회</button>
						</form>
					</td>
					<td>
						<button onclick="selectNonMem();" class="btn btn-secondary btn-sm">탈퇴한 관리자만 조회</button>
					</td>
				</tr>
			</table>

			<br>

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align: center;">
					<tr>
						<th width="75px">번호</th>
						<th width="120px">아이디</th>
						<th width="120px">이름</th>
						<th width="150px">가입일</th>
						<th width="150px">탈퇴일</th>
						<th width="75px">관리</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<% if(list.isEmpty()){ %>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
					<% }else{ %>
						<% for(Admin a : list){ %>
						<tr>
							<td><%= a.getAdminNo() %></td>
							<td><%= a.getAdminId() %></td>
							<td><%= a.getAdminName() %></td>
							<td><%= a.getEnrollDate() %></td>
							<% if(a.getStatus().equals("N")){ %>
							<td><%= a.getModifyDate() %></td>
							<% }else{ %>
							<td></td>
							<% } %>
							<td><button class="btn btn-outline-dark btn-sm" onclick="location.href='<%=contextPath%>/detail.ad?adminNo=<%=a.getAdminNo()%>';">보기</button></td>
						</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 관리자 수 &nbsp;&nbsp;&nbsp;<b
								style="color: red"><%= listCount %></b> 명
						</span></td>
						<td width="720px;">
							<div align="center">
								<% if(currentPage != 1){ %>
								<button onclick="location.href='<%= contextPath %>/list.ad?currentPage=1';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
								<button onclick="location.href='<%= contextPath %>/list.ad?currentPage=<%= currentPage-1 %>';" class="btn btn-secondary btn-sm">&lt;</button>
								<% } %>
	
								<% for(int p=startPage; p<=endPage; p++){ %>
									<% if(p != currentPage){ %>
									<button onclick="location.href='<%= contextPath %>/list.ad?currentPage=<%= p %>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% }else{ %>	
									<button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% } %>
								<% } %>

								<% if(currentPage != maxPage){ %>
								<button onclick="location.href='<%= contextPath %>/list.ad?currentPage=<%= currentPage+1 %>';" class="btn btn-secondary btn-sm">&gt;</button>
								<button onclick="location.href='<%= contextPath %>/list.ad?currentPage=<%= maxPage %>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
								<% } %>
							</div>
						</td>
						<td width="">
							<button class="btn btn-primary" onclick="location.href='<%=contextPath%>/enrollForm.ad'">등록</button>
						</td>
					</tr>
				</table>
			</div>

			<br>
			<br>
			<br>

		</div>
		<script>
		 function selectNonMem(){
			 
			 
		 }
		
		
		</script>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../../common/footer.jsp"%>

</body>
</html>