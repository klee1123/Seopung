<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.adminCommunity.model.vo.Community"%>
<%
	Community c = (Community)request.getAttribute("c");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
.outer {
	width: 900px;
	margin: auto;
}
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">추천코스 글 수정</h1>
		-->
		<br>

		<div class="outer">
			<form action="<%=contextPath %>/adminPage/update.co" method="post">
				<input type="hidden" name="cno" value="<%= c.getCommunityNo()%>">
				<input type="text" name="title" style="width: 100%;" value="<%= c.getTitle() %>" class="form-control form-control" required>
				<br>
				<textarea id="summernote" name="content" required><%=c.getContent()%></textarea>

				<br>
				
				<br>

				<div align="center">
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</form>
			<script>
				$('#summernote').summernote({
					tabsize : 2,
					height : 450
				});
			</script>
			<br>
			<br>
		</div>

	</div>
	<!-- /.container-fluid -->
	
	
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>