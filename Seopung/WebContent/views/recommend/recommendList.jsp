<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.ArrayList, com.kh.recommend.model.vo.*, com.kh.common.PageInfo"
	import="java.text.SimpleDateFormat, java.util.Date"
	%>
<%
	
	ArrayList<Recommend> list = (ArrayList<Recommend>) request.getAttribute("list");
	
	String keyword = (String) request.getAttribute("keyword");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	String head = (String) request.getAttribute("head");
	String array = (String) request.getAttribute("array");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 1000px;
	margin: auto;
	mar
}

#content {
	display: inline-block;
	width: 500px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	position: absolute;
}

#content br {
	display: none;
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

p>img {
	display: none;
}

}
#footer {
	white-space: nowrap;
}
#notic a{
	color:black;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer">
		<!-- 말머리, 정렬 -->
		<div id=""
			style="margin-top: 150px; margin-bottom: 10px; width: 200px;">
			 <select name="array" id="array" >
				<option value="최신">최신순</option>
				<option value="추천">추천순</option>
				<option value="조회">조회순</option>
				
			</select>

		</div>
		



		<div id="board">
			<ul>

				<hr style="width: 1000px;">
				<br>
				<%
					if (list.isEmpty()) {
				%>
				<div style="font-size: 20px">조회된 리스트가 없습니다.</div>
				<%
					} else {
				%>
				<%
					for (Recommend r : list) {
				%>
						
				<li
					
					style="position: relative; list-style-type: none; height: 100px;">
					<span style="display: inline-block; width: 720px;">추천수<a
						href="<%=contextPath%>/detailList.re?cno=<%=r.getReNo()%>"> <img
							style="position: absolute; margin-left: 30px;"
							src="<%=r.getThumb()%>" width="100px;" height="100%;" alt="">
					</a> <span  style="text-decoration: none; color: #00c0ff"> <span
							id="headTitle" style="margin-left: 80px;"></span>
					</span> <a href="<%=contextPath%>/detailList.re?cno=<%=r.getReNo()%>"
						style="text-decoration: none; color: black;"> <span id="title"
							name="title">&nbsp;&nbsp;<%=r.getTitle()%>&nbsp;</span>
					</a>

				</span> <br> <span
					style="position: absolute; display: inline-block; margin-left: 800px;">
						<div style="width: 100px;"><%=r.getEnroll()%></div>
						<div style="width: 140px;">
							조회수:
							<%=r.getCount()%>
							/관리자</div> <!-- <div style="width:50px">양현우</div> -->
				</span> <span style="margin-left: 15px; color: blue;"><%=r.getLike()%></span>
					<br> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <span id="content"
					style="margin-left: 140px;"><%=r.getContent()%></span> <br> <span
					style="margin-left: 15px; color: red;"></span>
				</li>
				<br>
				<%
					}
				%>
				<%
					}
				%>

				<hr style="width: 1000px;">
			</ul>
			<div id="footer">
				<div style="width: 200x;">
					<form action="<%=contextPath%>/list.re" method="get">
						<select name="" id=""
							style="width: 66px; height: 24px; font-size: 15px;">
							<option value="title">제목</option>
							<input type="hidden" name="currentPage" value="<%=currentPage%>">
							<input type='hidden' name="array" value="<%=array%>">
						</select> <input type="text" style="width: 150px; height: 23px;"
							value="<%=keyword%>" name="keyword"> <label for="search"
							style="cursor: pointer;"><img src="다운로드.png"
							width="20px;" height="16px;">검색</label>
						<button type="submit" id="search" style="display: none;">검색</button>
						<%
							if (loginUser != null && loginUser.getCategory() == 2) {
						%>
						<button onclick="location.href='<%=contextPath%>/enrollForm.re'"
							type="button"
							style="margin-left: 640px; width: 80px; height: 30px; border: none;">글작성</button>
						<%
							}
						%>
					</form>

					<br> <br> <br>
				</div>

				<div style="width: 1000px; white-space: nowrap;" align="center">
					<%
						if (currentPage != 1) {
					%>
					<button
						onclick="location.href='<%=contextPath%>/list.re?currentPage=1&&array=<%=array %>&keyword=<%=keyword %>'"
						class="btn btn-secondary btn-sm">&lt;&lt;</button>
					<button
						onclick="location.href='<%=contextPath%>/list.re?currentPage=<%=currentPage - 1%>&array=<%=array %>&keyword=<%=keyword %>'"
						class="btn btn-secondary btn-sm">&lt;</button>
					<%
						}
					%>
					<%
						for (int p = startPage; p <= endPage; p++) {
					%>
					<%
						if (p != currentPage) {
					%>
					<button
						onclick="location.href='<%=contextPath%>/list.re?currentPage=<%=p%>&array=<%=array %>&keyword=<%=keyword %>'"
						class="btn btn-outline-secondary btn-sm"><%=p%></button>
					<%
						} else {
					%>
					<button disabled><%=p%></button>
					<%
						}
					%>
					<%
						}
					%>
					<%
						if (currentPage != maxPage) {
					%>
					<button
						onclick="location.href='<%=contextPath%>/list.re?currentPage=<%=currentPage + 1%>&array=<%=array %>&keyword=<%=keyword %>'"
						class="btn btn-secondary btn-sm">&gt;</button>
					<button
						onclick="location.href='<%=contextPath%>/list.re?currentPage=<%=maxPage%>&array=<%=array %>&keyword=<%=keyword %>'"
						class="btn btn-secondary btn-sm">&gt;&gt;</button>
					<%
						}
					%>


				</div>
				<br>
				<br>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		 
		
		 $("select").change(function(){
		 
		 var arr = $("select[name=array]").val()
	
		location.href="<%=contextPath%>/list.re?currentPage=1" + "&array=" + arr;
		
							});
			$("#array option[value=<%=array%>").attr("selected", true);
		
			
		
	});
	</script>
</body>
</html>