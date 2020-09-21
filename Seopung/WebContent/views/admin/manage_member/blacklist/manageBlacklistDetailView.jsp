<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.outer {
	margin: auto;
	width: 1000px;
}
</style>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">블랙리스트 신고내역조회</h1>

		<br>

		<div class="outer">

			<h5>
				<b>userId1</b> 님에 대한 신고내역
			</h5>

			<br>

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align: center;">
					<tr>
						<th width="75px">번호</th>
						<th width="300px">신고글 제목</th>
						<th width="150px">신고사유</th>
						<th width="150px">신고접수일</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<tr>
						<td>10</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>9</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>8</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>7</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>6</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>5</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>4</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>3</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>2</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td>1</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>비매너</td>
						<td>2020.09.09</td>
					</tr>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 신고수 &nbsp;&nbsp;&nbsp;<b
								style="color: red">10</b> 개
						</span></td>
						<td width="720px;">
							<div align="center">
								<button class="btn btn-secondary btn-sm">&lt;&lt;</button>
								<button class="btn btn-secondary btn-sm">&lt;</button>

								<button class="btn btn-outline-secondary btn-sm">1</button>
								<button class="btn btn-outline-secondary btn-sm">2</button>
								<button class="btn btn-outline-secondary btn-sm">3</button>
								<button class="btn btn-outline-secondary btn-sm">4</button>
								<button class="btn btn-outline-secondary btn-sm">5</button>

								<button class="btn btn-secondary btn-sm">&gt;</button>
								<button class="btn btn-secondary btn-sm">&gt;&gt;</button>
							</div>
						</td>
						<td width="">
							<button class="btn btn-primary">목록에서 제거</button>
						</td>
					</tr>
				</table>

				<br>
			</div>

			<br>

		</div>


	</div>
	<!-- /.container-fluid -->


	<%@ include file="../../common/footer.jsp"%>


</body>
</html>