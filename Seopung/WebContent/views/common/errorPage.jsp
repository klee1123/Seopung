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
<style>
.outer{
	width:1000px;
	margin:auto;
	margin-top:160px;
}
#errorPage a, #errorPage p{
	font-size: 20px;
}
</style>
</head>
<body>

	<%@include file="../common/menubar.jsp" %>
	
	<div class="outer" align="center">

		<div id="errorPage">
			<img src="<%=contextPath%>/resources/images/about_img.png" width="350">
			<br><br><br>
			<p class="lead text-gray-800 mb-5"><%= errorMsg %></p>
			<p class="text-gray-500 mb-0">죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</p>
			<a href="javascript:window.history.back();">&larr; 이전 페이지로</a> <br>
			<a href="<%=contextPath%>">&larr; 홈페이지로</a> <br>
		
		</div>
	</div>
	
	
	<%@include file="../common/footer.jsp"%>

</body>
</html>