<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

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

        <h2>&nbsp;고객센터</h2><br>

        <h3 style="display:inline;">&nbsp;공지사항</h3>
        &emsp;&emsp;&emsp;&emsp;
        <h3 style="display:inline;">1:1문의</h3>

        <hr>

        <h3>서풍에 문의하기</h3>

        이메일 주소와 함께 문의를 남겨주세요. 영업일 기준 2일 내에 답변 드리겠습니다.<br>
        특정 사용자의 동행에 관한 질문은 해당 사용자에게 문의하기를 이용해 주세요.<br><br>

        
        <h4>문의유형</h4>
        <form action="">
            <label for="type""></label>
            <select name="type" id="type">
                <option value="question">문의 내용을 선택하세요.</option>
                <option value="service"">서비스이용문의</option>
                <option value="account">계정문의</option>
                <option value="event">이벤트문의</option>
                <option value="system">시스템문의</option>
                <option value="secession">탈퇴문의</option>
                <option value="illegal">불법이용자문의</option>
                <option value="bug">버그제보</option>
                <option value="tendinous">건의</option>
                <option value="etc">기타문의</option>
                </select>
        <br>
		<% if(loginUser == null) {%>
        
        <h4>이메일 주소</h4>
     
            <label for="email"></label>
            <input type="email" id="email" name="email" required>
        
        <%} %>
        <br>
		
        <h4>문의내용</h4>
     
            <textarea cols="60" rows="7" style="resize: none;" required></textarea>
      
        <br><br>
        
            <input id="privacy" type="checkbox" name="privacy" value="" required>
            <label for="privacy"><h4 style="display:inline;">개인 정보 수집 및  이용에 동의합니다.</h4></label>
       
        <br><br><br><br>

        <div align="center">
            <button type="submit" class="btn btn-primary">제출하기</button>
        </div>        
        </form>

    </div>
    <!-- /.container-fluid -->
    
    <%@ include file="../../common/footer.jsp"%>
    </body>
    </html>