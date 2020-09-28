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
		<h1 class="h3 mb-4 text-gray-800">신고내역</h1>-->

		<div class="outer" align="left">
			<form action="" method="post" id="faqPost">

				<div>

					<H2>부적절한 단어 사용 신고합니다.</H2>
                    <h5>2020.09.09 개인정보노출</h5>
                    <h5>user1</h5>

					<hr>

					<h5>
                        웅대한 관현악이며 미묘한 교향악이다 뼈 끝에 스며들어 가는 열락의 소리다<br><br>
                        
                        이것은 피어나기 전인 유소년에게서 구하지 못할 바이며<br><br>

                        착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다<br>
                        그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운<br>
                        열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 !<br>
                        그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이<br><br>
                        따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라<br>
                        인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고
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