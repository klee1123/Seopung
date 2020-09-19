<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:800px;
		margin: auto;
	}
	

</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">FAQ</h1>

		<div class="outer" align="left">
			<form action="" method="post" id="faqPost">

				<div>
					<table align="left">
						<tr>
							<th width="15px"></th>
							<td width="120px">제목</td>
							<td width="1000px"><input type="text" name="title">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>내용</td>
							<td>
                        	<textarea name="content" rows="5" cols="80" style="resize:none;"></textarea>
                    		</td>
						</tr>
						<tr>
							<th></th>
							<td>답변</td>
							<td>
                        	<textarea name="content" rows="5" cols="80" style="resize:none;"></textarea>
                    		</td>
						</tr>
					</table>
				</div>

				<br><br><br>

				<div align="center">
					<button type="button" class="btn btn-secondary">취소</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
			
		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>

</body>
</html>