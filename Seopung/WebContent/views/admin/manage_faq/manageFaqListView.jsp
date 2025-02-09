<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.PageInfo, com.kh.admin.model.vo.Admin" %>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.outer {
	margin: auto;
	width: 1000px;
}
</style>
</head>
<body>


	<%@ include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading
		<h1 class="h3 mb-4 text-gray-800">FAQ</h1>
		-->

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
						<th width="100px">조회수</th>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<tr>
						<td><input type="checkbox"></td>
						<td>5</td>
						<td>2박 3일 서울투어의 주된 명소는 어디인가요?</td>
						<td>userId1</td>
						<td>2020.09.09</td>
						<td>5</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>4</td>
						<td>박물관 투어는 어디서 찾을수 있나요?</td>
						<td>userId2</td>
						<td>2020.09.09</td>
						<td>23</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>맛집 탐방 게시물은 어떻게 게시하나요?</td>
						<td>userId3</td>
						<td>2020.09.09</td>
						<td>45</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>4일 코스는 뭔가요?</td>
						<td>userId4</td>
						<td>2020.09.09</td>
						<td>60</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>친구랑 함께 하는 여행이 궁금합니다.</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>84</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>친구랑 함께 하는 여행이 궁금합니다.</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>84</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>친구랑 함께 하는 여행이 궁금합니다.</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>84</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>친구랑 함께 하는 여행이 궁금합니다.</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>84</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>친구랑 함께 하는 여행이 궁금합니다.</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>84</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>친구랑 함께 하는 여행이 궁금합니다.</td>
						<td>userId5</td>
						<td>2020.09.09</td>
						<td>84</td>
					</tr>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 게시글 수 &nbsp;&nbsp;&nbsp;<b
								style="color: red">5</b>개
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
							<button class="btn btn-primary">등록하기</button>
							
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