<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.PageInfo, com.kh.adminMember.model.vo.Member" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	int keyfield = (int)request.getAttribute("keyfield");
	String keyword = (String)request.getAttribute("keyword");
	String status = (String)request.getAttribute("status");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서풍-관리자페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
  .outer {
    margin: auto;
    width: 1000px;
  }
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">회원목록</h1>
		-->
		
		<br>

		<div class="outer">

			<table align="center" width="950">
				<tr>
					<td width="890">
						<form action="" method="GET">
							<input type="hidden" name="currentPage" value="1">
							<input type="hidden" name="status" value="<%=status%>">
							<select name="keyfield">
								<%if(keyfield==2){%>
								<option value="1">이름</option>
								<option value="2" selected>아이디</option>
								<%}else{%>
								<option value="1">이름</option>
								<option value="2">아이디</option>
								<%}%>
							</select>
							<input type="text" name="keyword" value="<%=keyword%>">
							<button type="submit" class="btn btn-secondary btn-sm">조회</button>
						</form>
					</td>
					<td>
						<button class="btn btn-outline-primary btn-sm dropdown-toggle"
							type="button" id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">분류</button>
						<div class="dropdown-menu animated--fade-in"
							aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="<%=contextPath %>/adminPage/list.me?currentPage=1&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=">전체</a> 
							<a class="dropdown-item" href="<%=contextPath%>/adminPage/list.me?currentPage=1&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=Y">회원</a> 
							<a class="dropdown-item" href="<%=contextPath %>/adminPage/list.me?currentPage=1&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=N">탈퇴</a>
							<a class="dropdown-item" href="<%=contextPath %>/adminPage/list.me?currentPage=1&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=B">블랙리스트</a>
						</div>
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
						<th width="150px">상태</th>
						<th width="75px">관리</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<% if(list.isEmpty()){ %>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
					<% }else{ %>
						<% for(Member a : list){ %>
						<tr>
							<td><%= a.getUserNo() %></td>
							<td><%= a.getUserId() %></td>
							<td><%= a.getUserName() %></td>
							<td><%= a.getEnrollDate() %></td>
							<% if(a.getStatus().equals("N")){ %>
							<td>탈퇴</td>
							<% }else if(a.getStatus().equals("Y")){ %>
							<td>회원</td>
							<% }else{ %>
							<td>블랙리스트</td>
							<%} %>
							<td><button class="btn btn-outline-dark btn-sm" onclick="location.href='<%=contextPath%>/adminPage/detail.me?userNo=<%=a.getUserNo()%>';">보기</button></td>
						</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 회원수 &nbsp;&nbsp;&nbsp;<b
								style="color: red"><%= listCount %></b> 명
						</span></td>
						<td width="760px;">
							<div align="center">
								<% if(currentPage != 1){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=1&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=<%=status%>';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= currentPage-1 %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=<%=status%>';" class="btn btn-secondary btn-sm">&lt;</button>
								<% } %>
	
								<% for(int p=startPage; p<=endPage; p++){ %>
									<% if(p != currentPage){ %>
									<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= p %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=<%=status%>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% }else{ %>	
									<button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% } %>
								<% } %>

								<% if(currentPage != maxPage){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= currentPage+1 %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=<%=status%>';" class="btn btn-secondary btn-sm">&gt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= maxPage %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>&status=<%=status%>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
								<% } %>
							</div>
						</td>
						<td width="75">
						</td>
					</tr>
				</table>
			</div>

			<br>
			<br>

		</div>


	</div>
	<!-- /.container-fluid -->


	<%@ include file="../../common/footer.jsp"%>

</body>
</html>