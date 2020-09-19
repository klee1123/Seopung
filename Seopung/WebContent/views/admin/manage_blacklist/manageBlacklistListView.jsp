<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin:auto;
        width:1000px;
    }

</style>
</head>
<body>


	<%@ include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">블랙리스트 목록</h1>

		<br>
		
		<div class="outer">

			<table align="center">
				<tr>
					<td width="1000">
						<form action="" method="GET">
							<label for="">회원ID</label> <input type="text"
								placeholder="아이디 입력">
							<button type="submit" class="btn btn-secondary btn-sm">조회</button>
						</form>
					</td>
				</tr>
			</table>

			<br>

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align:center;">
					<tr>
						<th width="50px"><input type="checkbox"></th>
						<th width="75px">번호</th>
						<th width="120px">아이디</th>
						<th width="120px">이름</th>
						<th width="250px">제제 사유</th>
						<th width="100px">상태</th>
						<th width="150px">제제 날짜</th>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<tr>
						<td><input type="checkbox"></td>
						<td>5</td>
						<td>userId5</td>
						<td>홍길동</td>
						<td>비매너</td>
						<td>회원</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>4</td>
						<td>userId5</td>
						<td>홍길동</td>
						<td>비매너</td>
						<td>회원</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>userId5</td>
						<td>홍길동</td>
						<td>비매너</td>
						<td>회원</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>userId5</td>
						<td>홍길동</td>
						<td>비매너</td>
						<td>회원</td>
						<td>2020.09.09</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>userId5</td>
						<td>홍길동</td>
						<td>비매너</td>
						<td>회원</td>
						<td>2020.09.09</td>
					</tr>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 회원수 &nbsp;&nbsp;&nbsp;<b
								style="color: red">5</b> 명
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
			</div>
			
			<br><br>

		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>
</body>
</html>