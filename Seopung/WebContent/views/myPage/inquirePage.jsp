<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.inquire.model.vo.*"%>
<%@ page import = "com.kh.common.PageInfo"%>
<%
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("list");
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
<title>1:1문의</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.5.1.min.js"></script>
<style>
       
       .inquirePage{
            width: 1000px;
            height: 800px;
       }
       .inquire {
           margin-left: 20px;
       }
       tbody>tr:hover{
            cursor:pointer;
            opacity:0.7;
        }
        #inquireTable tr{
            height:30px;
        }
        #inquireTable a{
        	color:black;
        }
       
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="common/myPageSidebar.jsp" %>
	
	<%
		int userNo = loginUser.getUserNo();
	%>
	
	<div class="myContent">
	
		<div class="inquirePage">
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;1:1문의</h1>
            <hr>
        
        <div class="inquire">
            <button type="button" id="btn_deleteIq" class="btn btn-secondary btn-sm" >삭제</button>
            <br><br>
            <table id="inquireTable" class = "table table-hover">
                <thead>
                    <tr align="center">
                        <th width="100"><input type="checkbox" class="chk" id="chk_all" name="ino">&nbsp;&nbsp;문의번호</th>
                        <th width="600">제목</th>
                        <th width="200">처리상태</th>
                    </tr>
                </thead>
                <tbody>
                <% if(list.isEmpty()){ %>
                	<tr>
                		<td colspan="3" align="center">조회된 문의글이 없습니다</td>
                	</tr>
                <% }else { %>
                		<% for(Inquire i : list) { %>
		                    <tr align="center">
		                        <td><input type="checkbox" id="chk" name="ino" value="<%= i.getInquireNo() %>">
		                        	&nbsp;&nbsp;<%= i.getInquireNo() %></td>
		                        <td><a href="<%=contextPath %>/detail.in?ino=<%=i.getInquireNo()%>"><%= i.getInquireTitle() %></a></td>
		                        <td><%= i.getInquireStatus() %></td>
		                    </tr>	
                    	<% } %>
                    <% } %>
                </tbody>
            </table>
            <br><br>
            <div class="pagingArea" align="center">
			<% if(currentPage != 1) { %>
	            <!-- 맨 처음으로 (<<) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath %>/list.in?currentPage=1&userNo=<%=userNo%>';"> &lt;&lt; </button>
	            <!-- 이전 페이지로 (<) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.in?currentPage=<%=currentPage-1%>&userNo=<%=userNo%>';"> &lt; </button>
			<% } %>
            
			<% for(int p=startPage; p<=endPage; p++){ %>
               <%if(p != currentPage) {%>
               <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.in?currentPage=<%=p%>&userNo=<%=userNo%>';"><%= p %></button>
               <% }else{ %>
               <button class="btn btn-secondary btn-sm" disabled><%= p %></button>
               <% } %>
            <% } %>
			<% if(currentPage != maxPage) { %>
	            <!-- 다음 페이지로 (>) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath %>/list.in?currentPage=<%=currentPage+1 %>&userNo=<%=userNo%>"> &gt; </button>
	            <!-- 맨 끝으로 (>>) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.in?currentPage=<%=maxPage%>&userNo=<%=userNo%>"> &gt;&gt; </button>
			<% } %>

        </div>

    <script>
	   
        // 체크박스 전체선택 및 해제
        $(function(){
            $("#chk_all").click(function(){
            	// chk_all 클릭되었으면
                if($("#chk_all").prop("checked")){
                	// input태크의 아이디가 chk인 것을 찾아서 checked옵션을 true로
                    $("input[id=chk]").prop("checked",true);
					//클릭이 안되어있다면
                }else {
                	// input태그의 아이디가 chk인 것을 찾아서 checked옵션을 false로 정의
                    $("input[id=chk]").prop("checked",false);
                }
            });
        });
     // 삭제시
        $(function(){
        	$("#btn_deleteIq").click(function(){

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
                  		str += "ino=" + selected[i];
                	}else{
                  		str += "ino=" + selected[i] + "&";
                	}
              	}
              
              	if(confirm("정말 삭제하시겠습니까?")) {
              		location.href="<%=contextPath%>/deleteInquire.in?userNo=<%=userNo%>&" + str;
              	} 
            });
        });
    
    </script>
	<!-- myContent -->
    </div>
    <!-- myOuter -->
    </div>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>