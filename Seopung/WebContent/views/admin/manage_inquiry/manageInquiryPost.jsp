<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width: 1000px;
		margin: auto;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">1:1문의</h1>

		<div class="outer" align="left">
			<form action="" method="post" id="faqPost">

				<div>

					<H1>Q. 동행 구하기는 어떻게 하나요?</H1>
					<h5>2020.09.09 사용자 이용 방법</h5>

					<hr>

					<h4>동행 구하기에 대해 여쭤봅니다.<br>
						커뮤니티에서의 메세지 보내기는 어떻게 하면 되나요?<br>
						답장 부탁드릴게요.
					<br>

					<h3>A.<br>
						인생을 풍부하게 하는 것이다 보라 청춘을 !
						그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의
						수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 
						예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 
						천하를 철환하였는가?
					</h3>

					<hr>

				<br><br>

				<div align="center">
					<button type="delete" class="btn btn-secondary">확인</button>
					<button type="submit" class="btn btn-primary">삭제</button>
				</div>
			</form>
			
		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>

</body>
</html>