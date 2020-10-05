<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.adminInquiry.model.vo.AdminInquiry"%>
<%
	AdminInquiry i = (AdminInquiry)request.getAttribute("i");
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

			<!-- 들어가는 요소 : 1.타이틀 2.질문 등록일  / 
							3.답변자 4.문의 타입 5.회원이면 넘버/비회원이면 이메일 
							6.회원 문의 내용 7. 관리자 답변 내용 -->
			<div id="content_1">
				<div style="width: 740px; font-size: 18px;"><%=i.getInquireTitle()%></div>
				<div style="text-align: right;"><%=i.getInquireEnrollDate()%></div>
			</div>

			<div id="content_2">
				<% if(i.getInquireSep().equals("회원")){ %>
                <div style="width: 740px;"><%= i.getInquireWriter() %></div> <!-- 작성자 -->
                <% } else {%>
                <div style="width: 740px;"><%= i.getInquireEmail() %></div> <!-- 비회원일시 이메일 보이게 -->
                <% } %>
					
				<div><%=i.getInquireType()%> <!-- 문의 타입 -->
				</div>
			</div>

			<hr>
			
			<!-- 사용자가 문의한 내용 -->
			<div id="content_3" style="height: 300px;"><%= i.getInquireContent() %></div>

			<hr>
			
			<!-- 관리자가 답변한 내용 -->
			<div id="content_4" style="height: 300px;">
			<% if(i.getAdminWriter() == null) { %>
			<div>답변 필요</div>
			<%} else {%>
			<div><%=i.getAdminWriter()%></div> <!-- 답변한 관리자 -->
			<div>A. <%= i.getInquireResponse() %></div>
			<%} %>
			</div>

			<hr>
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
	       				location.href="<%=contextPath%>/adminPage/delete.iq?ino=<%=i.getInquireNo()%>";
	       			}
	       		});
	       		
	       	});	 
	       	
       	</script>
	

	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>

</body>
</html>