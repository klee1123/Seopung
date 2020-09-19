<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .outer{
      width:900px;
      margin:auto;
  }

  .outer>div{
      box-sizing: border-box;
      /* border:1px solid black; */
      width: 100%;
  }
  #content_1{height:50px; background:lightgrey;}
  #content_2{height:25px;}
  #content_3{height:600px;} /*임시*/
  #content_4{height:20px; padding-left:10px}
  #content_5{height:75px;}
  #content_7{height:40px;background:lightgrey;}

  #content_1>div{
      display: table-cell;
      height:100%;
      padding: 10px;
      line-height:40px;
  }
  #content_2>div{
      display: table-cell;
      height:100%;
      padding-left: 10px;
      padding-right: 10px;
      line-height: 40px; 
  }
  #content_3{
      padding: 10px;
  }
  #content_6 tr{
    height: 70px;
  }
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp" %>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">커뮤니티 상세조회</h1>

		<br>

		<div class="outer">

			<div id="content_1">
				<div style="width: 740px; font-size: 18px;">제목입니다</div>
				<div style="text-align: right;">2020.09.09 20:00</div>
			</div>

			<div id="content_2">
				<div style="width: 630px;">닉네임</div>
				<div>조회수 5</div>
				<div>추천수 3</div>
				<div>스크랩수 1</div>
			</div>

			<hr>

			<div id="content_3">내용입니다.</div>

			<div id="content_4">댓글 2</div>

			<hr>

			<div id="content_5" align="center">
				<form action="" method="post">
					<table>
						<tr>
							<input type="text" name="userId" value="userId123" hidden>
							<td width="70px"><img width="60px"
								src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
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

			<div id="content_6" align="center">
				<table>
					<tr>
						<td width="60px"><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td width="700px" style="padding: 10px;">닉네임1 - 2020.09.09
							22:05<br>닉네임1의 댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
							alt=""></td>
						<td style="padding: 10px;">닉네임2 - 2020.09.09 22:10<br>닉네임2의
							댓글내용
						</td>
						<td>
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
					<tr>
						<td><img width="55px"
							src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg"
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