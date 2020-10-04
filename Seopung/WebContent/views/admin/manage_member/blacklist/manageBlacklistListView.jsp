<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.PageInfo, com.kh.adminMember.model.vo.Member" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    .outer{
        margin:auto;
        width:1000px;
    }

</style>
</head>
<body>


	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">블랙리스트 목록</h1>
		-->
		<br>
		
		<div class="outer">

			<table align="center" width="950">
				<tr>
					<td>
						<form action="" method="GET">
							<input type="hidden" name="currentPage" value="1">
							<select name="keyfield">
								<%if(keyfield==2){%>
								<option value="1">이름</option>
								<option value="2" selected>아이디</option>
								<%}else{%>
								<option value="1">이름</option>
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

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align:center;">
					<tr>
						<th width="20px"><input type="checkbox" id="chk_all"></th>
						<th width="75px">번호</th>
						<th width="120px">아이디</th>
						<th width="120px">이름</th>
						<th width="250px">제재 사유</th>
						<th width="150px">제재 날짜</th>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<% if(list.isEmpty()){ %>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
					<% }else{ %>
						<% for(Member m : list){ %>
						<tr>
							<td><input type="checkbox" id="chk" name="uno" value="<%= m.getUserNo()%>"></td>
							<td><%= m.getUserNo() %></td>
							<td><%= m.getUserId() %></td>
							<td><%= m.getUserName() %></td>
							<td><%= m.getReportType() %></td>
							<td><%= m.getModifyDate() %></td>
						</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 회원수 &nbsp;&nbsp;&nbsp;<b
								style="color: red"><%= listCount %></b> 명
						</span></td>
						<td width="720px;">
							<div align="center">
								<% if(currentPage != 1){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=1&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= currentPage-1 %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&lt;</button>
								<% } %>
	
								<% for(int p=startPage; p<=endPage; p++){ %>
									<% if(p != currentPage){ %>
									<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= p %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% }else{ %>	
									<button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
									<% } %>
								<% } %>

								<% if(currentPage != maxPage){ %>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= currentPage+1 %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&gt;</button>
								<button onclick="location.href='<%= contextPath %>/adminPage/list.me?currentPage=<%= maxPage %>&keyfield=<%=keyfield%>&keyword=<%=keyword%>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
								<% } %>
							</div>
						</td>
						<td width="">
							<button class="btn btn-primary" id="btnDelete">블랙리스트 해제</button>
						</td>
					</tr>
				</table>
			</div>
			
			<br><br>

		</div>
		<script>
			// 제목 선택시 상세조회 페이지로 이동
            $(function(){
            	$("#listArea>tbody>tr").each(function(){
                    $(this).find("td:eq(4)").css("cursor","pointer");
                  
                    $(this).find("td:eq(4)").click(function(){
                      location.href = "<%= contextPath %>/adminPage/detail.bl?currentPage=1&uno=" + $(this).prevAll().eq(2).text();
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
	                  		str += "uno=" + selected[i];
	                	}else{
	                  		str += "uno=" + selected[i] + "&";
	                	}
	              	}
	              
	              	if(confirm("정말 해제하시겠습니까?")) {
	                	location.href="<%=contextPath%>/adminPage/remove.bl?" + str;
	              	} 
	            });
            });
		</script>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../../common/footer.jsp"%>
</body>
</html>