<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 일정</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
        #select{padding: 5px;margin-left: 20px;}
        /*#plan > button {width: 50px;}*/
        .myplan{
            /* border: 1px solid black; */
            width: 1000px;
            height: 800px;
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
	<div class="myContent">
	 <div class="myplan" >
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;나의 일정</h1>
            <hr style="color: black;">
        <div id="selectButton" >
            <select name="select" id="select">
                <option value="select">모든일정</option>
                <option value="select">일정(공개)</option>
                <option value="select">비공개(비공개)</option>
            </select>
            <button class="btn btn-secondary btn-sm">삭제</button>
        </div>
        <div class="MyplanArea" >

            <div class="MakeMap" align="center" >
                
                <img src="resources/images/plus.jpg"  width="50" height="50" alt="" style="margin-top: 80px;">
                <p>여행 만들러 가기</p>
            </div>
           
            <!-- 각각 게시판 div -->
            <div class="MyplanMap">
                <input type="checkbox">
                    <img src="river2.PNG" width="250" height="200"> <br>
                <p align="center" >
                    제목 <br>
                    여행기간
                </p>
            </div>
            
            <div class="MyplanMap">
                <input type="checkbox">
                    <img src="river2.PNG" width="250" height="200"> <br>
                    <p align="center" s>
                        제목 <br>
                        여행기간
                    </p>
            </div>
            <div class="MyplanMap" >
                <input type="checkbox">
                    <img src="river2.PNG" width="250" height="200"> <br>
                    <p align="center" >
                        제목 <br>
                        여행기간
                    </p>
            </div>
        </div>

    </div>

    </div>
    </div>
    </div>
</body>
</html>