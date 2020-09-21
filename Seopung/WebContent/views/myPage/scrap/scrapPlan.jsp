<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩일정</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
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
            margin-left: 20px;
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
        <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;스크랩 일정</h1>
            <hr>
        
        <!-- 삭제버튼 묶어준 div -->
        <div id="scrapPlan">
            <button class="btn btn-secondary btn-sm">삭제</button>
        </div>
        
            <!-- 게시판 모두 묶어준 div-->
            <div class="scrapPlanArea">

                <!-- 각각 게시판 div -->
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <div id="staticMap" style="width:250px;height:200px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
					<script>
					var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
					        level: 3 // 이미지 지도의 확대 레벨
					    };
					
					// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
					var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
					</script> <br>
                    <p  align="center">
			                        제목 <br>
			                        사람이름 <br>
			                        예상비용 <br>
			                        날짜
                    </p>
                </div>
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <div id="staticMap2" style="width:250px;height:200px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
					<script>
					var staticMapContainer  = document.getElementById('staticMap2'), // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
					        level: 3 // 이미지 지도의 확대 레벨
					    };
					
					// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
					var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
					</script> <br>
                    <p align="center">
			                        제목 <br>
			                        사람이름 <br>
			                        예상비용 <br>
			                        날짜
                    </p>
                </div>
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <div id="staticMap3" style="width:250px;height:200px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
					<script>
					var staticMapContainer  = document.getElementById('staticMap3'), // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
					        level: 3 // 이미지 지도의 확대 레벨
					    };
					
					// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
					var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
					</script> <br>
                    <p align="center">
			                        제목 <br>
			                        사람이름 <br>
			                        예상비용 <br>
			                        날짜
                    </p>
                </div>
                <div class="scrapPlanMap">
                    <input type="checkbox">
                        <div id="staticMap4" style="width:250px;height:200px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
					<script>
					var staticMapContainer  = document.getElementById('staticMap4'), // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
					        level: 3 // 이미지 지도의 확대 레벨
					    };
					
					// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
					var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
					</script> <br>
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