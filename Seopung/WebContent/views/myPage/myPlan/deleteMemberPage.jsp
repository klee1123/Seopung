<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #delete_body>img{
            width: 750px;
            height:500px;
            resize: none;
            margin-left:60px;
        }
       
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	<div class="myContent">
    <!-- 삭제되는 글 안내문 -->
    	<div class="deleteMem">
    <!-- 삭제되는 글 안내문 -->
    <br>
    <div id="delete_body">
        <img src="../../../resources/images/탈퇴.jpg" alt="">
    </div>
    <br>
    <div align="center"; style="margin-right: 150px;">
    <button align="center" class="btn btn-secondary btn">탈퇴하기</button>
    </div>
   
    </div>
    </div>
	
	</div>
	</div>
</body>
</html>