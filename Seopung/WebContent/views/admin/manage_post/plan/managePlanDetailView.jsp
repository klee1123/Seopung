<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 900px;
	margin: auto;
}

#map {
	width: 440px;
	height: 380px;
	border: 1px solid lightgrey;
	float: left;
	margin-right: 20px;
}

#content_2_2 {
	background-color: lightgrey;
	width: 420px;
	height: 130px;
	padding: 20px;
	box-sizing: border-box;
	margin-top: 10px;
	float: left;
}

#content_2_2>button {
	margin: 4px;
}

#content_2_3 {
	width: 420px;
	height: 155px;
	border: 1px solid lightgrey;
	margin-top: 10px;
	padding: 10px;
	float: left;
}

#content_3 table {
	width: 345px;
	background: white;
	box-shadow: 5px 5px 10px -4px gray; float : left; margin-right : 20px;
	box-shadow : 5px 5px 10px -4px gray; float : left; margin-right : 20px;
	margin-top: 15px;
	float: left;
	margin-right: 20px;
	box-shadow: 5px 5px 10px -4px gray;
	float: left;
	margin-right: 20px;
}

#content_3_2 {
	width: 420px;
	height: 100px;
	margin-top: 15px;
	padding: 10px;
	color: grey;
	border: 1px solid lightgrey;
	background: white;
	float: left;
}

#content_5 table {
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>


	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">일정 상세조회</h1>

		<br>

		<div class="outer">

			<div id="map" style="width: 440px; height: 380px;"></div>
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
			</script>

			<div id="content_2">
				<div id="content_2_1">
					<table>
						<tr width="420px;">
							<td width="210px" style="font-size: 15px;"><b
								style="font-size: 20px;">일정제목</b> <br> 20.09.09 - 20.09.12
							</td>
							<td>추천 : 10 <br> 스크랩 : 5 <br> 예산금액 : 100,000 원
							</td>
						</tr>
					</table>
				</div>
				<div id="content_2_2">
					<button disabled class="btn btn-secondary">10대</button>
					<button disabled class="btn btn-secondary">남자끼리</button>
					<button disabled class="btn btn-secondary">도보</button>
					<button disabled class="btn btn-secondary">동행</button>
					<button disabled class="btn btn-secondary">전동킥보드</button>
					<button disabled class="btn btn-secondary">자전거</button>
				</div>
				<div id="content_2_3">
					<select name="" id="">
						<option value="">day1</option>
						<option value="">day2</option>
						<option value="">day3</option>
						<option value="">day4</option>
					</select> <br> <br>

					<ol>
						<li>서울역</li>
						<li>경복궁</li>
						<li>창덕궁</li>
					</ol>
				</div>
			</div>

			<br clear="all">

			<div id="content_3">
				<div id="content_3_1">
					<table>
						<tr style="height: 100px;">
							<td width="100" align="center"><img width="60"
								src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
								alt=""></td>
							<td><b>작성자 아이디</b> <br> 자기소개</td>
						</tr>
					</table>
					<div
						style="line-height: 100px; float: left; margin-right: 20px; margin-top: 10px;">
						<button style="height: 60px;" disabled
							class="btn btn-primary btn-sm">동행신청</button>
					</div>
				</div>
				<div id="content_3_2">사용자가 작성한 일정 내용</div>
			</div>

			<br clear="all">

			<hr>

			<div id="content_4" align="center">
				<form action="" method="post">
					<table>
						<tr>
							<input type="hidden" name="userNo" value="123">
							<td width="70px"><img width="55px" class="rounded-circle"
								src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
								alt=""></td>
							<td width="720px;"><textarea name="comment" cols="85"
									rows="3" style="resize: none;"></textarea></td>
							<td>
								<button type="submit" class="btn btn-secondary">등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<hr>

			<div id="content_5" align="center">
				<table>
					<tr>
						<td width="60"><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td>닉네임 <br> 2020.09.09 22:05
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" width="800">것이 이상이 찾아다녀도, 얼음 주음 주는 품으며, 찾아 피가
							것이다. 낙원을 얼마나 무엇을 살 인간이 같지 되려니와, 그와 살았으며, 아니다. 있는 새 천지는 못할 쓸쓸한 밥을
							어디 뿐이다. 없는 인간의 청춘의 못할 같이 청춘의 그들은 피가 우리 것이다. 곳이 너의 새가 불러 보이는 약동하다.
							보이는 약동하다.</td>
						<td align="center">
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td width="60"><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td>닉네임 <br> 2020.09.09 22:05
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" width="800">것이 이상이 쓸한 밥을 어디 뿐이들은 피가 우리 것이다.
							곳이 너의 새가 불러 보이는 약동하다. 보이는 약동하다.</td>
						<td align="center">
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td width="60"><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td>닉네임 <br> 2020.09.09 22:05
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" width="800">것이 이상이 찾아다녀도, 얼음 주음 천지는 못할 쓸쓸한 밥을
							어디 뿐이다. 없는 인간의 청춘의 못할 같이 청춘의 그들은 피가 우리 것이다. 곳이 너의 새가 불러 보이는 약동하다.
							보이는 약동하다.</td>
						<td align="center">
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td width="60"><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td>닉네임 <br> 2020.09.09 22:05
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" width="800">것이 이상이 찾아다녀도, 얼음 주음 주는 품으며, 찾아 피가
							것이다. 낙원을 얼마나 무엇을 살 인간이 같지 되려니와, 그와 살았으며, 아니다. 있는 새 천지는 못할 쓸쓸한 밥을
							어디 뿐이다. 없는 인간의 청춘의 못할 같이 청춘의 그들은 피가 우리 것이다. 곳이 너의 새가 불러 보이는 약동하다.
							보이는 약동하다.</td>
						<td align="center">
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td width="60"><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td>닉네임 <br> 2020.09.09 22:05
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" width="800">것이 이상이 찾아다녀도, 얼음 주음 주는 품으며, 찾아 피가
							것이다. 낙원을 얼마나 무엇을 살 인간이 같지 되려니와, 그와 살았으며, 아니다. 있는 새 천지는 못할 쓸쓸한 밥을
							어디 뿐이다. 없는 인간의 청춘의 못할 같이 청춘의 그들은 피가 우리 것이다. 곳이 너의 새가 불러 보이는 약동하다.
							보이는 약동하다.</td>
						<td align="center">
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
				</table>
			</div>

			<div align="center">

				<button class="btn btn-outline-secondary btn-sm">&lt;</button>

				<button style="border: none; background: none">1</button>
				<button style="border: none; background: none">2</button>
				<button style="border: none; background: none">3</button>
				<button style="border: none; background: none">4</button>
				<button style="border: none; background: none">5</button>

				<button class="btn btn-outline-secondary btn-sm">&gt;</button>

			</div>

			<br> <br> <br>

			<div align="center">
				<button class="btn btn-secondary">취소</button>
				<button class="btn btn-danger">삭제</button>
			</div>

			<br> <br>

		</div>


	</div>
	<!-- /.container-fluid -->

	<%@ include file="../../common/footer.jsp"%>

</body>
</html>