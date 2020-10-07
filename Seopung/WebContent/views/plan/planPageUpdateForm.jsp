<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.kh.planMake.model.vo.PlanMake"%>


<%
	PlanMake pm = (PlanMake)request.getAttribute("pm");


%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>일정 만들기 - 지도</title>
<style>
/* 폰트 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css); 
.notosanskr * { font-family: 'Noto Sans KR', sans-serif; }
/* 폰트 */


/************************** 지도 css start **********************************/
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}
.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}
#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}
.bg_white {
	background: #fff;
}
#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}
#menu_wrap .option {
	text-align: center;
}
#menu_wrap .option p {
	margin: 10px 0;
}
#menu_wrap .option button {
	margin-left: 5px;
}
#placesList li {
	list-style: none;
}
#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}
#placesList .item span {
	display: block;
	margin-top: 4px;
}
#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
#placesList .item .info {
	padding: 10px 0 10px 55px;
}
#placesList .info .gray {
	color: #8a8a8a;
}
#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}
#placesList .info .tel {
	color: #009900;
}
#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}
#placesList .item .marker_1 {
	background-position: 0 -10px;
}
#placesList .item .marker_2 {
	background-position: 0 -56px;
}
#placesList .item .marker_3 {
	background-position: 0 -102px
}
#placesList .item .marker_4 {
	background-position: 0 -148px;
}
#placesList .item .marker_5 {
	background-position: 0 -194px;
}
#placesList .item .marker_6 {
	background-position: 0 -240px;
}
#placesList .item .marker_7 {
	background-position: 0 -286px;
}
#placesList .item .marker_8 {
	background-position: 0 -332px;
}
#placesList .item .marker_9 {
	background-position: 0 -378px;
}
#placesList .item .marker_10 {
	background-position: 0 -423px;
}
#placesList .item .marker_11 {
	background-position: 0 -470px;
}
#placesList .item .marker_12 {
	background-position: 0 -516px;
}
#placesList .item .marker_13 {
	background-position: 0 -562px;
}
#placesList .item .marker_14 {
	background-position: 0 -608px;
}
#placesList .item .marker_15 {
	background-position: 0 -654px;
}
#pagination {
	margin: 10px auto;
	text-align: center;
}
#pagination a {
	display: inline-block;
	margin-right: 10px;
}
#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

/************************** 지도 css end **********************************/

#so_title {
	font-size: 18px;
	font-weight: bold;
	color: #fec104;
}
/* 전체 감싸는 div */
.wrap {
	width: 1200px;
	margin-top:0px;
	margin: auto;
	font-family: 'Noto Sans KR', sans-serif;
	
}

#contents{
	padding: 0px 200px 0px 200px;
}

#inputBox{
	height:80px;
}


/************************** 작성완료 버튼 css start **********************************/
.bbtn {
	display: inline-block;
	border: 1px solid #dfdfdf;
	background: #00c0ff;
	color: #fff;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 999;
	cursor: pointer;
}
/************************** 작성완료 버튼 css end **********************************/


/************************** tab 버튼 css start **********************************/

/* Style the tab */
.tab {
  float: left;
  width: 20%;
  height: 200px;
  border: 1px solid #ccc;
  overflow:auto;
}

/* Style the buttons inside the tab */
.tab .tablinks {
  display: block;
  color: black;
  padding: 10px 10px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 16px;
}

/* Change background color of buttons on hover */
.tab .tablinks:hover {
	background: #00c0ff;
	color: #fff;
}

/* Create an active/current "tab button" class */
.tab .tablinks.active {
  background: #00c0ff;
	color: #fff;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 10px;
  border: 1px solid #ccc;
  width: 80%;
  border-left: none;
  height: 200px;
  overflow:auto;
}
/************************** tab 버튼 css end **********************************/
.plan_type>div {
	width: 130px;
	float: left;
}

.bbtn {
	display: inline-block;
	border: 1px solid #dfdfdf;
	background: #00c0ff;
	color: #fff;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 999;
	cursor: pointer;
}

.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 999;
	cursor: pointer;
}

.box-radio-input input[type="radio"]:checked+span {
	background: #00c0ff;
	color: #fff;
}

.box-check-input input[type="checkbox"] {
	display: none;
}

.box-check-input input[type="checkbox"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 500;
	cursor: pointer;
}

.box-check-input input[type="checkbox"]:checked+span {
	background: #00c0ff;
	color: #fff;
}
</style>

</head>
<body>

	<div id="header" style="margin-bottom:150px;">
		<%@include file="../common/menubar.jsp"%>
	</div>

	
	<div class="wrap">
	
		<div id="contents">
			<div id="so_title" style="text-align:center; font-size:30px;">일정 수정 페이지</div>
			<div id="content1">
			<!-- 지도 div -->
			<div id="so_title">지도 검색</div>
				<div class="map_wrap">
					
					<div id="map" style="width: 800px; height: 500px; position: relative; overflow: hidden;"></div>
					<div id="menu_wrap" class="bg_white">
						<div class="option">
							<div>
								<form onsubmit="searchPlaces(); return false;">
									<input type="text" value="서울" id="keyword" placeholder="추가할 일정지 검색">
									<button type="submit">검색</button>
								</form>
							</div>
						</div>
						<hr>
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div>
				</div>
			</div><!-- id=1 end  -->
			
			
			<!-- 입력 폼 양식 div -->
			<div id="content2" style="margin-top:10px;">
				<form action="<%= contextPath %>/planPageUpdate.pl" style="width:800px;" method="post">
					<div>
					 	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
						<input type="hidden" name="planDay" value="<%=pm.getPlanDay()%>">
					
					</div>
					
					<div id="planOption" >
					
						<div style="height:70px;">
							<div id="so_title">일정 제목</div>
							<div id="so_title"> <input type="text" style="width: 800px" name="planTitle" id="plan_title" placeholder="일정 제목" value="<%= pm.getPlanTitle() %>" required > </div>
						</div>
						
						<div id="inputBox" style="height:70px">
							<div id="so_title">일정날짜</div>
							<div id="planDate">
								<table>
									<tr>
										<td style="width: 400px;">
											<div id=""> <input type="date" name="planSdate" id="sDate" size="12" value="<%= pm.getPlanSdate() %>" required> </div>
										</td>
										<td>
											<div id=""> <input type="date" name="planEdate" id="eDate" size="12" value="<%= pm.getPlanEdate() %>" required> </div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						
						<div id="inputBox">
							<div id="so_title">여행 유형</div>
							<div class="plan_type">
								<div class="">
									<label class="box-radio-input"><input type="radio" name="planType" value="남자끼리" checked="checked"><span>남자끼리</span></label>
								</div>
								<div>
									<label class="box-radio-input"><input type="radio" name="planType" value="여자끼리"><span>여자끼리</span></label>
								</div>
								<div>
									<label class="box-radio-input"><input type="radio" name="planType" value="가족"><span>가족</span></label>
								</div>
								<div>
									<label class="box-radio-input"><input type="radio" name="planType" value="커플"><span>커플/신혼</span></label>
								</div>
								<div>
									<label class="box-radio-input"><input type="radio" name="planType" value="남자혼자"><span>남자혼자</span></label>
								</div>
								<div>
									<label class="box-radio-input"><input type="radio" name="planType" value="여자혼자"><span>여자혼자</span></label>
								</div>
							</div>
							<script>
				            	$(function(){
				            		
				            		var planType = "<%=pm.getPlanType()%>";
				            		//  "운동,등산,요리"	 /  ""
				            		
				            		$("input[type=radio]").each(function(){
				            			// 순차적으로 접근한 input요소의 value값이 interest에 포함되어있을 경우
				            			// => 해당 input요소에 checked 속성 부여
				            			if(planType.search($(this).val()) != -1){ 
				            				$(this).attr("checked", true);
				            			}
				            		});
				            	});
				            </script>
						</div>
						
						
						<div id="inputBox">
							<div id="so_title">연령대(복수선택가능)</div>
							<div class="plan_type">
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planAge" value="10" checked="checked"><span>10대</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planAge" value="20"><span>20대</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planAge" value="30"><span>30대</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planAge" value="40"><span>40대</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planAge" value="50"><span>50대</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planAge" value="60"><span>60대</span></label>
								</div>
							</div>
							<script>
				            	$(function(){
				            		
				            		var planAge = "<%=pm.getPlanAge()%>";
				            		//  "운동,등산,요리"	 /  ""
				            		
				            		$("input[type=checkbox]").each(function(){
				            			// 순차적으로 접근한 input요소의 value값이 interest에 포함되어있을 경우
				            			// => 해당 input요소에 checked 속성 부여
				            			if(planAge.search($(this).val()) != -1){ 
				            				$(this).attr("checked", true);
				            			}
				            		});
				            	});
				            </script>
						</div>
						
						<div id="inputBox">
							<div id="so_title">이동수단(복수선택가능)</div>
							<div class="plan_type">
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planTrans" value="도보" checked="checked"><span>도보</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planTrans" value="택시"><span>택시</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planTrans" value="대중교통"><span>대중교통</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planTrans" value="전동킥보드"><span>전동킥보드</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planTrans" value="자가용"><span>자가용</span></label>
								</div>
								<div class="">
									<label class="box-check-input"><input type="checkbox" name="planTrans" value="자전거"><span>자전거</span></label>
								</div>
							</div>
							<script>
				            	$(function(){
				            		
				            		var planTrans = "<%=pm.getPlanTrans()%>";
				            		//  "운동,등산,요리"	 /  ""
				            		
				            		$("input[type=checkbox]").each(function(){
				            			// 순차적으로 접근한 input요소의 value값이 interest에 포함되어있을 경우
				            			// => 해당 input요소에 checked 속성 부여
				            			if(planTrans.search($(this).val()) != -1){ 
				            				$(this).attr("checked", true);
				            			}
				            		});
				            	});
				            </script>
						</div>
						
						<div id="inputBox">
							<table>
								<tr>
									<td>
										<div id="so_title" style="width:400px;">동행 유무</div>
										<div class="plan_type">
											<div class="">
												<label class="box-radio-input"><input type="radio" name="planAcc" value="y" checked="checked"><span>동행</span></label>
											</div>
											<div class="">
												<label class="box-radio-input"><input type="radio" name="planAcc" value="n"><span>비동행</span></label>
											</div>
										</div>
									</td>
									<td>
										<div id="so_title">일정 예산금액</div>
										<div class="plan_budget">
											<div class=""> 
												<input type="text" style="width: 230px; height: 30px;" name="planBudget" placeholder="예산금액" value="<%= pm.getPlanBudget() %>">
											</div>
										</div>
									</td>
								</tr>
							</table>
							<script>
				            	$(function(){
				            		
				            		var planAcc = "<%=pm.getPlanAcc()%>";
				            		//  "운동,등산,요리"	 /  ""
				            		
				            		$("input[type=radio]").each(function(){
				            			// 순차적으로 접근한 input요소의 value값이 interest에 포함되어있을 경우
				            			// => 해당 input요소에 checked 속성 부여
				            			if(planAcc.search($(this).val()) != -1){ 
				            				$(this).attr("checked", true);
				            			}
				            		});
				            	});
				            </script>
						</div>
					
						<div id="inputBox">
							<table>
								<tr>
									<td>
									<div style="width:400px; height:100px;">
										<span id="so_title">스크랩 허용</span>
										<div class="plan_type">
											<div class="">
												<label class="box-radio-input"><input type="radio" name="planScrapYn" value="y" checked="checked"><span>허용</span></label>
											</div>
											<div class="">
												<label class="box-radio-input"><input type="radio" name="planScrapYn" value="n"><span>비허용</span></label>
											</div>
										</div>
										<script>
							            	$(function(){
							            		
							            		var planScrapYn = "<%=pm.getPlanScrapYn()%>";
							            		//  "운동,등산,요리"	 /  ""
							            		
							            		$("input[type=radio]").each(function(){
							            			// 순차적으로 접근한 input요소의 value값이 interest에 포함되어있을 경우
							            			// => 해당 input요소에 checked 속성 부여
							            			if(planScrapYn.search($(this).val()) != -1){ 
							            				$(this).attr("checked", true);
							            			}
							            		});
							            	});
							            </script>
									</div>
								</td>
								<td>
									<div style="width:400px; height:100px; ">
										<span id="so_title">일정 공개 여부</span>
										<div class="plan_type">
											<div class="">
												<label class="box-radio-input"><input type="radio" name="planPrivate" value="y" checked="checked"><span>공개</span></label>
											</div>
											<div class="">
												<label class="box-radio-input"><input type="radio" name="planPrivate" value="n"><span>비공개</span></label>
											</div>
										</div>
										<script>
							            	$(function(){
							            		
							            		var planPrivaten = "<%=pm.getPlanPrivate()%>";
							            		//  "운동,등산,요리"	 /  ""
							            		
							            		$("input[type=radio]").each(function(){
							            			// 순차적으로 접근한 input요소의 value값이 interest에 포함되어있을 경우
							            			// => 해당 input요소에 checked 속성 부여
							            			if(planPrivate.search($(this).val()) != -1){ 
							            				$(this).attr("checked", true);
							            			}
							            		});
							            	});
							            </script>
									</div>
								</td>
								</tr>
							</table>
						</div>
						
						<div id="inputBox" style="margin-top:0px;">
							<!-- tap 버튼 및 tap 리스트 -->
							<div id="planPlace">
								<div id="so_title">장소명</div>
								<div class="tab">
								  <input type="button" class="tablinks" onclick="openCity(event, 'Day1')" id="defaultOpen"></input>
							      <input type="button" class="tablinks" onclick="openCity(event, 'Day2')"></input>
							      <input type="button" class="tablinks" onclick="openCity(event, 'Day3')"></input>
								</div>
								
								<div id="Day1" class="tabcontent">
							 		<div id="placeName1" ><input type="text" name="planPlace"><input type="button" class="btnAdd1" value="Add"><br></div>
								</div>
								
								<div id="Day2" class="tabcontent">
								 	<div id="placeName2" ><input type="text" name="planPlace"><input type="button" class="btnAdd2" value="Add"><br></div>
								</div>
								
								<div id="Day3" class="tabcontent">
								  	<div id="placeName3" ><input type="text" name="planPlace"><input type="button" class="btnAdd3" value="Add"><br></div>
								</div>
							</div>
							
						</div>
						
						<div style="margin-top:160px;">
							<div id="so_title">메모작성</div>
							<textarea name="planMemo" style="resize: none; width: 800px; height: 200px" placeholder=" 내용을 입력해주세요"><%= pm.getPlanMemo() %></textarea>
						</div>
						
						<div style="margin-top:20px;">
							<button class="bbtn" type="submit" style="width:800px;">수정완료</button>
						</div>
						
					</div> <!-- planOption end -->
				</form> <!--  form end -->
			</div> <!-- id=2 end  -->
		</div>	
	</div> <!--  wrap end -->
	
	<div id="footer">
		<%@include file="../common/footer.jsp"%>
	</div>		
	
	
	<!------------------------------------------------------------- 스크립트들  ----------------------------------------------------------------------------->
	
	
	<!-- 카카오 지도 스크립트 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(
						places[i].y, places[i].x), marker = addMarker(
						placePosition, i), itemEl = getListItem(i,
						places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker,
							'mouseover', function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker,
							'mouseout', function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>'
					+ places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name
						+ '</span>'
						+ '   <span class="jibun gray">'
						+ places.address_name + '</span>';
			} else {
				itemStr += '    <span>' + places.address_name
						+ '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone
					+ '</span>' + '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0,
						(idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc,
					imageSize, imgOptions), marker = new kakao.maps.Marker(
					{
						position : position, // 마커의 위치
						image : markerImage
					});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document
					.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">'
					+ title + '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
	
	<!-- tap 스크립트 -->
	<script>
		function openCity(evt, days) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(days).style.display = "block";
		  evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>
		
		
	<!-- 장소명 text 추가 버튼 스크립트  -->
 	<script>
 		 $(document).ready (function () {                
             $('.btnAdd1').click (function () {                                        
                 $('#placeName1').append (                        
                     '<div><input type="text" name="planPlace"> <input type="button" class="btnRemove1" value="Remove"></div>'                    
                 ); // end append      
                 
                 $('.btnRemove1').on('click', function () { 
                	 $(this).prev().remove (); // remove the textbox
                     $(this).next().remove (); // remove the <div>
                     $(this).remove (); // remove the button
                 });
             }); // end click                                            
         }); // end ready 
 	</script>
 	
 	
 	<!-- Date 제한 스크립트 -->
 	<script>
       document.getElementById("sDate").onchange = function () {
           var input = document.getElementById("eDate");
           input.setAttribute("min", this.value);
       }
       document.getElementById("eDate").onchange = function () {
           var input = document.getElementById("sDate");
           input.setAttribute("max", this.value);
       }
   	</script>
   	
   	
   	
   
   	
   

</body>
</html>