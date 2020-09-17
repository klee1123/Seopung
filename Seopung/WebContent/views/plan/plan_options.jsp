<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>travel</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <!--<link rel="stylesheet" href="css/style.css">-->

    <style>
        
        th {
            font-size: 20px;
        }

        td {
            
            width: 120px;
            padding: 5px;
        }

      </style>
</head>

<body>
    <form id="plan_page_01" action="" method="">
        <table id="ta1" width="700px">
            <tr>
                <th>
                    일정만들기 < 1 / 2 >
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
                    <table>
                        <tr>
                            <th colspan="2">
                                일정날짜
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <input type="date" name="plan_sdate" id="plan_sdate">
                            </td>
                            <td>
                                <input type="date" name="plan_edate" id="plan_edate">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
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
                
                </td>
            </tr>
            <tr>
                <td>
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
                
                </td>
            </tr>
            <tr>
                <td>
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
                </td>
            </tr>
            <tr>
                <td>
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
                </td>
            </tr>
            <tr>
                <td>
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
                </td>
            </tr>
            <tr >
                <td >
                    <table width=700 >
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
                                    <tr >
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
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="" id="" style="resize: none; width: 700px; height: 200px" placeholder=" 내용을 입력해주세요"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" style="width:700px" placeholder="해시태그">
                </td>
            </tr>
            <tr>
                <td>
                    <table width=700px>
                       
                        <tr>
                            <td>
                                <button type="button">임시 저장</button>
                            </td>
                           
                            </td>
                            <td style="width:140px; text-align: right;">
                                <button type="button">다음 페이지</button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>

</html>