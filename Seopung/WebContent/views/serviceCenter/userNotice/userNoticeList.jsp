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
	<%@include file="../../common/menubar.jsp"%>
	<div class="wrap">

        <h2>고객센터</h2>

        <h3 style="display:inline;">&nbsp;공지사항</h3>
        &emsp;&emsp;&emsp;&emsp;
        <h3 style="display:inline;">1:1문의</h3>

        <hr>

        <div class="outer" align="left">
			<form action="" method="post" id="faqPost">

				<div>

                    <br>

                    <div style="height: auto; width: 90%; border:1px solid rgb(201, 201, 201);">
                    
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h6>
                        <h3>
                            &emsp;[서비스 개편 안내] 동행 서비스 추가 기능 개선
                        </h3>
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;20.09.29</h6>
                        
                        </div>
                        <br>

                    <div style="height: auto; width: 90%; border:1px solid rgb(201, 201, 201);">
                    
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h6>
                        <h3>
                            &emsp;[서풍LIVE] 내 여행 일정 : 동행 분야 신청 안내
                        </h3>
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;20.09.29</h6>
                        
                        </div>
                        <br>

                    <div style="height: auto; width: 90%; border:1px solid rgb(201, 201, 201);">
                    
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h6>
                        <h3>
                            &emsp;[정책 변경] 커뮤니티 이용 약관 및 기준 신설
                        </h3>
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;20.09.29</h6>
                            
                        </div>
                        <br>

                     <div style="height: auto; width: 90%; border:1px solid rgb(201, 201, 201);">
                    
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h6>
                        <h3>
                            &emsp;[정책 변경] 커뮤니티 이용 약관 및 기준 신설
                        </h3>
                        <h6>&nbsp;&nbsp;&nbsp;&nbsp;20.09.29</h6>
                                
                        </div>
                        <br>
					
					<hr>

				<br><br>

				<div align="center">
                    <table>
                        <tr>
                            <td width=""><span>총 게시글 수 &nbsp;&nbsp;&nbsp;<b
                                    style="color: red">5</b>개
                            </span></td>
                            <td width="720px;">
                                <div align="center">
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
                            </td>
                        
                        </tr>
                    </table>
                </div>
                
                <br><br>
    
            </div>
    
    
        </div>
        <!-- /.container-fluid -->
    
        <%@ include file="../../common/footer.jsp"%>
    </body>
    </html>