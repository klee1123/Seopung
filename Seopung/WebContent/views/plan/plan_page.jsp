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
               width:1200px;
               height:800px;
               margin:auto;
         }
         .wrap>div{
               width:100%;
         }
         .top{height:50px}
         .main_contents{height:480px}
         .footer{height:140px}
         .ffooter{height: 140px;}


         .top>div{
            height:100%;
            float:left;
         }
         .top_01{width:50%}
         .top_02{width:50%}



         .main_contents>div{
            height:100%;
            float:left;
         }
         .main_contents_01{width:550px}
         .main_contents_02{width:646px; padding:10px}
         
         .main_contents_01>div{
            width: 100%;
            float:top;
         }
         .mc01_01{height: 75%}
         .mc01_02{height: 20%; padding:10px}

         .mc01_02>div{
            height:100%;
            float:left;
         }
         #plan_profile{width:70%}
         #plan_profile_btn{width:30%}



         .main_contents_02>div{
            width: 100%;
            float:top;
            margin-bottom: 10px;
         }
         .mc01_01{height: 75%}
         .mc01_02{height: 20%; padding:10px}


         #plan_comment>div{
            width:100%;
            float:left;
         }
         #plan_comment_title{ height: 50%;}
         #plan_comment_content{ height: 50%;}





         #mc02_01>div{
            height: 100%;
            float:left;
         }
         #plan_info_01{ width: 50%;}
         #plan_info_02{ width: 50%;}


         
         #plan_info_01>div{
            width: 100%;
            float:left;
         }
         #plan_title{ height:50%;}
         #plan_date{ height: 50%;}


      








         button{
            display:inline-block;
                border:1px solid #dfdfdf;   
                background:#00c0ff; 
                color:#fff;
                padding:0px 8px;
                text-align:center;
                width: 100px;
                height:42px;
                line-height:42px;
                font-weight:999;
                cursor:pointer;
         }   

      </style>
   </head>
   <body>
      <div class="wrap">

         <div class="top">
            <div class="top_01">
               <div class="ptb_writer"> <!--아이디 넘버 체크시 작성자와 일치하면 해당 div 활성화-->
                  <button>수정</button>
                  <button>삭제</button>
               </div>
            </div>
            <div class="top_02">
               <div id="ptb_reader" style="text-align: right;"> <!--아이디 넘버 체크시 작성자와 일치하지 않으면 해당 div 활성화-->
                  <button>추천</button>
                  <button>스크랩</button>
                  <button>신고하기</button>
               </div>
            </div>
         </div>

         <div class="main_contents">

            <div class="main_contents_01">
               <div class="mc01_01">
                  <div class="plan_mid_map" >
                     <div id="map" style="width:550px; height:360px"></div>
                     
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

               <div class="mc01_02">
                  <div id="plan_profile" style="box-shadow: 5px 5px 10px -2px gray;"><!--일정 작성자 프로필 정보 div start-->
                     <div id="">
                        <img src="img/blog/blog_1.png" style="width: 96px; float:left; margin-right: 10px;">
                     </div>
                     <div id="">
                        <p>작성자 아이디</p>
                        <p>작성자가 작성한 한줄 소개</p>
                     </div>
                  </div><!--일정 작성자 프로필 정보 div end-->

                  <div id="plan_profile_btn" style="text-align: center; padding: 10px;" > <!-- 동행 신청 버튼 -->
                     <button type="" class="genric-btn success large" style="width:100px; height: 50px;">동행신청</button>
                  </div>
               </div>

            </div>










            <div class="main_contents_02" style="border: solid;">
               
               <div id="mc02_01">
                  <div id="plan_info_01">
                     <div id="plan_title" style="font-size: 22px;">
                        <b>일정제목</b>
                     </div>
                     <div id="plan_date" style="font-size: 18px;">
                        <b>20.08.30 - 20.08.31</b>
                     </div>
                  </div>
                 
                  <div id="plan_info_02">
                        <li> 추천 : 5 </li>
                        <li> 스크랩 : 25 </li>
                        <li> 일정 예산 금액 : 50,000 원 </li>
                  </div>

               </div>
               <div id="mc02_02">
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
                 
               </div>

               <div id="mc02_03">
                  <div class="" style="text-align: center;">
                     <select name="">
                        <option value="" selected>일정일을 선택하세요</option>
                        <option value="">Day 1</option>
                        <option value="">Day 2</option>
                     </select>
                  </div>
                  <div>
                     <ul>
                        <li>kh 국밥</li> <!--저장된 위치 지점 연동-->
                        <li>kh 카페</li>
                        <li>kh 기념품점</li>
                     </ul>
                  </div>
               </div>

               <div id="mc02_04">
                  <div class="" style="height: 80px; margin-top: 20px; border-style:groove">
                     일정 작성자가 텍스트상자에 작성한 내용
                  </div>
               </div>

            </div>
         </div>




         


















         <div class="footer">

            <div id="plan_comment_write">
               <hr style="margin-bottom: 20px; border: 1px solid;">
               <div id="thumb" style="height: 100px; width: 100px; float:left; padding: 10px;">
                  <img src="img/comment/comment_1.png" alt="" > <!--회원의 등록된 프로필 사진 기능구현-->
               </div> 
               <div id="" style="width: 800px; height: 100px; float:left;">
                  <textarea class="" name="comment" id="comment" style="width: 800px; height: 100px;" placeholder="내용을 입력해주세요" ></textarea>
               </div>
               <div id="" style="height: 100px;">
                  <button type="submit" class="genric-btn success large">등록</button>
               </div>
            </div>

         </div>

         <div class="ffooter">
            <div id="plan_comment_list">
               <hr style="margin-top: 10px; margin-bottom: 20px; border: 1px solid;">
               <div id="thumb" style="height: 100px; width: 100px; float:left; padding: 10px;">
                  <img src="img/comment/comment_1.png" alt="" > <!--회원의 등록된 프로필 사진 기능구현-->
               </div> 
   
               <div id="plan_comment">
                  <div id="plan_comment_title" style="float:left;">
                     유저1 - 2020.08.30 12:20 신고
                  </div>
                  <div id="plan_comment_content" style="float: left;">
                     유저1의 댓글내용
                  </div>
               </div>
            </div>
         </div>
        

      </div>
   </body>
</html>