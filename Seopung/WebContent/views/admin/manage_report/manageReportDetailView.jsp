<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.adminReport.model.vo.AdminReport"%>
<%
	AdminReport r = (AdminReport)request.getAttribute("r");
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

.outer>div {
	box-sizing: border-box;
	/* border:1px solid black; */
	width: 100%;
}

#content_1 {
	height: 50px;
	background: lightgrey;
}

#content_2 {
	height: 25px;
}

#content_3 {
	height: 500px;
} /*임시*/

#content_4 {
	height: 500px;
}

#content_5 {
	height: 75px;
}

#content_7 {
	height: 40px;
	background: lightgrey;
}

#content_1>div {
	display: table-cell;
	height: 100%;
	padding: 10px;
	line-height: 40px;
}

#content_2>div {
	display: table-cell;
	height: 100%;
	padding-left: 10px;
	padding-right: 10px;
	line-height: 40px;
}

#content_3 {
	padding: 10px;
}

#content_6 table {
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">커뮤니티 상세조회</h1>
		-->
		<br>

		<div class="outer">

			<!-- 들어가는 요소 : 1.신고 타입 2.질문 등록일  / 
							3.신고당한아이디 4.신고자아이디
							5.회원 신고내용-->
			<div id="content_1">
				<div style="width: 740px; font-size: 18px;"><%=r.getReportType()%></div>
				<div style="text-align: right;"><%=r.getReportDate()%></div>
			</div>

			<div id="content_2">
                <div style="width: 740px;">신고된 아이디 <%= r.getUserNo2() %></div>
                <div style="width: 740px;">신고자 아이디 <%= r.getUserNo() %></div>
					
			</div>

			<hr>
			
			<!-- 사용자가 신고한 내용 -->
			<div id="content_3" style="height: 300px;"><%= r.getReportContent() %></div>

			<hr>
			<br> <br> <br>

			<div align="center">
				<button class="btn btn-secondary" onclick="history.back();">취소</button>
				<button class="btn btn-danger" id="deleteBtn">삭제</button>
			</div>

			<br> <br>
	

	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>

</body>
</html>