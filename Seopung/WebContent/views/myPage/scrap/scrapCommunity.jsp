<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.scrapCommunity.model.vo.*"%>
<%@ page import = "com.kh.common.PageInfo"%>
<%
	ArrayList<ScrapCommunity> list = (ArrayList<ScrapCommunity>)request.getAttribute("list");
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
<title>스크랩커뮤니티</title>
<script src="../../../resources/js/jquery-3.5.1.min.js"></script>
<style>
       .scrapCommunity{
            width: 1000px;
            height: 800px;
       }
       
       #cmBody>tr:hover{
            cursor:pointer;
            opacity:0.7;
        }
        #scrapCmTable tr{height:30px;}
        
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	<%
	int userNo = loginUser.getUserNo();
	%>

	<div class="myContent">
		<div class="scrapCommunity">
        
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;스크랩 커뮤니티</h1>
            <hr>
        
        <div class="scrapCm">
            
            <button type="button" id="btn_scrapSc" class="btn btn-secondary btn-sm" style="margin-left: 20px;">삭제</button>
            <br><br>
            <table id="scrapCmTable" class = "table table-hover">
                <thead>
                    <tr align="center">
                        <th width="25"><input type="checkbox" class="chk" id="chk_all" name="chkAll"
                        >&nbsp;&nbsp;글번호</th>
                        <th width="250">제목</th>
                        <th width="150">스크랩날짜</th>
                    </tr>
                </thead>
                <tbody id="cmBody">
                  <%if(list.isEmpty()) { %>
                  		<tr>
                  			<td colspan="5" align="center">조회된 스크랩이 없습니다</td>
                  		</tr>
                	<%}else { %>
                		<%for(ScrapCommunity cm : list) {%>
		                   	<tr align="center"> 
		                        <td><input type="checkbox"id="chk" name="scno" value="<%=cm.getCommunityNo()%>">&nbsp;&nbsp;<%=cm.getCommunityNo() %></td>
		                        <td><a href=""><%=cm.getCommunityTitle() %></a></td>
		                        <td><%=cm.getScrapDate()%></td>
		                    </tr>
	                    <%} %>
                   <% } %>
                </tbody>
            </table>
        </div>
            <br><br>
            <div class="pagingArea" align="center">
				<% if(currentPage != 1) {%>
	                <!-- 맨 처음으로 (<<) -->
	                <button  class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath %>/list.sc?currentPage=1&userNo=<%=userNo%>';"> &lt;&lt; </button>
	                <!-- 이전 페이지로 (<) -->
	                <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.sc?currentPage=<%=currentPage-1%>&userNo=<%=userNo%>';"> &lt; </button>
    			<% } %>
    			<%for(int p=startPage; p<=endPage; p++) { %>
	    			<%if(p != currentPage) {%>
	                <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.sc?currentPage=<%=p%>&userNo=<%=userNo%>';"><%=p%></button>
	                <%}else {%>
	                <button class="btn btn-secondary btn-sm" disabled><%=p%></button>
	                <% } %>
                <% } %>
                <% if(currentPage != maxPage) { %>
	                <!-- 다음 페이지로 (>) -->
	                <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.sc?currentPage=<%=currentPage+1%>&userNo=<%=userNo%>';"> &gt; </button>
	                <!-- 맨 끝으로 (>>) -->
	                <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.sc?currentPage=<%=maxPage%>&userNo=<%=userNo%>';"> &gt;&gt; </button>
            	<% } %>
            </div>
        </div>
    </div>    

    <script>
        // 체크박스 전체선택 및 전체해제
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
        	$("#btn_scrapSc").click(function(){

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
                  		str += "scno=" + selected[i];
                	}else{
                  		str += "scno=" + selected[i] + "&";
                	}
              	}
              
              	if(confirm("정말 삭제하시겠습니까?")) {
              		location.href="<%=contextPath%>/delete.sc?userNo=<%=userNo%>&" + str;
              	} 
            });
        });
    </script>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>