<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.inquire.model.vo.*"%>
<%
	Inquire i = (Inquire)request.getAttribute("i");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.5.1.min.js"></script>
<style>
       
       .inquire{
            width: 1000px;
            height: 1000px;
       }
       .inquireEnroll {
           margin-left: 40px;
       }
        #inquireEnTable tr{
            height:40px;
        }
        #inquireEnTable{
            width:800px;
        }
        #iqContent {
            height: 400px;
        }
        #enroll{
            margin-right: 160px;
        }
        #inName{
            font-size: 22px;
        }
        #iqcontent{
            width:800px;
            height:250px;
        }
        .Admin{
        	width:800px;
            height:200px;
        }
       
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="common/myPageSidebar.jsp" %>
	

	<div class="myContent">
	<div class="inquire">
        <br>
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;1:1문의</h1>
            <hr>
            
        <div class="inquireEnroll"> <br>
           
            <h4>
               <span name="iqTitle"><%= i.getInquireTitle() %> </span>
            </h4>
            	닉네임 : <span id="nick"><%= i.getUserNick() %> /</span> 날짜 : <span id="date"><%= i.getInquireEnrollDate() %></span>
            <hr style="font-weight: 900; font-size: 30px;">
            <br>
                <div id="iqcontent"><%= i.getInquireContent() %></div>
            <hr style="font-weight: 900; font-size: 30px;">
            <div class="Admin">
            <%if(i.getInquireResponse() == null) { %>
            	<div class="AdminNO"></div>
            <% }else { %>
                <div class="AdminYes">
                    	관리자 답변 : 
                    <span id="iqAdmin"><%= i.getInquireResponse() %></span> 
                </div>
            <% } %>
            </div>
            <hr>
            <br>
            <div id=enroll align=center>
             	<button id="iqListBtn" class="btn btn-secondary btn-sm"><a style="text-decoration: none; color:white" href="<%= contextPath %>/list.in?currentPage=1&userNo=<%=loginUser.getUserNo()%>">목록</a></button>
                
            </div>
        </div> 
    </div>    
	<!-- myContent -->
    </div>
    <!-- myOuter -->
    </div>
    <%@ include file="../common/footer.jsp"%>        
</body>
</html>