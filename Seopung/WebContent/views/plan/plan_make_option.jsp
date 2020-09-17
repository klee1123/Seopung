<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!doctype html>
<html lang="zxx">

<head>
    <style>
       div{
            box-sizing:border-box;
            margin-top: 10px;
        }
        .wrap{
            width:1000px;
            margin:auto;
        }

        th {
            text-align: left;
            font-size: 20px;
        }

        td {
            width: 120px;
        }

      </style>
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
      <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>

<body>
    <div class="wrap">
        <div class="contents_01" id="">
            <form id="plan_page_01" action="" method="">
                <table id="" width="700px">
                    <tr>
                        <th>
                            <p><h4>일정만들기 < 1 / 2 > </h4></p>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div class="plan_title">
                                <input type="text" style="width:700px" placeholder="일정 제목">
                            </div>
                        </td>
                    </tr>
                    <tr> 
                        <td>
                            <div>
                                <table>
                                    <tr>
                                        <th colspan="2">
                                            일정날짜
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <!--일정 기간 버튼 내용-->
                                            <div class="" id="">
                                                <script type="text/javascript">

                                                $(function(){
                                                    $("#plan_sdate").datepicker({
                                                        onSelect:function(dateText, inst) {
                                                            console.log(dateText);
                                                        }
                                                    });
                                                });
                                                </script>

                                                <input type="text" name="date" id="plan_sdate" size="12">

                                                <input type="button" value="시작일" onclick="$('#plan_sdate').datepicker('show');" />
                                            </div>
                                        </td>
                                        <td>
                                             <!--일정 기간 버튼 내용-->
                                             <div class="" id="">
                                                <script type="text/javascript">

                                                $(function(){
                                                    $("#plan_edate").datepicker({
                                                        onSelect:function(dateText, inst) {
                                                            console.log(dateText);
                                                        }
                                                    });
                                                });
                                                </script>

                                                <input type="text" name="date" id="plan_edate" size="12">

                                                <input type="button" value="종료일" onclick="$('#plan_edate').datepicker('show');" />
                                            </div>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <table>
                                    <tr>
                                        <th colspan="6">
                                            여행유형
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="">남자끼리</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="d">여자끼리</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="">가족</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="">커플/신혼</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="">남자혼자</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="">여자혼자</label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <table>
                                    <tr>
                                        <th colspan="6">
                                            연령대(복수선택가능)
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">10대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="d">20대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">30대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">40대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">50대</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">60대 이상</label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>

                            <div>
                                <table>
                                    <tr>
                                        <th colspan="6">
                                            이동수단(복수선택가능)
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">도보</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="d">택시</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">대중교통</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">전동킥보드</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">자가용</label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="">
                                            <label for="">자전거</label>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>

                            <div>
                                <table>
                                    <tr>
                                        <th colspan="2">
                                            동행 유무
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="">동행</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="">
                                            <label for="">미동행</label>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>

                            <div>
                                <table>
                                    <tr>
                                        <th>
                                            일정 예산금액
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" style="width:230px" placeholder="예산금액">
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <table width=700px>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <th colspan="2">
                                                        스크랩 허용
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="radio" id="">
                                                        <label for="">허용</label>
                                                    </td>
                                                    <td>
                                                        <input type="radio" id="">
                                                        <label for="">미허용</label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <th colspan="2" >
                                                        일정 공개 여부
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td > 
                                                        <input type="radio" id="">
                                                        <label for="">공개</label>
                                                    </td>
                                                    <td>
                                                        <input type="radio" id="">
                                                        <label for="">비공개</label>
                                                    </td>
                                                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <textarea name="" id="" style="resize: none; width: 700px; height: 200px" placeholder=" 내용을 입력해주세요"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <input type="text" style="width:700px" placeholder="해시태그">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <table width=700px>
                                    <tr>
                                        <td>
                                            <button type="button">임시 저장</button>
                                        </td>
                                    
                                        </td>
                                        <td style="text-align: right">
                                            <button type="button">다음 페이지</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>

</html>