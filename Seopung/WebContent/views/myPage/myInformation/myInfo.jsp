<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보조회 및 수정</title>
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
       
        #phone{
            width:50px;
        }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	
	<div class="myContent">
	
		<div class="personal_Info" >
        
            <h1>&nbsp;&nbsp;&nbsp;개인정보 조회 및 변경</h1>
            <hr>
        <div class="myInfo">
        <form action="" method="POST">
            <button type="submit">수정하기</button>
            <button type="reset">취소</button> <br><br>
        
            <div class="infoPoto">
                <img src="../../../resources/images/회원.jpg" alt="">
                <br><br>
                <p style="font-size: 12px;">1MB이하의 JPEG파일만 등록가능합니다.</p>
                <div id="myPageButton" align="center">
                    <button type="submit">파일등록</button>
                    <button type="submit" >삭제</button>
                </div>
            </div>
            <div class="changeInfo">
                <p>USERID01</p><br>
                <label for="">닉네임</label>
                <input type="text" placeholder="닉네임을 입력하세요"> <br><br>

                <label for="">* 비밀번호</label>
                <input type="password" placeholder="비밀번호를 입력하세요"> <br><br>

                <label for="">* 비밀번호 확인</label>
                <input type="password" placeholder="다시입력해주세요"> <br><br>

                <label for="">* 이름</label>
                <input type="text" placeholder="이름을 입력하세요"> <br><br>

                <label for="">* 전화번호</label>
                <input type="text" list="phone" name="phone" style="width: 50px;">
                <datalist id="phone">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="019">019</option>
                    <option value="016">016</option>
                    <option value="070">070</option>
                </datalist> -
                <input type="text" id="phone"> - <input type="text" id="phone"> <br><br>

                <label for="">* 이메일</label>
                <input type="email" placeholder="@포함해서 적어주세요">                
                
                <button>인증하기</button> <br><br>

                <label>* 이메일 인증</label>
                <input type="text">
                <button>확인</button>
                <div><br></div>
            </div>
            <textarea name="introduction" id="introduction" cols="100" rows="8" placeholder="자기소개 칸 입니다." style="resize: none;"></textarea>
        </form>
        </div>
            
    </div>
	
	</div>
	</div>
</body>
</html>