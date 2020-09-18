<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

   <head>
     
      <style>
         div{
           /*  border:1px solid red; */
            box-sizing:border-box;
         }
         .wrap{
            width:1200px;
            height:800px;
            margin:auto;
         }
/* 
         table{
            border:1px solid red;
         } */
         
         /* td{
            border:1px solid black;
         } */
         .top .mid .low>div{
            width:1100px;
         }
         table {
                    table-layout: fixed;
            }

         button{
            width: 90px;
            height: 30px;
            margin: 0px;
         }   

      </style>
   </head>
   <body>
      <div class="wrap" align="center">
         <div class="main_contents" style="width: 1100px">
            <div class="top">
               <table style="width: 1100px;">
                  <tr>
                     <td style="width: 550px;">
                        <div id="ptb_writer"> <!--아이디 넘버 체크시 작성자와 일치하면 해당 div 활성화-->
                           <button>수정</button>
                           <button>삭제</button>
                        </div>
                        
                     </td>
                     <td>
                        <div id="ptb_reader" style="text-align: right;"> <!--아이디 넘버 체크시 작성자와 일치하지 않으면 해당 div 활성화-->
                           <button>추천</button>
                           <button>스크랩</button>
                           <button>신고하기</button>
                        </div>
                     </td>
                  </tr>
               </table>
            </div>

            <div class="mid" style="margin-top: 15px;">
               <!-------------------------------------------------------------------------- 지도 + 작성자프로필 + 동행신청버튼 div start ----------------------------------------------------------------->
               <div class="contents_01" style="float:left;">
                  <table>
                     <tr>
                        <td>
                           <div class="plan_mid_map" >
                              <div id="map" style="width:450px;height:350px;"></div>
                              
                              <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
                              <script>
                              var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                                 mapOption = { 
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                 };
                              
                              var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                              
                              // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
                              var positions = [
                                 {
                                    content: '<div>카카오</div>', 
                                    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
                                 },
                                 {
                                    content: '<div>생태연못</div>', 
                                    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
                                 },
                                 {
                                    content: '<div>텃밭</div>', 
                                    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
                                 },
                                 {
                                    content: '<div>근린공원</div>',
                                    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
                                 }
                              ];
                              
                              for (var i = 0; i < positions.length; i ++) {
                                 // 마커를 생성합니다
                                 var marker = new kakao.maps.Marker({
                                    map: map, // 마커를 표시할 지도
                                    position: positions[i].latlng // 마커의 위치
                                 });
                              
                                 // 마커에 표시할 인포윈도우를 생성합니다 
                                 var infowindow = new kakao.maps.InfoWindow({
                                    content: positions[i].content // 인포윈도우에 표시할 내용
                                 });
                              
                                 // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                                 // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                                 // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                                 kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                                 kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                              }
                              
                              // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
                              function makeOverListener(map, marker, infowindow) {
                                 return function() {
                                    infowindow.open(map, marker);
                                 };
                              }
                              
                              // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
                              function makeOutListener(infowindow) {
                                 return function() {
                                    infowindow.close();
                                 };
                              }
                              
                              /* 아래와 같이도 할 수 있습니다 */
                              /*
                              for (var i = 0; i < positions.length; i ++) {
                                 // 마커를 생성합니다
                                 var marker = new kakao.maps.Marker({
                                    map: map, // 마커를 표시할 지도
                                    position: positions[i].latlng // 마커의 위치
                                 });
                              
                                 // 마커에 표시할 인포윈도우를 생성합니다 
                                 var infowindow = new kakao.maps.InfoWindow({
                                    content: positions[i].content // 인포윈도우에 표시할 내용
                                 });
                              
                                 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
                                 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                                 (function(marker, infowindow) {
                                    // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
                                    kakao.maps.event.addListener(marker, 'mouseover', function() {
                                          infowindow.open(map, marker);
                                    });
                              
                                    // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
                                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                                          infowindow.close();
                                    });
                                 })(marker, infowindow);
                              }
                              */
                              </script>
                        </div>
            
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <div style="margin: 5px;"><!--일정 작성자 프로필 정보 div start-->
                              <span><img src="img/blog/blog_1.png" style="width: 80px; float:left;"></span>
                              <span style="width: 240px; float:left; margin-left: 10px;">
                                 <p>작성자 아이디</p>
                                 <p>작성자가 작성한 한줄 소개</p>
                              </span>
                           </div><!--일정 작성자 프로필 정보 div end-->

                           <span> <!-- 동행 신청 버튼 -->
                              <button type="" class="genric-btn success large" style="width:100px; height: 50px;">동행신청</button>
                           </span>
                        </td>
                     </tr>
                  </table>
               </div>
            <!-------------------------------------------------------------------------- 지도 + 작성자프로필 + 동행신청버튼 div end ----------------------------------------------------------------->
            <div class="contents_02">
               <table width=600px>
                  <tr>
                     <td>
                        <div style="font-size: 22px;">
                           <b>일정제목</b>
                        </div>
                        <div style="font-size: 18px;">
                           <b>20.08.30 - 20.08.31</b>
                        </div>
                     </td>
                     <td>
                        <div>
                           추천 : 5
                           스크랩 : 25
                           일정 예산 금액 : 50,000 원
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" align="center" > 
                        <table style="width:590px; height: 100px; text-align: center;">
                           <tr>
                              <td><button>10대</button></td>
                              <td><button>남자끼리</button></td>
                              <td><button>도보</button></td>
                              <td><button>동행</button></td>
                              <td><button>택시</button></td>
                           </tr>
                           <tr>
                              <td><button>전동킥보드</button></td>
                              <td><button>자전거</button></td>
                              <td></td>
                              <td></td>
                              <td></td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <table width="592px" style="margin: 0px; ">
                           <tr style="height: 175px;">
                              <td>
                                 <div class="" style="text-align: center;">
                                    <select name="">
                                       <option value="" selected>일정일을 선택하세요</option>
                                       <option value="">Day 1</option>
                                       <option value="">Day 2</option>
                                    </select>
                                 </div>
                              </td>
                           
                              <td>
                                 <div>
                                    <ul>
                                       <li>kh 국밥</li> <!--저장된 위치 지점 연동-->
                                       <li>kh 카페</li>
                                       <li>kh 기념품점</li>
                                    </ul>
                                 </div>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <div class="" style="height: 80px; margin-top: 20px; background-color: lemonchiffon;">
                           일정 작성자가 텍스트상자에 작성한 내용
                        </div>
                     </td>
                  </tr>
               </table>

            </div>
              
         </div>
         
         <div class="low" style="margin-top: 10px;">
            <div>

               
               <div>
                  <hr>
               </div>
               <div class="comment-form"  style="margin-top: 10px;">
                  
                  <form class="" action="#" id="commentForm">
                     <div class="form-group"></div>
                        <div class="thumb" style="height: 100px; width: 100px; float:left;">
                           <img src="img/comment/comment_1.png" alt="" > <!--회원의 등록된 프로필 사진 기능구현-->
                        </div> 
                        <div class="" style="width: 800px; height: 100px; float:left;">
                           <textarea class="" name="comment" id="comment" style="width: 800px; height: 90px;" placeholder="내용을 입력해주세요" ></textarea>
                        </div>
                        <div class="" style="height: 100px;">
                           <button type="submit" class="genric-btn success large">등록</button>
                        </div>
                     </div>
                  </form>
               </div>

               <div>
                  <hr>
               </div>

               <div class="comment-listform" style="margin-top: 10px;">
                  
                  <form class="" action="#" id="commentForm">
                     <div class="form-group"></div>
                        <div class="thumb" style="height: 100px; width: 100px; float:left;">
                           <img src="img/comment/comment_1.png" alt="" > <!--회원의 등록된 프로필 사진 기능구현-->
                        </div> 
                        <div class="" style="width: 800px; height: 100px; float:left;">
                           <textarea class="" name="comment" id="comment" style="width: 800px; height: 90px;" placeholder="내용을 입력해주세요" ></textarea>
                        </div>
                        <div class="" style="height: 100px;">
                           <button type="submit" class="genric-btn success large">등록</button>
                        </div>
                     </div>
                  </form>

               </div>
            </div>

         </div>

      </div>
         
   </body>
</html>