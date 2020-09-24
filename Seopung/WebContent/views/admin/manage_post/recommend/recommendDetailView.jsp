<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.recommend.model.vo.Recommend"%>
<%
	Recommend r = (Recommend)request.getAttribute("r");
%>
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
	#content_3{height:500px;} /*임시*/
	
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
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">추천코스 상세조회</h1>
		-->
		
		<br>

		<div class="outer">

			<div id="content_1">
				<div style="width: 740px; font-size: 18px;"><%= r.getRecommendTitle() %></div>
				<div style="text-align: right;"><%=r.getEnrollDate() %></div>
			</div>

			<div id="content_2">
				<div style="width: 725px;"><%= r.getRecommendWriter() %></div>
				<div>조회수 <%=r.getCount() %></div>
				<div>추천수 <%=r.getLike() %></div>
			</div>

			<hr>

			<div id="content_3"><%= r.getRecommendContent() %></div>
			
            <hr>

			<div style="padding-left: 10px;">
              <p>썸네일 사진</p><img src="<%=contextPath %>/<%=r.getThumbnailPath() %>" width="200px;" height="150px;"> 
            </div>

			<hr>
			<br>

			<div align="center">
				<button class="btn btn-secondary" onclick="history.back();">취소</button>
				<button class="btn btn-primary">수정</button>
				<button class="btn btn-danger">삭제</button>
			</div>

			<br>
			<br>
		</div>



	</div>
	<!-- /.container-fluid -->

	<%@ include file="../../common/footer.jsp"%>

</body>
</html>