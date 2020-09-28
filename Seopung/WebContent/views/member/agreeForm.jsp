<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top:120px;
    }
    #joinCheck>fieldset{
        width:480px;
        height:700px;
        border: 1px solid lightgrey; 
        margin:auto;
        margin-top:20px; 
    }
    #joinCheck>span{
        font-size:32px;
    }
    #joinCheck .head{
        margin-top:25px;
        line-height:15px;
        font-size:25px;
    }
    #joinCheck .body{
        color:black;
        font-size:16px;
        font-weight:bold;
    }
    
    
    input[type=checkbox]{
        width:17px;
        height:17px;
        cursor:pointer;
    }
    .foot>label{
        font-size:16px;
        line-height:45px;
    }
    table{
        text-align:right;
    }
     .foot>a{
         float:right;
         text-decoration:none;
         color:grey;
         font-size:30px;
     } 
    #agree{
        margin-top:px;
        width:330px;
        height:40px;
        border:none;
        background:dimgray;
        color:white;
    }
    
    
    
</style>
</head>
<body>
	<%@include file = "../common/menubar.jsp" %>
	 <div class="outer">
        <form align="center" action="<%=contextPath %>/enrollForm.me" id="joinCheck">
            <span>Seopung</span>
            <fieldset id="agreeForm" >
                <div class="head" style="margin-right:160px;">서풍 회원가입</div>
                <div class="head">서비스 약관에 동의해주세요.</div><br><br>
                <div class="body" align="left" style="margin-left:75px;" >    
                    <input type="checkbox" id="allCheck" name="allCheck">
                    <label for="allCheck">모두 동의합니다.</label>
                    <p style="font-size:12px; color:grey;">전체동의는 필수 및 선택정보에 대한 동의도 포함되어 있<br>
                        으며, 개별적으로도 동의를 선택하실 수 있습니다. 선택항<br>
                        목에 대한 동의를 거부하시는 경우에도 서비스는 이용이<br> 가능합니다.</p>                
                    </div>
                    <br><br>
                    
                    <div class="foot" align="left" style="margin-left:75px;">
                        <input type="checkbox" id="c1" name="c1" required> 
                        <label for="c1">[필수]만 14세 이상입니다.</label> 
                        <a href="" >></a><br>
                        <input type="checkbox" id="c2" name="c2" required> 
                        <label for="c2">[필수] 서풍계정 약관</label> 
                        <a href="">></a><br>
                        <input type="checkbox" id="c3" name="c3"> 
                        <label for="c3">[선택] 서풍 알림메시지 수신</label>
                        <a href="">></a><br>
                        <input type="checkbox" id="c4" name="c4" required> 
                        <label for="c4">[필수] 개인정보 수집 및 이용 동의</label>
                        <a href="">></a><br>
                        <input type="checkbox" id="c5" name="c5"> 
                        <label for="c5">[선택] 위치정보 수집 및 이용 동의</label>
                        <a href="">></a><br>
                        <input type="checkbox" id="c6" name="c6"> 
                        <label for="c6">[선택] 프로필 정보 추가 수집 동의</label>
                        <a href="">></a><br>
                    </div>
                    
                    <button id="agree" type="submit" >동의합니다</button>
                </fieldset>
            </form>
    </div>
    <script>
    	$(function(){
    		
    		if($("input:checkbox[id='allCheck']").click(function(){
    			$(".foot>input[type='checkbox']").attr("checked", true);
    			agree_checked();
    			
    		}));
    		
    		
    		
    	});
    	$(".foot").change(function(){
    		agree_checked();
    	});
    		function agree_checked(){
    			if($("#c4").prop("checked") && $("#c2").prop("checked") && $("#c1").prop("checked")){
    				console.log("체크");
    				$("#agree").removeAttr("disabled");
    			}else{
    				console.log("체크안됨");
    			}
    		}
    		
		   
    </script>
</body>
</html>