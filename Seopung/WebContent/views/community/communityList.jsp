<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.ArrayList, com.kh.community.model.vo.*, com.kh.common.PageInfo"
	import="java.text.SimpleDateFormat, java.util.Date"
	%>
<%
	
	ArrayList<Community> list = (ArrayList<Community>) request.getAttribute("list");
	ArrayList<Community> nList = (ArrayList<Community>) request.getAttribute("nList");
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

#content img{
	display: none;
}

}
#footer {
	white-space: nowrap;
}
#notic a{
	color:black;
}

#content *{
	font-size:15px;
	color:black;
	background-color:white;
	font-weight:lighter;
	display:inline;
	font-family:나눔고딕;
}
#content font{
background-color:white;}
#content br{
	display: none;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer">
		<!-- 말머리, 정렬 -->
		<div id=""
			style="margin-top: 150px; margin-bottom: 10px; width: 200px;">
			<select name="head" id="head">
				<option value="전체">전체</option>
				<option value="맛집">맛집</option>
				<option value="명소">명소</option>
			</select> <select name="array" id="array" >
				<option value="최신">최신순</option>
				<option value="추천">추천순</option>
				<option value="조회">조회순</option>
				<option value="스크랩">스크랩순</option>
			</select>

		</div>
		<table id="notice">
			<!-- 공지 -->
			<tbody>
				<tr>
					<td colspan="3"><hr style="border: 1px solid white;"></td>
				</tr>
				<tr>
					 
					<%for(Community nc : nList){ %>
					<th style="width: 100px;">&nbsp;&nbsp;<%=nc.getHead() %></th>
					<!-- 관리자가 작성했을시 -->
					<td style="width: 900px;">
					 <a style="color:black; font-size:15px; font-weight:bold;" href="<%=contextPath%>/detailNotice.co?cno=<%=nc.getComNo()%>" "name="title1"><%=nc.getTitle() %></a></td>
					<td>관리자&nbsp;&nbsp;&nbsp;</td>
				</tr>

				<tr>
					<td colspan="3"><hr style="border: 1px solid white;"></td>
				</tr>
				<%} %>
			</tbody>

					
		</table>



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
					for (Community c : list) {
				%>
						
				<li
					
					style="position: relative; list-style-type: none; height: 100px;">
					<span style="display: inline-block; width: 720px;">추천수<a
						href="<%=contextPath%>/detailList.co?cno=<%=c.getComNo()%>"> <img
							style="position: absolute; margin-left: 30px;"
							src="<%=c.getThumb()%>" width="100px;" height="100%;" alt="">
					</a> <span  style="text-decoration: none; color: #00c0ff"> <span
							id="headTitle" style="margin-left: 140px;"><%=c.getHead()%></span>
					</span> <a href="<%=contextPath%>/detailList.co?cno=<%=c.getComNo()%>"
						style="text-decoration: none; color: black;"> <span id="title"
							name="title"><%=c.getTitle()%>&nbsp;[<%=c.getReCount()%>]</span>
					</a>

				</span> <br> <span
					style="position: absolute; display: inline-block; margin-left: 800px;">
						<div style="width: 100px;"><%=c.getEnroll()%></div>
						<div style="width: 140px;">
							조회수:
							<%=c.getCount()%>
							/<%=c.getUserNo()%></div> <!-- <div style="width:50px">양현우</div> -->
				</span> <span style="margin-left: 15px; color: blue;"><%=c.getRecommend()%></span>
					<br> <span>스크랩</span> <span id="content"
					style="margin-left: 140px;"><%=c.getContent()%></span> <br> <span
					style="margin-left: 15px; color: red;"><%=c.getScrap()%></span>
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
					<form action="<%=contextPath%>/list.co" method="get">
						<select name="" id=""
							style="width: 66px; height: 24px; font-size: 15px;">
							<option value="title">제목</option>
							<input type="hidden" name="currentPage" value="<%=currentPage%>">
							<input type="hidden" name="head" value="<%=head%>">
							<input type='hidden' name="array" value="<%=array%>">
						</select> <input type="text" style="width: 150px; height: 23px;"
							value="<%=keyword%>" name="keyword"> <label for="search"
							style="cursor: pointer;"><img src="다운로드.png"
							width="20px;" height="16px;">검색</label>
						<button type="submit" id="search" style="display: none;">검색</button>
						<%
							if (loginUser != null) {
						%>
						<button onclick="location.href='<%=contextPath%>/enrollForm.co'"
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
						onclick="location.href='<%=contextPath%>/list.co?currentPage=1&head=<%=head %>&array=<%=array %>&keyword=<%=keyword %>'"
						class="btn btn-secondary btn-sm">&lt;&lt;</button>
					<button
						onclick="location.href='<%=contextPath%>/list.co?currentPage=<%=currentPage - 1%>&head=<%=head %>&array=<%=array %>&keyword=<%=keyword %>'"
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
						onclick="location.href='<%=contextPath%>/list.co?currentPage=<%=p%>&head=<%=head %>&array=<%=array %>&keyword=<%=keyword %>'"
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
						onclick="location.href='<%=contextPath%>/list.co?currentPage=<%=currentPage + 1%>&head=<%=head %>&array=<%=array %>&keyword=<%=keyword %>'"
						class="btn btn-secondary btn-sm">&gt;</button>
					<button
						onclick="location.href='<%=contextPath%>/list.co?currentPage=<%=maxPage%>&head=<%=head %>&array=<%=array %>&keyword=<%=keyword %>'"
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
		 var hed = $("select[name=head]").val()
		 var arr = $("select[name=array]").val()
	
		location.href="<%=contextPath%>/list.co?currentPage=1&head="+ hed + "&array=" + arr;
		
							});
			$("#head option[value=<%=head%>], #array option[value=<%=array%>").attr("selected", true);
		
			
		
	});
	</script>
</body>
</html>