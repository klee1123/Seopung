<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보조회 및 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
<style>
        
        .myInfo{
            width:1000px;
            height:800px;
            margin-left: 20px;
        } 
        .infoPoto{
            width: 30%;
            float: left;
        }
        .changeInfo{
            float: left;
            width:70%;
        }
        .infoPoto>img{
            width: 150px;
            height: 150px;
            padding: 10px;
            margin-left:20px;
        }
        
        #infoTable tr{
           height:50px;
       }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	
	<div class="myContent">
	
		<div class="personal_Info">
        
            <h1 style="font-weight: 900; font-size: 30px;">&nbsp;&nbsp;&nbsp;개인정보 조회 및 변경</h1>
            <hr>
        <div class="myInfo">
        <form action="" method="POST">
            <button type="submit" class="btn btn-secondary btn-sm"> 수정</button>
             <br><br>
        
            <div class="infoPoto">
                <img src="../../../resources/images/회원.jpg" alt="">
                <br><br>
                <p style="font-size: 12px;">1MB이하의 JPEG파일만 등록가능합니다.</p>
                <div id="myPageButton" align="center">
                    <button type="submit" class="btn btn-secondary btn-sm">파일등록</button>
                    <button type="submit" class="btn btn-secondary btn-sm">삭제</button>
                </div>
            </div>
            <div class="changeInfo">
                
            <table id="infoTable">
                <tr>
                    <th align="left" width="200px">아이디</th>
                    <td><span>USERID01 </span></td>
                </tr>
                <tr>
                    <th align="left" width="200px">이름</th>
                    <td><span>홍길동 </span></td>
                    
                </tr>
                <tr>
                    <th align="left">닉네임</th>
                    <td><span>홍길홍길 <button type="button" data-toggle="collapse" data-target="#nickCh" class="btn btn-secondary btn-sm"> 수정</button></span></td>
                
                    <tr id="nickCh" class="collapse" >
                        <th>변경할 닉네임</th>
                        <td><input type="text"><button type="button" id="nickChSuccess"  class="btn btn-secondary btn-sm">중복확인</button></td>
                    </tr>
                </tr>
                <tr>
                    <th align="left">비밀번호</th>
                    <td><button  type="button" class="btn btn-secondary btn-sm"  data-toggle="collapse" data-target="#pwdCh">변경</button></td>
                    <tr id="pwdCh" class="collapse" >
                        <th>현재 비밀번호</th>
                        <td><input type="text"></td>
                    </tr><tr id="pwdCh" class="collapse" >
                        <th>변경할 비밀번호</th>
                        <td><input type="text"></td>
                    </tr><tr id="pwdCh" class="collapse" >
                        <th>비밀번호 확인</th>
                        <td><input type="text"><button type="button" class="btn btn-secondary btn-sm">확인</button></td>
                    </tr>
                </tr>
                <tr>
                    <th align="left">이메일</th>
                    <td><span>hong@gmail.com <button type="button" class="btn btn-secondary btn-sm" data-toggle="collapse" data-target="#emailCh"> 수정</button></span></td>
                    <tr id="emailCh" class="collapse" >
                        <th>변경할 이메일</th>
                        <td><input type="email"><button type="button" class="btn btn-secondary btn-sm">인증</button></td>
                    </tr>
                    <tr id="emailCh" class="collapse" >
                        <th>인증확인</th>
                        <td><input type="text"><button type="button" class="btn btn-secondary btn-sm">확인</button></td>
                    </tr>
                </tr>
                <tr>
                    <th align="left">생년월일</th>
                    <td><span>2020년 07월 01일</span></td>
                </tr>
                
            </table>
            <br><br>
            </div>
            
            <textarea name="introduction" cols="80" rows="8"style="resize: none;">자기소개 : </textarea>
         
        </form>
        </div>
            
    </div>
	
	</div>
	</div>
</body>
</html>