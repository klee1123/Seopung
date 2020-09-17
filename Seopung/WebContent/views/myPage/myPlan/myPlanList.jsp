<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #select{padding: 5px;margin-left: 40px;}
        #plan > button {width: 50px;}
        .myplan{
            /* border: 1px solid black; */
            width: 1000px;
            height: 800px;
            margin:auto;
        }
        .MyplanArea{ width:1000px;margin-left:40px;}
        .MakeMap {
            width:250px;
            height:250px;
            display:inline-block;
            margin:14px;
            vertical-align: 80px;
        }
        .MyplanMap{
            width:250px;
            display:inline-block;
            margin:14px;
        }
        .MyplanMap:hover, .MakeMap:hover{
            cursor:pointer;
            opacity:0.7;
        }
    </style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	
	 <div class="myplan" >
            <h1>&nbsp;&nbsp;&nbsp;나의 일정</h1>
            <hr>
        <br>
        <div id="selectButton" > <br>
            <select name="select" id="select">
                <option value="select">모든일정</option>
                <option value="select">일정(공개)</option>
                <option value="select">비공개(비공개)</option>
            </select>
            <button>공유</button>
            <button>삭제</button>
        </div>
        <div class="MyplanArea" >

            <div class="MakeMap" align="center" >
                
                <img src="resources/images/plus.jpg"  width="50" height="50" alt="" style="margin-top: 80px;">
                <p>여행 만들러 가기</p>
            </div>
           
            <!-- 각각 게시판 div -->
            <div class="MyplanMap" align="center">
                    <img src="river2.PNG" width="250" height="200"> <br>
                <p>
                    제목 <br>
                    여행기간
                </p>
            </div>
            
            <div class="MyplanMap" align="center">
                    <img src="river2.PNG" width="250" height="200"> <br>
                    <p>
                        제목 <br>
                        여행기간
                    </p>
            </div>
            <div class="MyplanMap" align="center">
                    <img src="river2.PNG" width="250" height="200"> <br>
                    <p>
                        제목 <br>
                        여행기간
                    </p>
            </div>
        </div>

    </div>
    </div>
</body>
</html>