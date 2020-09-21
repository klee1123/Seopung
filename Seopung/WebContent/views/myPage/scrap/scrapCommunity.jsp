<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


	<div class="myContent">
		<div class="scrapCommunity">
        
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;스크랩 커뮤니티</h1>
            <hr>
        
        <div class="scrapCm">
            
            <button type="button" class="btn btn-secondary btn-sm" style="margin-left: 20px;">삭제</button>
            <br><br>
            <table id="scrapCmTable" class = "table table-hover">
                <thead>
                    <tr align="center">
                        <th><input type="checkbox" class="chk" id="chk_all" name="chkAll" style="width: 25px;">번호</th>
                        <th width="250">제목</th>
                        <th width="350">내용</th>
                        <th width="100">작성자</th>
                        <th width="150">스크랩날짜</th>
                    </tr>
                </thead>
                <tbody id="cmBody">
                    <tr align="center">
                        <td><input type="checkbox"id="chk" name="chk1"> 1.</td>
                        <td><a></a>제목 넣을 칸</td> 
                        <td>내용</td>
                        <td>작성자</td>
                        <td>20.09.21</td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk2"> 2.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>스크랩 날짜 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk3"> 3.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>스크랩 날짜 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk4"> 4.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>스크랩 날짜 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk5"> 5.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>스크랩 날짜 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6"> 6.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>스크랩 날짜 </td>
                    </tr>
                    <tr align="center">
                        <td><input type="checkbox" id="chk" name="chk6"> 7.</td>
                        <td>제목 넣을 칸</td>
                        <td>내용</td>
                        <td>작성자</td>
                        <td>스크랩 날짜 </td>
                    </tr>
                </tbody>
            </table>
        </div>
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
    </script>
	</div>
</div>
</body>
</html>