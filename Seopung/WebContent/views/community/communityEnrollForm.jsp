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

	<%@ include file="../common/menubar.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">추천코스 글 등록</h1>
		-->
		<br>

		<div class="outer">
			<form action="<%=contextPath%>/insert.co" method="post" enctype="multipart/form-data">
				
				<!-- 수정 필요! 임시 -->
				<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
				 <select style="margin-top:100px;" name="head" id="head">
			        <option value="맛집">맛집</option>
			        <option value="명소">명소</option>
			
			    </select>
				<input type="text" name="title" style="width: 100%;"
					placeholder="제목입력" class="form-control" required> <br>
					
				<textarea  id="summernote" name="content" required></textarea>

				<br>
				<button type="button" id="thumbBtn"
					class="btn btn-outline-secondary btn-sm">썸네일 사진첨부</button>
				<img width="140" height="140" id="thumbPreview"> 
				<input type="file" id="thumbnail" name="thumbnail"
					onchange="loadImage(this)" required> <br>
				<br>
				<br>

				<div align="center">
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
			<br>
			<br>
			<script>
			$()
				$('#summernote').summernote({
					tabsize : 2,
					height : 400
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
						$("#thumbPreview").attr("src", null);
					}
				};
				
			
			</script>

	<!-- /.container-fluid -->
	
	
	
</body>
</html>