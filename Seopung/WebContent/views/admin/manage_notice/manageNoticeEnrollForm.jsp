<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<%@ include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">추천코스 글 등록</h1>
		-->
		<br>

		<div class="outer"> <!-- 썸네일관련 삭제 method뒤에 -->
			<form action="<%=contextPath%>/adminPage/insert.no" method="post">
				
				<input type="hidden" name="adminNo" value="<%= loginUser.getUserNo() %>">
				
				<input type="text" name="title" style="width: 100%;"
					placeholder="제목입력" class="form-control" required> <br>
				<textarea id="summernote" name="content" required></textarea>

				<br>
				<br>

				<div align="center">
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
			<script>
				$('#summernote').summernote({
					tabsize : 2,
					height : 400
				});

			</script>
			<br>
			<br>
		</div>

	</div>
	<!-- /.container-fluid -->
	
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>