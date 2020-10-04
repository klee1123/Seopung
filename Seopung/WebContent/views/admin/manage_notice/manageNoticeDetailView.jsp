<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.adminNotice.model.vo.AdminNotice"%>
<%
	AdminNotice n = (AdminNotice)request.getAttribute("n");
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
	height: 20px;
	padding-left: 10px
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

			<div id="content_1">
				<div style="width: 740px; font-size: 18px;"><%=n.getNoticeTitle()%></div>
				<div style="text-align: right;"><%=n.getNoticeEnroll()%></div>
			</div>

			<div id="content_2">
				<div style="width: 740px;"><%=n.getNoticeWriter()%></div>
				<div>조회수 <%=n.getNoticeViews()%></div>
			</div>

			<hr>

			<div id="content_3"><%= n.getNoticeContent() %></div>

			<hr>
			
			</div>

			<br> <br> <br>

			<div align="center">
				<button class="btn btn-secondary" onclick="history.back();">취소</button>
				<button class="btn btn-danger" id="deleteBtn">삭제</button>
			</div>

			<br> <br>

		<script>
            
	       	$(function(){
	       		selectReplyList(1); // 페이지 로딩된 직후에 이 게시글에 딸려있는 댓글 리스트 조회
	       		
	       		//setInterval(selectReplyList,1000);
	       		
	       		$("#deleteBtn").click(function(){
	       			if(confirm("정말 삭제하시겠습니까?")) {
	       				location.href="<%=contextPath%>/adminPage/delete.no?nno=<%=n.getNoticeNo()%>";
	       			}
	       		});
	       		
	       		
	       	});	 
	       	
       	</script>
	

	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>

</body>
</html>