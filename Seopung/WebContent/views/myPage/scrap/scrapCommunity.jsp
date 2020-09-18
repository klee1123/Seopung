<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩커뮤니티</title>
<style>
       .scrapCommunity{
            width: 1000px;
            height: 800px;
       }
       
       #cmBody>tr:hover{
            cursor:pointer;
            opacity:0.7;
            background: lightblue;
        }
        #scrapCmTable tr{height:30px;}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>


	<div class="myContent">
		<div class="scrapCommunity">
        
            <h1>&nbsp;&nbsp;&nbsp;커뮤니티</h1>
            <hr>
        
        <div class="scrapCm"> <br>
            <form action="" method="POST">
            <button>삭제</button>
            <br><br>
            <table id="scrapCmTable">
                <thead>
                    <tr align="center">
                        <th><input type="checkbox" class="chk" id="chk_all" name="chkAll"> 번호</th>
                        <th width="250">제목</th>
                        <th width="400">내용</th>
                        <th width="100">작성자</th>
                        <th width="150">스크랩날짜</th>
                    </tr>
                </thead>
                <tbody id="cmBody">
                    <tr align="center">
                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1.</td>
                        <td><a></a>제목 넣을 칸</td> 
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.08.15 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk2">&nbsp;&nbsp;2.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.08.15 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk3">&nbsp;&nbsp;3.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.08.15</td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk4">&nbsp;&nbsp;4.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.08.15 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk5">&nbsp;&nbsp;5.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.08.15 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6">&nbsp;&nbsp;6.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.08.15 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6">&nbsp;&nbsp;7.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.08.15 </td>
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
        

        //
     
    </script>
	</div>
</div>
</body>
</html>