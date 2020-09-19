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
		<h1 class="h3 mb-4 text-gray-800">1:1문의</h1>

		<br>
		
		<div class="outer">

			<table align="center">
				<tr>
					<td width="1000">
						<form action="" method="GET">
							<label for=""></label> <input type="text"
								placeholder="검색어를 입력해주세요.">
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
						<th width="200px">제목</th>
						<th width="100px">작성자</th>
						<th width="100px">작성일</th>
						<th width="100px">처리상태</th>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<tr>
						<td><input type="checkbox"></td>
						<td>5</td>
						<td>동행 구하기는 어떻게 하나요?</td>
						<td>userId1</td>
						<td>2020.09.09</td>
						<td>미답변</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>4</td>
						<td>이벤트 문의 드립니다.</td>
						<td>userId2</td>
						<td>2020.09.09</td>
						<td>미답변</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>내 일정 보기가 안돼요</td>
						<td>userId3</td>
						<td>2020.09.09</td>
						<td>답변 완료 </td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>문의 드려요~</td>
						<td>userId4</td>
						<td>2020.09.09</td>
						<td>답변완료</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>커뮤니티 서비스는 어디서 이용하나요?</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>답변완료</td>
					</tr>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 회원수 &nbsp;&nbsp;&nbsp;<b
								style="color: red">5</b>명
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
							<button class="btn btn-primary">삭제하기</button>
							
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