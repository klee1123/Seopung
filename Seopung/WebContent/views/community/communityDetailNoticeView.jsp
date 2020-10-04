<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.community.model.vo.*, java.text.SimpleDateFormat" %>

 <%
 	Community nc = (Community)request.getAttribute("nc");
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #content{
        	margin-top:150px;
            width:900px;
            margin:auto;
        }
        button{
            cursor: pointer;
        }
        #content>div{
            box-sizing: border-box;
            /* border:1px solid black; */
            width: 100%;
        }
        #content_1{height:50px; background:lightgrey;}
        #content_2{height:25px;}
        #content_3{height:600px;} /*임시*/
        #content_4{height:20px; padding-left:10px}
        #content_5{height:75px;}
        #content_7{height:40px;background:lightgrey;}

        #content_1>div{
            display: table-cell;
            height:100%;
            padding: 10px;
            line-height:40px;
        }
        #content_2>div{
            display: table-cell;
            height:100%;
            padding-left: 10px;
            padding-right: 10px;
            line-height: 30px; 
        }
        #content_3{
            padding: 10px;
        }
        #content_7>button{
            width:100%;
            height:100%;
            border:none;
            background:none;
        }
        
    </style>
</head>
<body>
	<%@include file = "../common/menubar.jsp" %>
	 <br>
    
    <div id="content">

        <div id="content_1" style="margin-top:150px;">
            <div style="width:730px; font-size:18px;"><%=nc.getTitle() %></div>
            <div style="text-align:right;"><%=nc.getEnroll() %></div>
            
        </div>

        <div id="content_2">
            <div style="width:610px;"><%=nc.getUserNo() %></div>
            <div >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</div>
             <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
            <div>&nbsp;&nbsp;&nbsp;조회수 <%=nc.getCount() %></div>
        </div>

        <hr>

        <div id="content_3">
            <%=nc.getContent() %>
        </div>
        <%if(loginUser != null && loginUser.getUserNo() == nc.getUserNo1()&& loginUser.getCategory() == 2){  %>
        <div align="center">
				
				<button class="btn btn-danger" onclick="del();">삭제</button>
			</div>
        <%} %>
        <div id="content_4">

        </div>

        <hr>
        
        

        

    </div>
	<script>
		function del(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="<%=contextPath%>/delete.co?cno=<%=nc.getComNo()%>"
			}else{
				
			}
		}
	</script>
    <br>
    <br>
</body>
</html>