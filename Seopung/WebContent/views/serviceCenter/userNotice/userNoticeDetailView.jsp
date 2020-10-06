<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.Notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>	
	
<!doctype html>
<html>

<head>

<meta charset="utf-8">
<title></title>
<style>

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css); 
.notosanskr * { font-family: 'Noto Sans KR', sans-serif; }

div {
	box-sizing: border-box;
}

.wrap {
	width: 1200px;
	height: 1000px;
	margin: auto;
	margin-top: 120px;
	font-family: 'Noto Sans KR', sans-serif; 
}


.so_title {
	font-size: 18px;
	font-weight: bold;
}

.plan_type>div {
	width: 120px;
	float: left;
}

.plan_sec {
	margin-top: 20px;
	height: 60px;
}

.bbtn {
	display: inline-block;
	border: 1px solid #dfdfdf;
	background: #00c0ff;
	color: #fff;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 999;
	cursor: pointer;
}

.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 999;
	cursor: pointer;
}

.box-radio-input input[type="radio"]:checked+span {
	background: #00c0ff;
	color: #fff;
}

.box-check-input input[type="checkbox"] {
	display: none;
}

.box-check-input input[type="checkbox"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 500;
	cursor: pointer;
}

.box-check-input input[type="checkbox"]:checked+span {
	background: #00c0ff;
	color: #fff;
}
</style>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>

<body>
	<%@include file="../../common/menubar.jsp"%>
	<div class="wrap">

        <h2>&nbsp;고객센터</h2><br>

        <h3 style="display:inline;">&nbsp;공지사항</h3>
        &emsp;&emsp;&emsp;&emsp;
        <h3 style="display:inline;">1:1문의</h3>

        <hr>

        <div class="outer" align="left">
			<form action="<%= contextPath %>/detail.no" 
				  method="post" id="userNoticeForm">

				<div>

                    <H3>&nbsp;<%=n.getNoticeTitle()%></H3>
                    <h6>&nbsp;<%=n.getNoticeEnroll()%></h6>
                    <h6>&nbsp;조회수 <%=n.getNoticeViews()%></h6>
                    
					<hr>
	
					<!-- 여기에 공지사항 내용 -->
					<h6><%= n.getNoticeContent() %></h6>

					<hr>

				<br><br>

                <div align="center">
					<button class="btn btn-primary" onclick="history.back();">
					목록으로 돌아가기</button>
				</div></div>
				</form>
                
                <br><br>
    
            </div>
    
        </div>
        <!-- /.container-fluid -->
    
        <%@ include file="../../common/footer.jsp"%>
    </body>
    </html>