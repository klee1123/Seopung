<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
.outer {
	width: 800px;
	margin: auto;
}
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">추천코스 글 수정</h1>

		<br>

		<div class="outer">
			<form action="enroll.bo" method="post">

				<input type="text" name="title" style="width: 100%;"
					placeholder="사용자가입력한제목입니다." class="form-control form-control" required>
				<br>
				<textarea id="summernote" name="content" required></textarea>

				<br>
				<button type="button" id="thumbBtn"
					class="btn btn-outline-secondary btn-sm">썸네일 사진첨부</button>
				<img width="140" height="140" id="thumbPreview"> <input
					type="file" id="thumbnail" name="thumbnail"
					onchange="loadImage(this)" required> <br>
				<br>
				<br>

				<div align="center">
					<button type="button" class="btn btn-secondary">취소</button>
					<button type="submit" class="btn btn-primary">저장</button>
				</div>
			</form>
			<script>
				$('#summernote').summernote({
					placeholder : '사용자가 작성한 내용입니다',
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
			<br>
			<br>
		</div>

	</div>
	<!-- /.container-fluid -->
	
	
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>