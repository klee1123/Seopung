<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.userInquiry.model.vo.Inquiry" %>
<!-- Inquiry iq = (Inquiry)request.getAttribute("iq");
   int inquireNo = iq.getInquireNo();  --> <!-- 오류 -->

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
	width: 900px;
	height: 1000px;
	margin: auto;
	margin-top: 120px;
	font-family: 'Noto Sans KR', sans-serif; 
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

</style>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>

<body>
	<%@include file="../../common/menubar.jsp"%>
	<div class="wrap">

        <h2>&nbsp;고객센터</h2><br>

        <h3 style="display:inline;">
        <a style= "color : black" href="<%=contextPath%>/list.no?currentPage=1"> &nbsp;공지사항</h3>
        &emsp;&emsp;&emsp;&emsp;
        <h3 style="display:inline;">1:1문의</h3>

        <hr>

        <h3>서풍에 문의하기</h3>

		        이메일 주소와 함께 문의를 남겨주세요. 영업일 기준 2일 내에 답변 드리겠습니다.<br>
		        특정 사용자의 동행에 관한 질문은 해당 사용자에게 문의하기를 이용해 주세요.<br><br>

        <br>
        
        <form action="<%= contextPath %>/insert.iq" method="post" 
        	  id="userInquiryForm" onsubmit="return validateForm()">
        	  
        	<!-- <input type="hidden" name="inquireNo" value="   =inquireNo  "> -->
        	
        	
        <h4>문의 제목</h4>
        	<!-- 문의 제목 입력 값 넘기기 -->
            <input type="text" id="title" name="title" 
            	   class="form-control" 
            	   required>
        	<br>
        	
        <h4>문의유형</h4>
        	<!-- 문의유형 선택 값 넘기기 -->		  
            <label for="type"></label>
            <select type="" name="inquiryType" id="inquiryType"
            		class="form-control">
                <!--<option value="문의 내용을 선택하세요">문의 내용을 선택하세요</option>-->
                <option value="서비스이용문의">서비스이용문의</option>
                <option value="계정문의">계정문의</option>
                <option value="이벤트문의">이벤트문의</option>
                <option value="시스템문의">시스템문의</option>
                <option value="탈퇴문의">탈퇴문의</option>
                <option value="불법이용자문의">불법이용자문의</option>
                <option value="버그제보">버그제보</option>
                <option value="건의">건의</option>
                <option value="기타문의">기타문의</option>
                </select>
			<br>
			<br>
		<% if(loginUser == null) {%>
        
        <h4>이메일 주소</h4>
     		<input type="hidden" name="sep" value="비회원">
     		<!-- 이메일 주소 입력 값 넘기기 -->
            <label for="email"></label>
            <input type="email" id="userEmail" name="userEmail" 
            	   class="form-control" required>
        
        <%} else {%>
        	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
        	<input type="hidden" name="sep" value="회원">
        
        <%} %>
		<br>
		<br>
		
        <h4>문의내용</h4>
     
     		<!-- 문의내용 입력 값 넘기기 -->
            <textarea cols="60" rows="7" style="resize: none;" 
            		  type="text" id="content" name="content" 
					  class="form-control"      
            		  required></textarea>
        	<br><br>
        	
   		<!-- 개인정보수집 동의 값(넘길 필요 없음) -->
        <input type="checkbox" id="userPrivacy" name="userPrivacy" value="" 
        	   class="form-control" required>
        <label for="privacy"><h4 style="display:inline;">개인 정보 수집 및 이용에 동의합니다.</h4></label>
   
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