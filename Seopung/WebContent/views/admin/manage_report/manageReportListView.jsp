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
		<h1 class="h3 mb-4 text-gray-800">신고내역</h1>

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
						<th width="100px">신고자</th>
						<th width="100px">작성일</th>
						<th width="100px">구분</th>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<tr>
						<td><input type="checkbox"></td>
						<td>5</td>
						<td>부적절한 단어 사용 신고합니다.</td>
						<td>userId1</td>
						<td>2020.09.09</td>
						<td>영리목적/홍보성</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>4</td>
						<td>비매너 사용자예요.</td>
						<td>userId2</td>
						<td>2020.09.09</td>
						<td>개인정보노출</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>구체적인 개인정보를 요구해요.</td>
						<td>userId3</td>
						<td>2020.09.09</td>
						<td>불법정보 </td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>통장 비밀번호를 물어봤어요.</td>
						<td>userId4</td>
						<td>2020.09.09</td>
						<td>개인정보노출</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>비매너 사용자예요.</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>도배성</td>
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
						
						<div align="right">
							<button type="button" class="btn btn-secondary">삭제</button>
							<button type="submit" class="btn btn-primary">블랙리스트 등록</button>
						</div>	
					
				</table>
			</div>
		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>
</body>
</html>