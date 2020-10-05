<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.adminPlan.model.vo.Plan, com.kh.common.PageInfo"%>
<%

	ArrayList<Plan> list = (ArrayList<Plan>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");;
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	int keyfield = (int)request.getAttribute("keyfield");
	String keyword = (String)request.getAttribute("keyword");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	margin: auto;
	width: 1000px;
}
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">일정관리</h1>
		-->
		<br>

		<div class="outer">

			<table align="center">
				<tr>
					<td width="1000">
						<form action="<%=contextPath%>/adminPage/list.pl" method="GET">
							<input type="hidden" name="currentPage" value="<%=currentPage%>">
							<select name="keyfield">
								<%if(keyfield==2){%>
								<option value="1">제목</option>
								<option value="2" selected>아이디</option>
								<%}else{%>
								<option value="1">제목</option>
								<option value="2">아이디</option>
								<%}%>
							</select>
							<input type="text" name="keyword" value="<%=keyword%>">
							<button type="submit" class="btn btn-secondary btn-sm">조회</button>
						</form>
					</td>
				</tr>
			</table>

			<br>

			<table align="center" id="listArea" class="table table-hover" style="table-layout:fixed;">
				<thead style="text-align: center;">
					<tr>
						<th width="30px"><input type="checkbox" id="chk_all"></th>
						<th width="50px">번호</th>
						<th width="355px">제목</th>
						<th width="125px">작성자아이디</th>
						<th width="125px">작성일</th>
						<th width="65px">조회수</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<% if(list.isEmpty()){ %>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
					<% }else{ %>
						<% for(Plan p : list){ %>
						<tr>
							<td><input type="checkbox" id="chk" name="pno" value="<%= p.getPlanNo() %>"></td>
							<td><%= p.getPlanNo() %></td>
							<td style="overflow:hidden; white-space: nowrap;text-overflow: ellipsis;"><%= p.getPlanTitle() %></td>
							<td><%= p.getPlanWriter() %></td>
							<td><%= p.getEnrollDate() %></td>
							<td><%= p.getCount() %></td>
						</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 게시글 수 &nbsp;&nbsp;&nbsp;<b
								style="color: red"><%=listCount %></b> 개
						</span></td>
						<td width="750px;">
							<div align="center">
								<% if(currentPage != 1){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.pl?currentPage=1&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.pl?currentPage=<%= currentPage-1 %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&lt;</button>
								<% } %>
	
								<% for(int p=startPage; p<=endPage; p++){ %>
									<% if(p != currentPage){ %>
									<button onclick="location.href='<%= contextPath %>/adminPage/list.pl?currentPage=<%= p %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% }else{ %>	
									<button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% } %>
								<% } %>

								<% if(currentPage != maxPage){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.pl?currentPage=<%= currentPage+1 %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&gt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.pl?currentPage=<%= maxPage %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
								<% } %>
							</div>
						</td>
						<td width="">
							<button class="btn btn-primary" id="btnDelete">삭제</button>
						</td>
					</tr>
				</table>
				
				<br>
			</div>

			<br>

		</div>
		
		<script>
			// 제목 선택시 상세조회 페이지로 이동
            $(function(){
            	$("#listArea>tbody>tr").each(function(){
                    $(this).find("td:eq(2)").css("cursor","pointer");
                  
                    $(this).find("td:eq(2)").click(function(){
                      location.href = "<%= contextPath %>/adminPage/detail.pl?pno=" + $(this).prev().text();
                    });
                  });
			});
			
         	// 체크박스 전체선택 및 해제
            $(function(){
                $("#chk_all").click(function(){
                    if($("#chk_all").prop("checked")){
                        $("input[id=chk]").prop("checked",true);

                    }else {
                        $("input[id=chk]").prop("checked",false);
                    }
                });
            });
         	
         	// 삭제시
            $(function(){
            	$("#btnDelete").click(function(){

              		var selected = new Array();
              		$("input[id=chk]:checked").each(function(){
                		selected.push(this.value);
              		});
              		
              		if(selected.length == 0){
                    	alert("체크된 항목이 없습니다.");
                        return;
                    }

	              	var str = "";
	              	for(var i=0;i<selected.length; i++){
	                	if(i == selected.length-1){
	                  		str += "pno=" + selected[i];
	                	}else{
	                  		str += "pno=" + selected[i] + "&";
	                	}
	              	}
	              
	              	if(confirm("정말 삭제하시겠습니까?")) {
	                	location.href="<%=contextPath%>/adminPage/delete.pl?" + str;
	              	} 
	            });
            });
		</script>


	</div>
	<!-- /.container-fluid -->


	<%@ include file="../../common/footer.jsp"%>

</body>
</html>