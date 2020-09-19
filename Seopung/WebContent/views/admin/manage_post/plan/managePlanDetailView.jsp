<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 900px;
	margin: auto;
}

#content_1 {
	width: 440px;
	height: 380px;
	border: 1px solid lightgrey;
	float: left;
	margin-right: 20px;
}

#content_2_2 {
	background-color: lightgrey;
	width: 420px;
	height: 130px;
	padding: 20px;
	box-sizing: border-box;
	margin-top: 10px;
	float: left;
}

#content_2_2>button {
	margin: 4px;
}

#content_2_3 {
	width: 420px;
	height: 155px;
	border: 1px solid lightgrey;
	margin-top: 10px;
	padding: 10px;
	float: left;
}

#content_3 table {
	width: 345px;
	box-shadow: 5px 5px 10px -4px gray;
	float: left;
	margin-right: 20px;
	margin-top: 10px;
}

#content_3_2 {
	width: 420px;
	height: 100px;
	margin-top: 10px;
	padding: 10px;
	color: grey;
	border: 1px solid lightgrey;
	background: white;
	float: left;
}

#content_5 tr {
	height: 70px;
}
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp" %>


	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">일정 상세조회</h1>

		<br>

		<div class="outer">

			<div id="content_1"></div>

			<div id="content_2">
				<div id="content_2_1">
					<table>
						<tr width="420px;">
							<td width="210px" style="font-size: 15px;"><b
								style="font-size: 20px;">일정제목</b> <br> 20.09.09 - 20.09.12
							</td>
							<td>추천 : 10 <br> 스크랩 : 5 <br> 예산금액 : 100,000 원
							</td>
						</tr>
					</table>
				</div>
				<div id="content_2_2">
					<button disabled class="btn btn-secondary">10대</button>
					<button disabled class="btn btn-secondary">남자끼리</button>
					<button disabled class="btn btn-secondary">도보</button>
					<button disabled class="btn btn-secondary">동행</button>
					<button disabled class="btn btn-secondary">전동킥보드</button>
					<button disabled class="btn btn-secondary">자전거</button>
				</div>
				<div id="content_2_3">
					<select name="" id="">
						<option value="">day1</option>
						<option value="">day2</option>
						<option value="">day3</option>
						<option value="">day4</option>
					</select> <br>
					<br>

					<ol>
						<li>서울역</li>
						<li>경복궁</li>
						<li>창덕궁</li>
					</ol>
				</div>
			</div>

			<br clear="all">

			<div id="content_3">
				<div id="content_3_1">
					<table>
						<tr style="height: 100px;">
							<td width="100" align="center"><img width="60"
								src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
								alt=""></td>
							<td><b>작성자 아이디</b> <br> 자기소개</td>
						</tr>
					</table>
					<div
						style="line-height: 100px; float: left; margin-right: 20px; margin-top: 10px;">
						<button style="height: 60px;" disabled
							class="btn btn-primary btn-sm">동행신청</button>
					</div>
				</div>
				<div id="content_3_2">사용자가 작성한 일정 내용</div>
			</div>

			<br clear="all">

			<hr>

			<div id="content_4" align="center">
				<form action="" method="post">
					<table>
						<tr>
							<input type="text" name="userId" value="userId123" hidden>
							<td width="70px"><img width="55px" class="rounded-circle"
								src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
								alt=""></td>
							<td width="720px;"><textarea name="comment" cols="85"
									rows="3" style="resize: none;"></textarea></td>
							<td>
								<button type="submit" class="btn btn-secondary">등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<hr>

			<div id="content_5" align="center">
				<table>
					<tr>
						<td width="60px"><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td width="700px" style="padding: 10px;">닉네임1 - 2020.09.09
							22:05<br>닉네임1의 댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>

				</table>
			</div>

			<div align="center">

				<button class="btn btn-outline-secondary btn-sm">&lt;</button>

				<button style="border: none; background: none">1</button>
				<button style="border: none; background: none">2</button>
				<button style="border: none; background: none">3</button>
				<button style="border: none; background: none">4</button>
				<button style="border: none; background: none">5</button>

				<button class="btn btn-outline-secondary btn-sm">&gt;</button>

			</div>

			<br>
			<br>
			<br>

			<div align="center">
				<button class="btn btn-secondary">취소</button>
				<button class="btn btn-danger">삭제</button>
			</div>

			<br>
			<br>

		</div>


	</div>
	<!-- /.container-fluid -->
	
	<%@ include file="../../common/footer.jsp" %>
	
</body>
</html>