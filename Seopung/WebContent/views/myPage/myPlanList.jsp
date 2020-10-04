<%@page import="oracle.net.aso.p"%>
<%@page import="org.omg.PortableServer.POA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList,com.kh.adminPlan.model.vo.*, java.text.SimpleDateFormat"%>
<%@ page import = "com.kh.common.PageInfo"%>
<%
	ArrayList<Plan> list = (ArrayList<Plan>)request.getAttribute("list");
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
<title>나의 일정</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
        #selectPlan{padding: 5px;margin-left: 20px;}
        /*#plan > button {width: 50px;}*/
        .myplan{
            /* border: 1px solid black; */
            width: 1000px;
            height: 800px;
        }
        .MyplanArea{ width:1000px;margin-left:40px;}
        .MakeMap {
            width:250px;
            height:250px;
            display:inline-block;
            margin:14px;
            vertical-align: 80px;
        }
        .MyplanMap{
            width:250px;
            display:inline-block;
            margin:14px;
        }
        .MyplanMap:hover, .MakeMap:hover{
            cursor:pointer;
            opacity:0.7;
        }
        .myContent>a{
        	text-decoration: none;
        	color:black;
        }
        #chk{
        	width:15px;
        	height:15px;
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
	
	 <div class="myplan" >
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;나의 일정</h1>
            <hr style="color: black;">
        <div id="selectButton" >
            <select name="selectPlan" id="selectPlan">
                <option value="selectPlan">모든일정</option>
                <option value="selectPlan">일정(공개)</option>
                <option value="selectPlan">비공개(비공개)</option>
            </select>
            <button class="btn btn-secondary btn-sm" id="btnMyPlan">삭제</button>
        </div>
        <div class="MyplanArea">

            <div class="MakeMap" align="center" >
                
                <img src="resources/images/plus.jpg"  width="50" height="50" alt="" style="margin-top: 80px;">
                <p><a href="<%=contextPath%>/planOption.pl">여행 만들러 가기</a></p>
            </div>
           
            <!-- 각각 게시판 div -->
            <%if(list.isEmpty()) { %>
            	<div class="MyPlanMap">
             		<p>조회된 문의글이 없습니다</p>
                </div>
            <% }else { %>
            	<% for(Plan p : list) { %>
	            <div class="MyplanMap">
	                <input type="checkbox" id="chk" name="mpno" value="<%= p.getPlanNo() %>">
	                   <div id="seoulMap" style="width:250px;height:200px;">
						<img src="resources/images/서울.jpg" name="mapImg">
						</div>
						<br><br>
	                    <p align="center">
	                     <a href=""></a>
			             <%= p.getPlanTitle()%> <br>
			             <%= p.getStartDate()%> ~ <%= p.getEndDate()%>
			            </p>
	            </div>
	            <% } %>
            <% } %>
        </div>
    </div>
	<!-- myplan -->
    </div>
    <div class="pagingArea" align="center">
			<% if(currentPage != 1) { %>
	            <!-- 맨 처음으로 (<<) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath %>/list.mp?currentPage=1&userNo=<%=userNo%>';"> &lt;&lt; </button>
	            <!-- 이전 페이지로 (<) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.mp?currentPage=<%=currentPage-1%>&userNo=<%=userNo%>';"> &lt; </button>
			<% } %>
            
			<% for(int p=startPage; p<=endPage; p++){ %>
               <%if(p != currentPage) {%>
               <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.mp?currentPage=<%=p%>&userNo=<%=userNo%>';"><%= p %></button>
               <% }else{ %>
               <button class="btn btn-secondary btn-sm" disabled><%= p %></button>
               <% } %>
            <% } %>
			<% if(currentPage != maxPage) { %>
	            <!-- 다음 페이지로 (>) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath %>/list.mp?currentPage=<%=currentPage+1 %>&userNo=<%=userNo%>"> &gt; </button>
	            <!-- 맨 끝으로 (>>) -->
	            <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.mp?currentPage=<%=maxPage%>&userNo=<%=userNo%>"> &gt;&gt; </button>
			<% } %>

        </div>
        <script>
        $(function(){
        	$("#btnMyPlan").click(function(){

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
                  		str += "mpno=" + selected[i];
                	}else{
                  		str += "mpno=" + selected[i] + "&";
                	}
              	}
              
              	if(confirm("정말 삭제하시겠습니까?")) {
              		location.href="<%=contextPath%>/delete.mp?userNo=<%=userNo%>&" + str;
              	} 
            });
        });
        
        </script>
    <!-- content -->
    </div>
    <!-- outer div -->
    </div>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>