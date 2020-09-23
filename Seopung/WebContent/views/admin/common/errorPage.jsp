<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- 404 Error Text -->
		<div class="text-center">
			<div class="error mx-auto" data-text="ERROR" style="width: 370px;">ERROR</div>
			<p class="lead text-gray-800 mb-5"><%= errorMsg %></p>
			<p class="text-gray-500 mb-0">죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</p>
			<a href="javascript:window.history.back();">&larr; 이전 페이지로</a>
		</div>

	</div>
	<!-- /.container-fluid -->


	<%@ include file="footer.jsp"%>
</body>
</html>