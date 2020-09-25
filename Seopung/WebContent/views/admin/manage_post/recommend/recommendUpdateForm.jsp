<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.recommend.model.vo.Recommend"%>
<%
	Recommend r = (Recommend)request.getAttribute("r");
	int currentPage = (int)request.getAttribute("currentPage");
	
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
			<form action="<%=contextPath %>/update.re?currentPage=<%=currentPage%>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="rno" value="<%= r.getRecommendNo()%>">
				<input type="text" name="title" style="width: 100%;"
					value="<%= r.getRecommendTitle() %>" class="form-control form-control" required>
				<br>
				<textarea id="summernote" name="content" required><%=r.getRecommendContent()%></textarea>

				<br>
				<button type="button" id="thumbBtn"
					class="btn btn-outline-secondary btn-sm">썸네일 사진첨부</button>
				<img width="140" height="140" id="thumbPreview" src="<%=contextPath %>/<%=r.getThumbnailPath() %>"> 
				<input type="file" id="thumbnail" name="thumbnail"
					onchange="loadImage(this)"> <br>
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

				$(function() {

					$("#thumbnail").hide();

					$("#thumbBtn").click(function() {
						$("#thumbnail").click();
					});

				});

				function loadImage(inputFile) {
					if (inputFile.files.length == 1) {
						var reader = new FileReader();

						reader.readAsDataURL(inputFile.files[0]);
						reader.onload = function(e) {
							$("#thumbPreview").attr("src", e.target.result);
						};
					} else {
						$("#thumbPreview").attr("src", "<%=contextPath %>/<%=r.getThumbnailPath() %>");
					}
				};
			</script>
			<br>
			<br>
		</div>

	</div>
	<!-- /.container-fluid -->
	
	
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>