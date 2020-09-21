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
        #join>fieldset{
            width:500px;
            height:700px;
            border: 1px solid lightgrey; 
            margin:auto;
            margin-top:20px; 
        }
        #join>span{
            font-size:32px;
        }
        #join .head{
            margin-top:40px;
            line-height:15px;
            font-size:25px;
        }
        .head2{
            margin-right:260px;
            line-height:1px;
            font-size:11px;
            color:grey;
        }
         #join2{
            line-height:50px;
            font-size:16px;
        }
        input[type=text], input[type=password], input[type=email]{
            width:250px;
            height:25px;
        }
       
        table+button[type=submit], table+button+[type=button]{
            margin-top:40px;
            width:200px;
            height:40px;
            border:none;
            background:dimgray;
            color:white;
            font-weight:bold;
        }
        
        table button{
            border:none;
            width:96px;
            height:25px;
            border-radius:5px;
            background:lightgrey;
            font-weight:bold;
            font-size:13px;
            line-height:20px;
        }

        input:placeholder{
            color:lightgrey;
            font-size:10px;
        }
    #join2 th{
        width:120px;
        text-align:left;
        color:grey;
    } 

 </style>
</head>
<body>
	<%@include file = "../common/menubar.jsp" %>
	<div class="outer"></div>

        <form align="center" action="" id="join">
            <span>Seopung</span>
            <fieldset >
                <div class="head">서풍 회원가입 정보를 입력해주세요.</div><br><br>
                <div class="head2">
                    <p>*는 필수 입력사항입니다.</p>
                </div>
                <br>
                <form action="">
                    
                    <table id="join2">
                        <tr>
                            <th>&nbsp;&nbsp;*아이디</th>
                            <td><input type="text" name="userId" required placeholder="&nbsp;4 ~ 12자 영문 대ㆍ소문자, 숫자"></td>
                            <td><button>중복체크</button></td>
                        </tr>
                        <tr>
                            <th>&nbsp;&nbsp;*비밀번호</th>
                            <td><input type="password" name="userPwd" required placeholder="&nbsp;8 ~ 15자 영문 대ㆍ소문자, 숫자, 특수문자"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>&nbsp;&nbsp;*비밀번호 확인</th>
                            <td><input type="password" name="checkPwd" required  placeholder="&nbsp;&nbsp; 비밀번호 확인"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width:109px;" align="left">&nbsp;&nbsp;*성명</th>
                            <td><input type="text" name="userName" required  placeholder="&nbsp이름"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width:109px;" align="left">&nbsp;&nbsp;*닉네임</th>
                            <td><input type="text" name="userNick" required  placeholder="&nbsp 영문, 숫자, 한글 포함 10자"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="width:109px;" align="left">&nbsp;&nbsp;*생년월일</th>
                            <td><input type="text" name="userBirth" required  placeholder="&nbsp생년월일8자리(ex19940322)"></td>
                            <td>
                                <input type="radio" name="gender" id=g1> <label for="g1">남자</label>
                                <input type="radio" name="gender" id=g2> <label for="g2">여자</label>
                            </td>
                        </tr>
                      
                        <tr>
                            <th style="width:109px;" align="left">&nbsp;&nbsp;*이메일</th>
                            <td><input type="email" name="email" required placeholder="&nbsp이메일"></td>
                            <td><button>인증번호 발송</button></td>
                        </tr>
                        <tr>
                            <th style="width:109px;" align="left">&nbsp;&nbsp;*이메일 인증</th>
                            <td><input type="text" required placeholder="&nbsp인증번호 입력"></td>
                            <td></td>
                        </tr>
                    </table>
                    
                    <button type="submit">회원기입 완료</button>
                    <button type="button">취소</button>
                </fieldset>
            </form>
        </div>
</body>
</html>