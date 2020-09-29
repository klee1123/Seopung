<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>

<meta charset="utf-8">
<title></title>
<style>

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css); 
.notosanskr * { font-family: 'Noto Sans KR', sans-serif; }

div {
	box-sizing: border-box;
}

.wrap {
	width: 1200px;
	height: 1000px;
	margin: auto;
	margin-top: 120px;
	font-family: 'Noto Sans KR', sans-serif; 
}


.so_title {
	font-size: 18px;
	font-weight: bold;
}

.plan_type>div {
	width: 120px;
	float: left;
}

.plan_sec {
	margin-top: 20px;
	height: 60px;
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
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="wrap">

        <h2>고객센터</h2>

        <h3 style="display:inline;">&nbsp;공지사항</h3>
        &emsp;&emsp;&emsp;&emsp;
        <h3 style="display:inline;">1:1문의</h3>

        <hr>

        <div class="outer" align="left">
			<form action="" method="post" id="faqPost">

				<div>

                    <H3>&nbsp;2박 3일 서울투어</H3>
                    <h5>&nbsp;2020.09.09</h5>
                    
					<hr>

					<h5>
                        안녕하세요, 서풍 커뮤니티 팀입니다.<br>
                        언제나 저희 서풍을 이용해주셔서 고맙습니다.<br><br>

                        네이버페이 결제수단 제공 서비스가 네이버페이의 DB 점검으로 인해 일시중지될 예정이오니<br>
                        이용에 참고해 주시기 바랍니다.<br><br>

                        점검 일시 : 2020년 8월 8일 오전 2:00 ~ 7:00<br>
                        점검 대상 : 네이버페이 결제 예약 및 결제수단 등록<br><br>

                        본 점검에 관해 궁금하신 사항은 헬프센터로 문의해 주시기 바랍니다.<br>
                        감사합니다.

                    </h5>

					<hr>
                     

				<br><br>

				<div align="left">
                    <table>
                        <tr>
                            <td width=""><span>총 게시글 수 &nbsp;&nbsp;&nbsp;<b
                                    style="color: red"><%=listCount %></b>개
                            </span></td>
                    </table>
                </div>

                <div align="center">
					<button type="submit" class="btn btn-primary">목록으로 돌아가기</button>
				</div>
                
                <br><br>
    
            </div>
    
    
        </div>
        <!-- /.container-fluid -->
    
        <%@ include file="../common/footer.jsp"%>
    </body>
    </html>