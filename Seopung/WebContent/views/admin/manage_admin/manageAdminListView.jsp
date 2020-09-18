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

	<%@ include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">관리자 목록</h1>

		<br>

		<div class="outer">

			<table align="center" width="1000">
				<tr>
					<td width="830">
						<form action="" method="GET">
							<label for="">관리자ID</label> <input type="text"
								placeholder="아이디 입력" name="adminId">
							<button type="submit" class="btn btn-secondary btn-sm">조회</button>
						</form>
					</td>
					<td>
						<button id="selectNonmember" class="btn btn-secondary btn-sm">탈퇴한
							관리자만 조회</button>
					</td>
				</tr>
			</table>

			<br>

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align: center;">
					<tr>
						<th width="75px">번호</th>
						<th width="120px">아이디</th>
						<th width="120px">이름</th>
						<th width="150px">가입일</th>
						<th width="150px">탈퇴일</th>
						<th width="75px">관리</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<tr>
						<td>10</td>
						<td>adminId10</td>
						<td>아무개10</td>
						<td>2020.09.09</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>9</td>
						<td>adminId9</td>
						<td>아무개9</td>
						<td>2020.09.09</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>8</td>
						<td>adminId8</td>
						<td>아무개8</td>
						<td>2020.09.09</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>7</td>
						<td>adminId7</td>
						<td>아무개7</td>
						<td>2020.09.08</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>6</td>
						<td>adminId6</td>
						<td>아무개6</td>
						<td>2020.09.07</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>5</td>
						<td>adminId5</td>
						<td>아무개5</td>
						<td>2020.09.06</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>4</td>
						<td>adminId4</td>
						<td>아무개4</td>
						<td>2020.09.05</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>3</td>
						<td>adminId3</td>
						<td>아무개3</td>
						<td>2020.09.04</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td>adminId2</td>
						<td>아무개2</td>
						<td>2020.09.03</td>
						<td></td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
					<tr>
						<td>1</td>
						<td>adminId1</td>
						<td>아무개1</td>
						<td>2020.09.02</td>
						<td>2020.09.10</td>
						<td><button class="btn btn-outline-dark btn-sm">보기</button></td>
					</tr>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 회원수 &nbsp;&nbsp;&nbsp;<b
								style="color: red">10</b> 명
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
							<button class="btn btn-primary">등록</button>
						</td>
					</tr>
				</table>
			</div>

			<br>
			<br>

		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>

</body>
</html>