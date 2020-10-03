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
            height: 800px;
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
            width:250px;
            height:250px;
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
            	닉네임 : <span id="nick"><%= i.getUserNick() %></span> 날짜 : <span id="date"><%= i.getInquireEnrollDate() %></span>
            <hr style="font-weight: 900; font-size: 30px;">
            <br>
                <div id="iqcontent"><%= i.getInquireContent() %></div>
            <hr style="font-weight: 900; font-size: 30px;">
            <%if(i.getInquireResponse().equals("NULL")) { %>
            	<div id="Admin"></div>
            <% }else { %>
                <div id="Admin">
                    	관리자 답변 : <%= i.getInquireResponse() %>
                    <span id="iqAdmin"></span> 
                </div>
            <% } %>
            <br>
            <div id=enroll align=center>
             <!-- <button class="btn btn-secondary btn-sm">수정</button> -->
                <button id="deleteBtn" class="btn btn-secondary btn-sm">삭제</button>
            </div>
        </div> 
        
	<!-- myContent -->
    </div>
    <!-- myOuter -->
    </div>
    <%@ include file="../common/footer.jsp"%>        
</body>
</html>