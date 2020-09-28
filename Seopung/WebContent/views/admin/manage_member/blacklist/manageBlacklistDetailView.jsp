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
		<h1 class="h3 mb-4 text-gray-800">블랙리스트 신고내역조회</h1>

		<br>

		<div class="outer">

			<h5>
				<b>userId1</b> 님에 대한 신고내역
			</h5>

			<br>

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align: center;">
					<tr>
						<th width="75px">신고번호</th>
						<th width="300px">신고내용</th>
						<th width="150px">신고사유</th>
						<th width="150px">신고접수일</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<tr>
						<td>10</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<% if(list.isEmpty()){ %>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
					<% }else{ %>
						<% for(Member m : list){ %>
						<tr>
							<td><input type="checkbox" id="chk" name="uno" value="<%= m.getUserNo()%>"></td>
							<td><%= m.getUserNo() %></td>
							<td><%= m.getUserId() %></td>
							<td><%= m.getUserName() %></td>
							<td><%= m.getReportType() %></td>
							<td><%= m.getModifyDate() %></td>
						</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 신고수 &nbsp;&nbsp;&nbsp;<b
								style="color: red"><%=listCount %></b> 개
						</span></td>
						<td width="720px;">
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
						</td>
						<td width="">
							<button class="btn btn-primary">블랙리스트 해제</button>
						</td>
					</tr>
				</table>

				<br>
			</div>

			<br>

		</div>


	</div>
	<!-- /.container-fluid -->


	<%@ include file="../../common/footer.jsp"%>


</body>
</html>