<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import = "java.util.ArrayList, com.kh.adminNotice.model.vo.AdminNotice, com.kh.common.PageInfo" %>
<%
    ArrayList<AdminNotice> list = (ArrayList<AdminNotice>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");
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
<style>
    .outer{
        margin:auto;
        width:1000px;
    }

</style>
</head>
<body>


	<%@ include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading
		<h1 class="h3 mb-4 text-gray-800">공지사항</h1>-->

		<br>
		
		<div class="outer">

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align:center;">
					<tr>
						<th width="50px"><input type="checkbox"></th>
						<th width="75px">번호</th>
						<th width="200px">제목</th>
						<th width="100px">작성일</th>
						<th width="100px">조회수</th>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<% if(list.isEmpty()){ %>
	                    <tr>
	                        <td colspan="5">조회된 리스트가 없습니다.</td>
	                    </tr>
	                    <% }else{ %>
	                        <% for(AdminNotice n : list){ %>
	                        <tr>
	                            <td><input type="checkbox" id="chk" name="rno" value="<%=n.getNoticeNo()  %>"></td>
	                            <td><%= n.getNoticeNo() %></td>
	                            <td><%= n.getNoticeTitle() %></td>
	                            <td><%= n.getNoticeEnroll() %></td>
	                            <td><%= n.getNoticeViews() %></td>
	                        </tr>
	                        <% } %>
	                    <% } %>
					
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 게시글 수 &nbsp;&nbsp;&nbsp;<b
								style="color: black"><%=listCount%></b>개
						</span></td>
						<td width="720px;">
							<div align="center">
								<% if(currentPage != 1){ %>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.no?currentPage=1';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.no?currentPage=<%= currentPage-1 %>';" class="btn btn-secondary btn-sm">&lt;</button>
	                                <% } %>
	
	                                <% for(int p=startPage; p<=endPage; p++){ %>
	                                    <% if(p != currentPage){ %>
	                                    <button onclick="location.href='<%= contextPath %>/adminPage/list.no?currentPage=<%= p %>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
	                                    <% }else{ %>
	                                    <button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
	                                    <% } %>
	                                <% } %>
	
	                                <% if(currentPage != maxPage){ %>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.no?currentPage=<%= currentPage+1 %>%>';" class="btn btn-secondary btn-sm">&gt;</button>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.no?currentPage=<%= maxPage %>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
	                                <% } %>
								
							</div>
						</td>
						<td width="">
							<button class="btn btn-primary">등록하기</button>
							
						</td>
					</tr>
				</table>
			</div>
			
			<br><br>

		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>
</body>
</html>