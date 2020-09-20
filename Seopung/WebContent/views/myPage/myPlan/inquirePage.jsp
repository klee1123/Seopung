<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
<script src="../../../resources/js/jquery-3.5.1.min.js"></script>
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
       
    </style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	
	<div class="myContent">
	
		<div class="inquirePage">
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;1:1문의</h1>
            <hr>
        
        <div class="inquire">
            <button class="btn btn-secondary btn-sm">삭제</button>
            <br><br>
            <table id="inquireTable" class = "table table-hover">
                <thead>
                    <tr align="center">
                        <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
                        <th width="400">제목</th>
                        <th width="100">작성자</th>
                        <th width="150">작성일</th>
                        <th width="100">처리상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr align="center">
                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20.08.15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk2">&nbsp;&nbsp;2</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk3">&nbsp;&nbsp;3</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk4">&nbsp;&nbsp;4</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk5">&nbsp;&nbsp;5</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6">&nbsp;&nbsp;6</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6">&nbsp;&nbsp;7</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6">&nbsp;&nbsp;8</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6">&nbsp;&nbsp;9</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6">&nbsp;&nbsp;10</td>
                        <td>제목 넣을 칸</td>
                        <td>이름</td>
                        <td>20-08-15</td>
                        <td>처리상태 </td>
                    </tr>
                </tbody>
            </table>
            <br><br>
            <div class="pagingArea" align="center">

                <!-- 맨 처음으로 (<<) -->
                <button class="btn btn-secondary btn-sm"> &lt;&lt; </button>
                <!-- 이전 페이지로 (<) -->
                <button class="btn btn-secondary btn-sm"> &lt; </button>
    
                <button class="btn btn-outline-secondary btn-sm">1</button>
                <button class="btn btn-outline-secondary btn-sm">2</button>
                <button class="btn btn-outline-secondary btn-sm">3</button>
                <button class="btn btn-outline-secondary btn-sm">4</button>
                <button class="btn btn-outline-secondary btn-sm">5</button>
                
                <!-- 다음 페이지로 (>) -->
                <button class="btn btn-secondary btn-sm"> &gt; </button>
                <!-- 맨 끝으로 (>>) -->
                <button class="btn btn-secondary btn-sm"> &gt;&gt; </button>
            </div>
        </div>
    
    </div>   
    <script>
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
        
    </script>
	<!-- myContent -->
    </div>
    <!-- myOuter -->
    </div>
</body>
</html>