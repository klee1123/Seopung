<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width: 500px;
		margin: auto;
	}
	
	#adminListForm th {
		color: red;
	}
	
	#adminListForm input {
		text-align: center;
		width: 100%;
		height: 73%;
	}
	
	#adminListForm td {
		height: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">관리자 상세조회</h1>

		<div class="outer" align="center">
			<form action="" method="post" id="adminListForm">

				<div>
					<table align="center">
						<tr>
							<th width="15px">*</th>
							<td width="120px">아이디</td>
							<td width="300px"><input type="text" name="adminId"
								value="adminId"></td>
						</tr>
						<tr>
							<th>*</th>
							<td>비밀번호</td>
							<td><input type="password" name="adminPwd"></td>
						</tr>
						<tr>
							<th>*</th>
							<td>비밀번호 확인</td>
							<td><input type="password" name="checkPwd"></td>
						</tr>
						<tr>
							<th>*</th>
							<td>성명</td>
							<td><input type="text" name="adminName" value="관리자"></td>
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

				<br><br><br><br>

				<div align="center">
					<button type="button" class="btn btn-secondary">취소</button>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger">탈퇴</button>
				</div>
			</form>

			<br>
		</div>


	</div>
	<!-- /.container-fluid -->


	<%@ include file="../../common/footer.jsp"%>

</body>
</html>