<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	margin-top: 200px;
}

#content {
	display: inline-block;
	width: 500px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	position: absolute;
}

table {
	border-spacing: 3px;
	background: #f6f6f6;
	border-radius: 5px;
}

#notice {
	font-size: 13px;
	display: inline-block;
	width: 1000px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#headTitle {
	font-size: 18px;
	font-weight: bold;
	display: inline-block;
	overflow: hidden;
	width: 50px;
}

#title {
	font-size: 15px;
	font-weight: bold;
	display: inline-block;
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#head, #array {
	width: 80px;
	height: 30px;
	font-size: 15px;
}

}
#footer {
	white-space: nowrap;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer">
		<!-- 말머리, 정렬 -->
		<div id="head"
			style="margin-left: 340px; margin-top: 50px; margin-bottom: 10px; width: 200px;">
			<select name="" id="head" style=>
				<option value="all">전체</option>
				<option value="restaurant">맛집</option>
				<option value="place">명소</option>
			</select> <select name="" id="array" style=>
				<option value="new">최신순</option>
				<option value="recommend">추천순</option>
				<option value="check">조회순</option>
				<option value="scrap">스크랩순</option>
			</select>

		</div>
		<table id="notice" style="margin-left: 340px;">
			<!-- 공지 -->
			<tbody>
				<tr>
					<td colspan="3"><hr style="border: 1px solid white;"></td>
				</tr>
				<tr>

					<th style="width: 100px;">&nbsp;&nbsp;공지</th>
					<!-- 관리자가 작성했을시 -->
					<td style="width: 900px;"><span name="title">글제목에 지역명을
							포함시켜주세요fdsafsdafsadfsadfsadfsafsadfsadfsdafsdaf.</span></td>
					<td>관리자&nbsp;&nbsp;&nbsp;</td>
				</tr>

				<tr>
					<td colspan="3"><hr style="border: 1px solid white;"></td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;공지</th>
					<td>글제목에 지역명을
						포함시켜주세요fdsafsdafsadfsadfsadfsafsadfsadfsdafsdaf.</td>
					<td>관리자&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2><hr style="border: 1px solid white;"></td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;공지</th>
					<td>글제목에 지역명을
						포함시켜주세요fdsafsdafsadfsadfsadfsafsadfsadfsdafsdaf.</td>
					<td>관리자&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2><hr style="border: 1px solid white;"></td>
				</tr>
			</tbody>

		</table>



		<div id="board">
			<ul>

				<hr style="width: 1000px; margin-left: 500px;">
				<br>

				<li
					style="padding-left: 350px; position: relative; list-style-type: none; height: 100px;">
					<span style="display: inline-block; width: 720px;">추천수 <a
						href=""> <img style="position: absolute; margin-left: 30px;"
							src="forest1.png" width="100px;" height="100%;" alt="">
					</a> <a href="" style="text-decoration: none; color: #00c0ff"> <span
							id="headTitle" style="margin-left: 140px;">[맛집]</span>
					</a> <a href="" style="text-decoration: none; color: black;"> <span
							id="title" name="title">여기 짱 맛있음&nbsp;[4]</span>
					</a>

				</span> <br>
				<span
					style="position: absolute; display: inline-block; margin-left: 800px;">
						<div style="width: 50px;">2020.08.30</div>
						<div style="width: 140px;">조회수: 40 /양현우</div> <!-- <div style="width:50px">양현우</div> -->
				</span> <span style="margin-left: 15px; color: blue;">5</span> <br> <span>스크랩</span>
					<span id="content" style="margin-left: 140px;">내용을여기다
						넣을거에요내용을여기다 넣을거에요내용을ddddddddddddddddddddddd</span> <br> <span
					style="margin-left: 15px; color: red;">5</span>
				</li>
				<br>
				<li
					style="padding-left: 350px; position: relative; list-style-type: none; height: 100px;">
					<span style="display: inline-block; width: 720px;">추천수 <a
						href=""> <img style="position: absolute; margin-left: 30px;"
							src="forest1.png" width="100px;" height="100%;" alt="">
					</a> <a href="" style="text-decoration: none; color: #00c0ff"> <span
							id="headTitle" style="margin-left: 140px;">[맛집]</span>
					</a> <a href="" style="text-decoration: none; color: black;"> <span
							id="title">여기 짱 맛있음&nbsp;[4]</span>

					</a>

				</span> <br>
				<span
					style="position: absolute; display: inline-block; margin-left: 800px;">
						<div style="width: 50px;">2020.08.30</div>
						<div style="width: 140px;">조회수: 40 /양현우</div> <!-- <div style="width:50px">양현우</div> -->
				</span> <span style="margin-left: 15px; color: blue;">5</span> <br> <span>스크랩</span>
					<span id="content" style="margin-left: 140px;">내용을여기다
						넣을거에요내용을여기다 넣을거에요내용을ddddddddddddddddddddddd</span> <br> <span
					style="margin-left: 15px; color: red;">5</span>
				</li>
				<br>

				<hr style="width: 1000px; margin-left: 300px;">
			</ul>
			<div id="footer">
				<div style="width: 200x; margin-left: 350px;">
					<form action="">
						<select name="" id=""
							style="width: 66px; height: 24px; font-size: 15px;">
							<option value="title">제목</option>
						</select> <input type="text" style="width: 150px; height: 23px;"> <label
							for="search" style="cursor: pointer;"><img src="다운로드.png"
							width="20px;" height="16px;"></label>
						<button type="submit" id="search" style="display: none;">검색</button>
						<button
							style="margin-left: 650px; width: 80px; height: 30px; border: none;">글작성</button>
					</form>

					<br>
					<br>
					<br>
				</div>
				<div style="width: 500px; margin-left: 650px; white-space: nowrap;">
					<button class="btn btn-secondary btn-sm">&lt;&lt;</button>
					<button class="btn btn-secondary btn-sm">&lt;</button>

					<button class="btn btn-outline-secondary btn-sm">1</button>
					<button class="btn btn-outline-secondary btn-sm">2</button>
					<button class="btn btn-outline-secondary btn-sm">3</button>
					<button class="btn btn-outline-secondary btn-sm">4</button>
					<button class="btn btn-outline-secondary btn-sm">5</button>
					<button class="btn btn-outline-secondary btn-sm">1</button>
					<button class="btn btn-outline-secondary btn-sm">2</button>
					<button class="btn btn-outline-secondary btn-sm">3</button>
					<button class="btn btn-outline-secondary btn-sm">4</button>
					<button class="btn btn-outline-secondary btn-sm">5</button>

					<button class="btn btn-secondary btn-sm">&gt;</button>
					<button class="btn btn-secondary btn-sm">&gt;&gt;</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>