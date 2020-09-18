<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       
       .inquirePage{
            width: 1000px;
            height: 800px;
       }
       .inquire {
           margin-left: 40px;
       }
       tbody>tr:hover{
            cursor:pointer;
            opacity:0.7;
            background: lightblue;
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
	        
	            <h1>&nbsp;&nbsp;&nbsp;1:1문의</h1>
	            <hr>
	        
	        <div class="inquire"> <br>
	            <form action="" method="POST">
	            <button>삭제</button>
	            <br><br>
	            <table id="inquireTable">
	                <thead>
	                    <tr align="center">
	                        <th><input type="checkbox" class="chk" id="chk_all" name="chkAll">번호</th>
	                        <th width="400">제목</th>
	                        <th width="100">작성자</th>
	                        <th width="150">작성일</th>
	                        <th width="100">처리상태</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr align="center">
	                        <td><input type="checkbox"id="chk" name="chk1">1.</td>
	                        <td>제목 넣을 칸</td>
	                        <td>이름</td>
	                        <td>20-08-15</td>
	                        <td>처리상태 </td>
	                    </tr>
	                    <tr align="center">
	                        <td><input type="checkbox" id="chk" name="chk2">2.</td>
	                        <td>제목 넣을 칸</td>
	                        <td>이름</td>
	                        <td>20-08-15</td>
	                        <td>처리상태 </td>
	                    </tr>
	                    <tr align="center">
	                        <td><input type="checkbox" id="chk" name="chk3">3.</td>
	                        <td>제목 넣을 칸</td>
	                        <td>이름</td>
	                        <td>20-08-15</td>
	                        <td>처리상태 </td>
	                    </tr>
	                    <tr align="center">
	                        <td><input type="checkbox" id="chk" name="chk4">4.</td>
	                        <td>제목 넣을 칸</td>
	                        <td>이름</td>
	                        <td>20-08-15</td>
	                        <td>처리상태 </td>
	                    </tr>
	                    <tr align="center">
	                        <td><input type="checkbox" id="chk" name="chk5">5.</td>
	                        <td>제목 넣을 칸</td>
	                        <td>이름</td>
	                        <td>20-08-15</td>
	                        <td>처리상태 </td>
	                    </tr>
	                    <tr align="center">
	                        <td><input type="checkbox" id="chk" name="chk6">6.</td>
	                        <td>제목 넣을 칸</td>
	                        <td>이름</td>
	                        <td>20-08-15</td>
	                        <td>처리상태 </td>
	                    </tr>
	                    <tr align="center">
	                        <td><input type="checkbox" id="chk" name="chk6">7.</td>
	                        <td>제목 넣을 칸</td>
	                        <td>이름</td>
	                        <td>20-08-15</td>
	                        <td>처리상태 </td>
	                    </tr>
	                </tbody>
	            </table>
	            </form>
	            <br><br>
	            <div class="pagingArea" align="center">
	
	                <!-- 맨 처음으로 (<<) -->
	                <button> &lt;&lt; </button>
	                <!-- 이전 페이지로 (<) -->
	                <button> &lt; </button>
	    
	                <button>1</button>
	                <button>2</button>
	                <button>3</button>
	                <button>4</button>
	                <button>5</button>
	                
	                <!-- 다음 페이지로 (>) -->
	                <button> &gt; </button>
	                <!-- 맨 끝으로 (>>) -->
	                <button> &gt;&gt; </button>
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