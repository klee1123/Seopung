<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

    <head>
        <style>
            div{
            box-sizing:border-box;
            
            }


            .custom_select_wrap{
                width: 1000px;
             
            }

            #search_form>div{
                height:100%;
                float:left;
            }
            #search_text{width:75%}
            #search_btn{width:25%}
            
            
            ul {
                    list-style-type: none;
                }
                
            table {
                    table-layout: fixed;
            }
                        
            img{
                width: 100%;
                max-width: 250px;
            }
            
            /*드롭다운버튼 스타일*/
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                
            }
            .show {display:block;}
            
            .blog_text {margin: 10px;}

            </style>
            
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
            <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
    </head>
    <body>
        <div class="wrap" >
         
        <!----------------------------------------------- 상세 검색 div start----------------------------------------------------------->  

            <div class="contents_01"><!--상세검색-->
                <table class="custom_select_wrap" style="width: 1100px;" align="center">
                    <tr>
                        <th bgcolor="white" colspan="5" style="margin: 0px;">
                            <div>
                                <p>일정 서비스 (207)</p> <!--일정 서비스(일정 카운트 db연동)-->
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <!--지역 버튼 내용-->
                            <button class="dropbtn" type="button" onclick="myFunction()">지역</button>
                             
                              <script>
                              function myFunction() {
                                  document.getElementById("myDropdown").classList.toggle("show");
                              }
                              
                              window.onclick = function(e) {
                                if (!e.target.matches('.dropbtn')) {
                              
                                  var dropdowns = document.getElementsByClassName("dropdown-content");
                                  for (var d = 0; d < dropdowns.length; d++) {
                                    var openDropdown = dropdowns[d];
                                    if (openDropdown.classList.contains('show')) {
                                    }
                                  }
                                }
                              }
                            </script>
                           
                            <div class="custom_select">
                                <table class="dropdown-content" id="myDropdown">
                                    <tr>
                                        <td> 
                                            <input type="checkbox" id="area_gangnam" class="BtnForm checked"  checked name="category" value="01">
                                            <label for="area_01">강남구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="02">
                                            <label for="area_02">강동구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="03">
                                            <label for="area_03">강북구</label></td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="04">
                                            <label for="area_04">강서구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="05">
                                            <label for="area_05">광진구</label>
                                        </td>
                                    </tr>
                                    <tr style="width: 200px">
                                        <td> 
                                            <input type="checkbox" id="area_gangnam" class="BtnForm checked"  name="plan_area" value="06">
                                            <label for="area_06">관악구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="07">
                                            <label for="area_07">구로구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="08">
                                            <label for="area_08">금천구</label></td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="09">
                                            <label for="area_09">노원구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="10">
                                            <label for="area_10">도봉구</label>
                                        </td>
                                    </tr>
                                    <tr style="width: 200px">
                                        <td> 
                                            <input type="checkbox" id="area_gangnam" class="BtnForm checked"  name="plan_area" value="11">
                                            <label for="area_11">동대문구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="12">
                                            <label for="area_12">동작구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="13">
                                            <label for="area_13">마포구</label></td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="14">
                                            <label for="area_14">서대문구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="15">
                                            <label for="area_15">서초구</label>
                                        </td>
                                    </tr>
                                    <tr style="width: 200px">
                                        <td> 
                                            <input type="checkbox" id="area_gangnam" class="BtnForm checked"  name="plan_area" value="16">
                                            <label for="area_16">성동구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="17">
                                            <label for="area_17">성북구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="18">
                                            <label for="area_18">송파구</label></td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="19">
                                            <label for="area_19">양천구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="20">
                                            <label for="area_20">영등포구</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> 
                                            <input type="checkbox" id="area_gangnam" class="BtnForm checked"  name="plan_area" value="21">
                                            <label for="area_21">용산구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="22">
                                            <label for="area_22">은평구</label>
                                        </td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="23">
                                            <label for="area_23">종로구</label></td>

                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="24">
                                            <label for="area_24">중구</label>
                                        </td>
                                        
                                        <td> 
                                            <input type="checkbox" id="interest_category_02" class="BtnForm"  name="plan_area" value="24">
                                            <label for="area_25">중랑구</label>
                                        </td>

                                    </tr>
            
                                    <tr>
                                        <td colspan="5" style="text-align: center">
                                            <div class="button_area">
                                                <div class="btn_wrap">
                                                    <button type="button" class="btn_check">적용</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </td>
                        <td>
                            <!--일정 기간 버튼 내용-->
                            <div class="" id="">
                                <script type="text/javascript">

                                $(function(){
                                    $("#plan_date").datepicker({
                                        onSelect:function(dateText, inst) {
                                            console.log(dateText);
                                        }
                                    });
                                });
                                </script>

                                <input type="text" name="date" id="plan_date" size="12">

                                <input type="button" value="일정기간" onclick="$('#plan_date').datepicker('show');" />
                            </div>
                        </td>
                        <td>
                            <!--연령 버튼 내용-->
                            <button class="dropbtn" type="button" onclick="myFunction1()">연령</button>
                            
                            <script>
                            function myFunction1() {
                                document.getElementById("myDropdown1").classList.toggle("show");
                            }
                            
                            window.onclick = function(e) {
                                if (!e.target.matches('.dropbtn')) {
                             
                                    var dropdowns = document.getElementsByClassName("dropdown-content");
                                        for (var d = 0; d < dropdowns.length; d++) {
                                            var openDropdown = dropdowns[d];
                                            if (openDropdown.classList.contains('show')) {
                                            }
                                        }
                                }
                            }
                            </script>

                            <div class="custom_select">
                                <table class="dropdown-content" id="myDropdown1">
                                    
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="age_01" class="BtnForm checked"  checked name="age" value="10">
                                            <label for="age_01">10대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="age_02" class="BtnForm"  name="age" value="20">
                                            <label for="age_02">20대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="age_03" class="BtnForm" name="age" value="30">
                                            <label for="area_03">30대</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="age_04" class="BtnForm" name="age" value="40">
                                            <label for="area_04">40대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="age_05" class="BtnForm" name="age" value="50">
                                            <label for="area_05">50대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="age_06" class="BtnForm"  name="age" value="60">
                                            <label for="area_06">60대</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: center;">
                                            <div class="button_area">
                                                <div class="btn_wrap">
                                                    <button type="button" class="btn_check">적용</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                        </td>
                        <td>
                            <!--유형 버튼 내용-->
                            <button class="dropbtn" type="button" onclick="myFunction2()">유형</button>
                        
                            <script>
                            function myFunction2() {
                                document.getElementById("myDropdown2").classList.toggle("show");
                            }
                            
                            window.onclick = function(e) {
                                if (!e.target.matches('.dropbtn')) {
                            
                                    var dropdowns = document.getElementsByClassName("dropdown-content");
                                        for (var d = 0; d < dropdowns.length; d++) {
                                            var openDropdown = dropdowns[d];
                                            if (openDropdown.classList.contains('show')) {
                                            }
                                        }
                                }
                            }
                            </script>

                            <div class="custom_select">
                                <table class="dropdown-content" id="myDropdown2">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="plan_type_01" class="BtnForm checked" checked name="plan_type" value="남자끼리">
                                            <label for="plan_type_01">남자끼리</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_type_02" class="BtnForm" name="plan_type" value="여자끼리">
                                            <label for="plan_type_02">여자끼리</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_type_03" class="BtnForm" name="plan_type" value="가족">
                                            <label for="plan_type_03">가족</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="plan_type_04" class="BtnForm" name="plan_type" value="커플/신혼">
                                            <label for="plan_type_04">커플/신혼</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_type_05" class="BtnForm" name="plan_type" value="남자혼자">
                                            <label for="plan_type_05">남자혼자</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_type_06" class="BtnForm" name="plan_type" value="여자혼자">
                                            <label for="plan_type_06">여자혼자</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: center;">
                                            <div class="button_area">
                                                <div class="btn_wrap">
                                                    <button type="button" class="btn_check">적용</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td>
                            <!--유형 버튼 내용-->
                            <button class="dropbtn" type="button" onclick="myFunction3()">이동수단</button>
                        
                            <script>
                            function myFunction3() {
                                document.getElementById("myDropdown3").classList.toggle("show");
                            }
                            
                            window.onclick = function(e) {
                                if (!e.target.matches('.dropbtn')) {
                            
                                    var dropdowns = document.getElementsByClassName("dropdown-content");
                                        for (var d = 0; d < dropdowns.length; d++) {
                                            var openDropdown = dropdowns[d];
                                            if (openDropdown.classList.contains('show')) {
                                            }
                                        }
                                }
                            }
                            </script>

                            <div class="custom_select">
                                <table class="dropdown-content" id="myDropdown3">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="plan_tran_01" class="BtnForm checked" checked name="plan_tran" value="도보">
                                            <label for="plan_tran_01">도보</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_tran_02" class="BtnForm" name="plan_tran" value="택시">
                                            <label for="plan_tran_02">택시</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_tran_03" class="BtnForm" name="plan_tran" value="대중교통">
                                            <label for="plan_tran_03">대중교통</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="plan_tran_04" class="BtnForm" name="plan_tran" value="자전거">
                                            <label for="plan_tran_04">자전거</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_tran_05" class="BtnForm" name="plan_tran" value="승용차">
                                            <label for="plan_tran_05">승용차</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="plan_tran_06" class="BtnForm" name="plan_tran" value="전동킼보드">
                                            <label for="plan_tran_06">전동킥보드</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: center;">
                                            <div class="button_area">
                                                <div class="btn_wrap">
                                                    <button type="button" class="btn_check">적용</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <div colspan="5">
                            <div class="">
                                <form action="" id="search_form">
                                    <div id="search_text">
                                        <input type="search" name="search" placeholder="검색어 입력">
                                    </div>
                                    <div id="search_btn">
                                        <input type="submit" value="검색">
                                    </div>
                                </form>
                            </div>
                        </td>
                    </tr>
                </table>
                
                
            </div>


            <!----------------------------------------------- 상세 검색 div end----------------------------------------------------------->


            <!----------------------------------------------- 등록된 일정 목록 div start----------------------------------------------------------->
            <div class="contents_02" align="center" style="margin-top: 20px;"><!--등록된 일정들 조회-->
                <table class="the_plan"> <!--2행 4열 테이블 안에 등록된 일정 번호를 참고하여 표시-->
                    <tr>
                        <td>
                            
                            <div class="blog_text" >
                                <a href="http://naver.com"><img src="img/blog/blog_1.png"></a><!-- 이미지에 링크 연결-->
                                <h2>1박2일 서울일정</h2>
                                <ul>
                                    <li><p>고길동</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 40만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                          
                            </div>

                        </td>
                        <td>
                        
                            <div class="blog_text">
                                <a href=""><img src="img/blog/blog_1.png"></a>
                                <h2>역사탐방</h2>
                                <ul>
                                    <li><p>현빈</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 8만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                            </div>
                            
                        </td>
                        <td>
                        
                            <div class="blog_text">
                                <a href=""><img src="img/blog/blog_1.png"></a>
                                <h2>유적지 탐사</h2>
                                <ul>
                                    <li><p>아이유</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 7만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                            </div>
                            
                        </td>
                        <td>
                        
                            <div class="blog_text">
                                <a href=""><img src="img/blog/blog_1.png"></a>
                                <h2>남산타워</h2>
                                <ul>
                                    <li><p>정유미</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 5만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                            </div>
                            
                        </td>

                    </tr>
                   
                    <tr>
                        <td>
                            
                            <div class="blog_text">
                                <a href=""><img src="img/blog/blog_1.png"></a>
                                <h2>가로수길</h2>
                                <ul>
                                    <li><p>남희석</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 10만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                            </div>

                        </td>
                        <td>
                        
                            <div class="blog_text">
                                <a href=""><img src="img/blog/blog_1.png"></a>
                                <h2>서울숲</h2>
                                <ul>
                                    <li><p>안영미</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 2만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                            </div>
                            
                        </td>
                        <td>
                        
                            <div class="blog_text">
                                <a href=""><img src="img/blog/blog_1.png"></a>
                                <h2>뚝섬유원지</h2>
                                <ul>
                                    <li><p>이수영</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 5만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                            </div>
                            
                        </td>
                        <td>
                        
                            <div class="blog_text">
                                <a href=""><img src="img/blog/blog_1.png"></a>
                                <h2>이태원</h2>
                                <ul>
                                    <li><p>유재석</p></li>  <!--일정번호 작성자의 회원번호를 참조하여 닉네임 표시-->
                                    <li><p>예상비용 : 15만원</p></li>   <!--일정번호 참조하여 예상비용 표시-->
                                    <li><p>20.08.29 ~ 20.08.30</p></li> <!--일정번호 참조하여 일정기간 표시-->
                                </ul>
                            </div>
                            
                        </td>
                    </tr>
                </table>
            </div>
            <!-----------------------------------------------등록된 일정 목록 div end----------------------------------------------------------->

            <!----------------------------------------------- 페이지 수 div start----------------------------------------------------------->
            <div><!--페이지 표시-->
                <br><br><br>
                <div class ="page_number" align="center">
                    <button class="btn btn-secondary btn-sm">&lt;&lt;</button>
                    <button class="btn btn-secondary btn-sm">&lt;</button>

                    <button class="btn btn-outline-secondary btn-sm">1</button>
                    <button class="btn btn-outline-secondary btn-sm">2</button>
                    <button class="btn btn-outline-secondary btn-sm">3</button>
                    <button class="btn btn-outline-secondary btn-sm">4</button>
                    <button class="btn btn-outline-secondary btn-sm">5</button>

                    <button class="btn btn-secondary btn-sm">&gt;</button>
                    <button class="btn btn-secondary btn-sm">&gt;&gt;</button>
                </div>
            </div>
             <!----------------------------------------------- 페이지 수 div end----------------------------------------------------------->
        </div>

    </body>

</html>