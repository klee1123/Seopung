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

		<!-- Page Heading
		<h1 class="h3 mb-4 text-gray-800">공지사항</h1>-->

		<div class="outer" align="left">
			<form action="" method="post" id="faqPost">

				<div>

					<H2>2박 3일 서울투어</H2>
					<h5>2020.09.09</h5>

					<hr>

					<h5>
                        언제나 서풍을 이용해주셔서 감사합니다.<br><br>

                        쉽고 간편한 프로젝트 밀어주기를 위해 선물 옵션 선택 및 후원금 추가 기능을 개선하여 안내드립니다.<br><br>
                        
                        기존에는 선물을 선택한 다음 별도 창에서 옵션을 선택할 수 있었는데요.<br>
                        이번 개선을 통해 프로젝트 페이지에서 바로 옵션을 선택할 수 있게 되었습니다.<br>
                        
                        마찬가지로 최소 후원금액보다 더 많은 금액을 입력하여 밀어주는 것 또한 프로젝트 상세 페이지에서 바로 설정하실 수 있어 더욱 편리해졌습니다.
					</h5>

					<hr>

				<br><br>

				<div align="center">
					<button type="delete" class="btn btn-secondary">삭제</button>
					<button type="submit" class="btn btn-primary">확인</button>
				</div>
			</form>
			
		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>

</body>
</html>