<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩일정</title>
<style>
        
        .scrapPlanAll{
            width: 1000px;
            height: 800px;
        }
        .scrapPlanArea{
            width:1000px;
            margin-left:20px;
        }
        #scrapPlan > button {
            width: 50px;
            margin-left: 40px;
        }
        .scrapPlanMap{
            width:250px;
            display:inline-block;
            margin:14px;
        }
        .scrapPlanMap:hover{
            cursor:pointer;
            opacity:0.7;
        }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	
	<div class="myContent">
		<div class="scrapPlanAll">
        
            <h1>&nbsp;&nbsp;&nbsp;일정</h1>
            <hr>
        
        <!-- 삭제버튼 묶어준 div -->
        <div id="scrapPlan"> <br>
            <button>삭제</button>
        </div>
        
            <!-- 게시판 모두 묶어준 div-->
            <div class="scrapPlanArea">

                <!-- 각각 게시판 div -->
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <img src="river2.PNG" width="250" height="200"> <br>
                    <p  align="center">
                        제목 <br>
                        사람이름 <br>
                        예상비용 <br>
                        날짜
                    </p>
                </div>
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <img src="river2.PNG" width="250" height="200"> <br>
                    <p align="center">
                        제목 <br>
                        사람이름 <br>
                        예상비용 <br>
                        날짜
                    </p>
                </div>
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <img src="river2.PNG" width="250" height="200"> <br>
                    <p align="center">
                        제목 <br>
                        사람이름 <br>
                        예상비용 <br>
                        날짜
                    </p>
                </div>
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <img src="river2.PNG" width="250" height="200"> <br>
                    <p align="center">
                        제목 <br>
                        사람이름 <br>
                        예상비용 <br>
                        날짜
                    </p>
                </div>
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <img src="river2.PNG" width="250" height="200"> <br>
                    <p align="center">
                        제목 <br>
                        사람이름 <br>
                        예상비용 <br>
                        날짜
                    </p>
                </div>
            </div>
       
    </div>
	
	</div>
	</div>
</body>
</html>