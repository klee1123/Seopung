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
	
	#memberListForm th {
		color: red;
	}
	
	#memberListForm input {
		text-align: center;
		width: 100%;
		height: 73%;
	}
	
	#memberListForm textarea {
		width: 100%;
	}
	
	#memberListForm>div {
		display: inline-block;
		margin: 30px;
	}
	
	#memberListForm td {
		height: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">회원상세조회</h1>

		<div class="outer" align="center">
			<form action="" method="post" id="memberListForm">
				<div>
					<table>
						<tr>
							<td colspan="2" align="center"><img
								src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
								alt="프로필사진" height="150px;"></td>
						</tr>
						<tr>
							<th width="15px">*</th>
							<td width="300px">닉네임</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="userNickname"
								value="nickname"></td>
						</tr>
						<tr>
							<td colspan="2">자기소개</td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="userSelfIntro" rows="5"
									style="resize: none;">안녕하세요</textarea></td>
						</tr>
					</table>


				</div>

				<div>
					<table align="center">
						<tr>
							<th width="15px">*</th>
							<td width="90px">아이디</td>
							<td width="300px"><input type="text" name="userId"
								value="userId"></td>
						</tr>
						<tr>
							<th>*</th>
							<td>성명</td>
							<td><input type="text" name="userName" value="아무개"></td>
						</tr>
						<tr>
							<th>*</th>
							<td>생년월일</td>
							<td><input type="date" name="birthday" value="1999.09.09"></td>
						</tr>
						<tr>
							<th>*</th>
							<td>전화번호</td>
							<td><input type="text" name="phone" value="010-1111-2222"></td>
						</tr>
						<tr>
							<th>*</th>
							<td>이메일</td>
							<td><input type="text" name="email" value="amugae@gmail.com"></td>
						</tr>
						<tr>
							<th></th>
							<td>가입일</td>
							<td><input type="text" value="2020.09.09" disabled></td>
						</tr>
						<tr>
							<th></th>
							<td>탈퇴일</td>
							<td><input type="text" value="-" disabled></td>
						</tr>
						<tr>
							<th></th>
							<td>최종수정일</td>
							<td><input type="text" value="2020.09.09" disabled></td>
						</tr>
						<tr>
							<th></th>
							<td>상태</td>
							<td><input type="text" value="회원" disabled></td>
						</tr>
					</table>
				</div>

				<br>

				<div align="center">
					<button type="button" class="btn btn-secondary">취소</button>
					<button type="submit" class="btn btn-secondary">수정</button>
					<button type="button" class="btn btn-secondary">탈퇴</button>
				</div>
			</form>
		</div>


	</div>
	<!-- /.container-fluid -->
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>