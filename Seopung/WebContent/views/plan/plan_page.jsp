<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
<html lang="zxx">

   <head>
     
      <style>
         div{
           
            box-sizing:border-box;
         }
         .wrap{
            width:1000px;
            height:800px;
            margin:auto;
         }

         table{
            border:1px solid red;
         }
         
         td{
            border:1px solid black;
         }

      </style>
   </head>
   <body>
      <div class="wrap">
         <table style="width: 1000px;">
            <tr>
               <td style="width: 500px;">
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

         
         <div class="contents_01">
            <div class="plan_mid_map">
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
         </div>
         
         <div class="contents_02">
            <div>
               일정제목
            </div>
            <div>
               날짜
            </div>
            <div>
               추천 : <br>
               스크랩 : <br>
               일정 예산 금액 : xxx,xxx,xxx원
            </div>

            <div>
               <div>
                  일정 달력
               </div>
               <div>
                  <ul>
                     <li>kh 국밥</li> <!--저장된 위치 지점 연동-->
                     <li>kh 카페</li>
                     <li>kh 기념품점</li>
                  </ul>
               </div>
            </div>



            <div> 작성자 아이디, 작성자가 작성한 한줄 소개 </div>
            <div>
               <button type=""" class="genric-btn success large">동행신청</button>
            </div>
            <div>
               일정 작성자가 텍스트상자에 작성한 내용
            </div>

         </div>










            <div class="comment-form">
               <form class="" action="#" id="commentForm">
                  <div class="form-group">
                     <div class="thumb">
                        <img src="img/comment/comment_1.png" alt=""> <!--회원의 등록된 프로필 사진 기능구현-->
                     </div> 
                     <div>
                        <textarea class="" name="comment" id="comment" style="width: 800px; height: 100px" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                     <div>
                        <div class="form-group mt-3">
                           <button type="submit" class="genric-btn success large">등록</button>
                        </div>
                     </div>
                  </div>
               </form>
            </div>

            <div class="plan_re_reply">
            </div>




         <div class="comments-area">
               <div class="comment-list">
                  <div class="single-comment justify-content-between d-flex">
                     <div class="user justify-content-between d-flex">
                        <div class="thumb">
                           <img src="img/comment/comment_1.png" alt=""> <!--회원의 등록된 프로필 사진 기능구현-->
                        </div>
                        <div class="desc">
                        
                           <div class="d-flex justify-content-between">
                              <div class="d-flex align-items-center">
                                 <h5>
                                    <a href="#">닉네임</a> <!--작성자 닉네임 DB에서 불러올것-->
                                 </h5>
                                 <p class="date">날짜</p> <!-- 작성된 날짜 시간 DB에서 불러올것-->
                              </div>
                              <div class="reply-btn">
                                 <a href="#" class="btn-reply text-uppercase">신고</a> <!-- 신고 버튼 구현할것-->
                              </div>
                           </div>
                           <p class="comment">
                              내용 <!--작성자가 작성한 내용 db에서 불러올것-->
                           </p>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="comment-list">
                  <div class="single-comment justify-content-between d-flex">
                     <div class="user justify-content-between d-flex">
                        <div class="thumb">
                           <img src="img/comment/comment_2.png" alt=""> <!--회원의 등록된 프로필 사진 기능구현-->
                        </div>
                        <div class="desc">
                        
                           <div class="d-flex justify-content-between">
                              <div class="d-flex align-items-center">
                                 <h5>
                                    <a href="#">닉네임</a> <!--작성자 닉네임 DB에서 불러올것-->
                                 </h5>
                                 <p class="date">날짜</p> <!-- 작성된 날짜 시간 DB에서 불러올것-->
                              </div>
                              <div class="reply-btn">
                                 <a href="#" class="btn-reply text-uppercase">신고</a> <!-- 신고 버튼 구현할것-->
                              </div>
                           </div>
                           <p class="comment">
                              내용 <!--작성자가 작성한 내용 db에서 불러올것-->
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
            
            </div>

         
    </body>
</html>