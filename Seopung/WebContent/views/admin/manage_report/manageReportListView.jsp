<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import = "java.util.ArrayList, com.kh.adminReport.model.vo.AdminReport, com.kh.common.PageInfo" %>
<%
    ArrayList<AdminReport> list = (ArrayList<AdminReport>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin:auto;
        width:1000px;
    }

</style>
</head>
<body>


	<%@ include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading
		<h1 class="h3 mb-4 text-gray-800">신고내역</h1>-->

		<br>
		
		<div class="outer">

			<table align="center">
				<tr>
					<td width="1000">
						<form action="" method="GET">
							<label for=""></label> <input type="text"
								placeholder="검색어를 입력해주세요.">
							<button type="submit" class="btn btn-secondary btn-sm">조회</button>
						</form>
					</td>
				</tr>
			</table>

			<br>

			<table align="center" id="listArea" class="table table-hover">
				<thead style="text-align:center;">
					<tr>
						<th width="50px"><input type="checkbox"></th>
						<th width="75px">번호</th>
						<th width="200px">신고된 아이디</th>
						<th width="100px">신고자 아이디</th>
						<th width="100px">작성일</th>
						<th width="100px">구분</th>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<% if(list.isEmpty()){ %>
	                    <tr>
	                        <td colspan="5">조회된 리스트가 없습니다.</td>
	                    </tr>
	                    <% }else{ %>
	                        <% for(AdminReport rp : list){ %>
	                        <tr>
	                            <td><input type="checkbox" id="chk" name="rno" value="<%=rp.getReportNo()%>"></td>
	                            <td><%= rp.getReportNo() %></td>
	                            <td><%= rp.getUserNo() %></td>
	                            <td><%= rp.getUserNo2() %></td>
	                            <td><%= rp.getReportDate() %></td>
	                            <td><%= rp.getReportType() %></td>
	                        </tr>
	                        <% } %>
	                    <% } %>
					
				</tbody>
			</table>

			<br>

			<div align="center">
				<table>
					<tr>
						<td width=""><span>총 신고글 수 &nbsp;&nbsp;&nbsp;<b
								style="color: black"><%=listCount%></b>개
						</span></td>
						<td width="650px;">
							<div align="center">
								<% if(currentPage != 1){ %>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.rp?currentPage=1';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.rp?currentPage=<%= currentPage-1 %>';" class="btn btn-secondary btn-sm">&lt;</button>
	                                <% } %>
	
	                                <% for(int p=startPage; p<=endPage; p++){ %>
	                                    <% if(p != currentPage){ %>
	                                    <button onclick="location.href='<%= contextPath %>/adminPage/list.rp?currentPage=<%= p %>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
	                                    <% }else{ %>
	                                    <button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
	                                    <% } %>
	                                <% } %>
	
	                                <% if(currentPage != maxPage){ %>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.rp?currentPage=<%= currentPage+1 %>';" class="btn btn-secondary btn-sm">&gt;</button>
	                                <button onclick="location.href='<%= contextPath %>/adminPage/list.rp?currentPage=<%= maxPage %>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
	                                <% } %>
								
							</div>
						</td>
						
						<td>
						<div align="right">
							<button type="button" class="btn btn-secondary" id="btnDelete">삭제</button>
							<button type="submit" class="btn btn-primary">블랙리스트 등록</button>
						</div>	
						</td>
						
				</table>
				</div>
			</div>
			<br><br><br>
		
			<script>
			// 제목 선택시 상세조회 페이지로 이동
            $(function(){
            	$("#listArea>tbody>tr").each(function(){
                    $(this).find("td:eq(2)").css("cursor","pointer");
                  
                    $(this).find("td:eq(2)").click(function(){
                      location.href = "<%= contextPath %>/adminPage/detail.rp?rpno=" + $(this).prev().text();
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
	                  		str += "rno=" + selected[i];
	                	}else{
	                  		str += "rno=" + selected[i] + "&";
	                	}
	              	}
	              
	              	if(confirm("정말 삭제하시겠습니까?")) {
	                	location.href="<%=contextPath%>/adminPage/delete.rp?" + str;
	              	} 
	            });
            });
		</script>	
		
	</div>
	<!-- /.container-fluid -->

	<%@ include file="../common/footer.jsp"%>
</body>
</html>