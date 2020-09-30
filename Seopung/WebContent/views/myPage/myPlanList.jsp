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
        .myContent>a{
        	text-decoration: none;
        	color:black;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="common/myPageSidebar.jsp" %>
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
                
                <img src="../../resources/images/plus.jpg"  width="50" height="50" alt="" style="margin-top: 80px;">
                <p><a href="">여행 만들러 가기</a></p>
            </div>
           
            <!-- 각각 게시판 div -->
            <div class="MyplanMap">
                <input type="checkbox">
                    <div id="map" style="width: 250px; height: 200px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
		
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
						mapOption = {
							center : new kakao.maps.LatLng(33.450936, 126.569477), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커를 표시할 위치와 title 객체 배열입니다 
				var positions = [ {
					title : '카카오',
					latlng : new kakao.maps.LatLng(33.450705, 126.570677)
				}, {
					title : '생태연못',
					latlng : new kakao.maps.LatLng(33.450936, 126.569477)
				}, {
					title : '텃밭',
					latlng : new kakao.maps.LatLng(33.450879, 126.569940)
				}, {
					title : '근린공원',
					latlng : new kakao.maps.LatLng(33.451393, 126.570738)
				} ];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 35);

					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});
				}
				
				// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
				var linePath = [
				    new kakao.maps.LatLng(33.450936, 126.569477),
				    new kakao.maps.LatLng(33.450879, 126.569940),
				    new kakao.maps.LatLng(33.450705, 126.570677),
				    new kakao.maps.LatLng(33.451393, 126.570738)
				];

				// 지도에 표시할 선을 생성합니다
				var polyline = new kakao.maps.Polyline({
				    path: linePath, // 선을 구성하는 좌표배열 입니다
				    strokeWeight: 5, // 선의 두께 입니다
				    strokeColor: '#FFAE00', // 선의 색깔입니다
				    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				    strokeStyle: 'solid' // 선의 스타일입니다
				});

				// 지도에 선을 표시합니다 
				polyline.setMap(map);  
			</script> <br>
                <p align="center" >
                    제목 <br>
                    여행기간
                </p>
            </div>
            
            <div class="MyplanMap">
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
                    <p align="center" s>
                        제목 <br>
                        여행기간
                    </p>
            </div>
            <div class="MyplanMap" >
                <input type="checkbox">
                    <div id="staticMap2" style="width:250px;height:200px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
					<script>
					var staticMapContainer  = document.getElementById('staticMap2'), // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(35.450701, 126.570667), // 이미지 지도의 중심좌표
					        level: 3 // 이미지 지도의 확대 레벨
					    };
					
					// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
					var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
					</script><br>
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
    <%@ include file="../common/footer.jsp"%>
</body>
</html>