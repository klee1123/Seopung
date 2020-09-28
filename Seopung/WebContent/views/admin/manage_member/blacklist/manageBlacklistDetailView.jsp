<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.PageInfo, com.kh.adminMember.model.vo.Report" %>
<%
	int userNo = (int)request.getAttribute("userNo");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Report> reportList = (ArrayList<Report>)request.getAttribute("reportList");
	
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
<title>서풍-관리자페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">블랙리스트 신고내역조회</h1>
		-->
		<br>

		<div class="outer">

			<h5>
				<b><%=reportList.get(0).getUserNo2() %></b> 님에 대한 신고내역
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
					<% if(reportList.isEmpty()){ %>
					<tr>
						<td colspan="5">조회된 리스트가 없습니다.</td>
					</tr>
					<% }else{ %>
						<% for(Report r : reportList){ %>
						<tr>
							<td><%= r.getReportNo() %></td>
							<td><%= r.getReportContent() %></td>
							<td><%= r.getReportType() %></td>
							<td><%= r.getReportDate() %></td>
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
							<div align="center">
								<% if(currentPage != 1){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/detail.bl?currentPage=1&uno=<%=userNo%>';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/detail.bl?currentPage=<%= currentPage-1 %>&uno=<%=userNo%>';" class="btn btn-secondary btn-sm">&lt;</button>
								<% } %>
	
								<% for(int p=startPage; p<=endPage; p++){ %>
									<% if(p != currentPage){ %>
									<button onclick="location.href='<%= contextPath %>/adminPage/detail.bl?currentPage=<%= p %>&uno=<%=userNo%>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% }else{ %>	
									<button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% } %>
								<% } %>

								<% if(currentPage != maxPage){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/detail.bl?currentPage=<%= currentPage+1 %>&uno=<%=userNo%>';" class="btn btn-secondary btn-sm">&gt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/detail.bl?currentPage=<%= maxPage %>&uno=<%=userNo%>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
								<% } %>
							</div>
						</td>
						<td width="">
							<button class="btn btn-primary" id="btnDelete">블랙리스트 해제</button>
						</td>
					</tr>
				</table>

				<br>
			</div>

			<br>

		</div>

		<script>
			// 제목 선택시 상세조회 페이지로 이동
            $(function(){
            	$("#listArea>tbody>tr").each(function(){
                    $(this).find("td:eq(1)").css("cursor","pointer");
                  
                    $(this).find("td:eq(1)").click(function(){
                      location.href = "<%= contextPath %>/adminPage/detail.rp?currentPage=1&rpno=" + $(this).prev().text();
                    });
                  });
			});
			
         	
         	// 삭제시
            $(function(){
            	$("#btnDelete").click(function(){

	              	if(confirm("정말 해제하시겠습니까?")) {
	                	location.href="<%=contextPath%>/adminPage/remove.bl?uno=<%=userNo%>";
	              	} 
	            });
            });
		</script>

	</div>
	<!-- /.container-fluid -->


	<%@ include file="../../common/footer.jsp"%>


</body>
</html>