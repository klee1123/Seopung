<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/header.jsp"%>


	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">추천코스 관리</h1>

		<br>

		<div class="outer">

			<table align="center">
				<tr>
					<td width="1000">
						<form action="" method="GET">
							<label for="">제목</label> <input type="text" placeholder="제목 입력">
							<button type="submit" class="btn btn-secondary btn-sm">조회</button>
						</form>
					</td>
				</tr>
			</table>

			<br>

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align: center;">
					<tr>
						<th width="20px"><input type="checkbox"></th>
						<th width="50px">번호</th>
						<th width="355px">제목</th>
						<th width="125px">관리자아이디</th>
						<th width="125px">작성일</th>
						<th width="75px">조회수</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>9</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>8</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>7</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>6</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>5</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>4</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>제목입니다</td>
						<td>admin1</td>
						<td>2020.09.09</td>
						<td>10</td>
					</tr>

				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 게시글 수 &nbsp;&nbsp;&nbsp;<b
								style="color: red">5</b> 개
						</span></td>
						<td width="700px;">
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
							<button class="btn btn-primary">삭제</button>
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