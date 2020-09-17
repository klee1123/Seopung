<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            width:1400px;
            height:800px;
            margin: auto;
        }
        .outer div{
            box-sizing: border-box;
        }
        .outer>div{height:100%}
        .menubar{
            width:20%;
            float:left;
            
        }
        .menubar>div{
            background:#fec104;
            width:90%;
            height:90%;
        }

        .content{ width:80%; float:left}
        #sidenavi{
            list-style-type:none;
            font-size: 18px;
            
        }
        
        #sidenavi>li>a{
            color: black;
            text-decoration: none;
        }
        #sidenavi>li>ul li{
            list-style-type:none;
            font-size:16px;
            padding: 2px;
        }
        #sidenavi>li>ul a{
            text-decoration:none;
            color:black;
        }
        #sidenavi a:hover{
            color:white;
        }
</style>
</head>
<body>
	<div class="outer">
        
        <div class="menubar">
            <div class="color">
            <ul id="sidenavi">
                <br><br><br><br>
                <li><a href="">개인정보 조회 및 변경</a></li> <br>
                <li><a href="">일정관리</a></li><br>
    
                <li>동행인관리
                    <ul>
                        <li><a href="">신청 온 동행인</a></li>
                        <li><a href="">신청 한 동행인</a></li>
                        <li><a href="">동행목록</a></li>
                    </ul>
                </li> <br>
                
                <li>스크랩
                    <ul>
                        <li><a href="">일정</a></li>
                        <li><a href="">커뮤니티</a></li>
                    </ul>
                </li> <br>
    
                <li>메시지함
                    <ul>
                        <li><a href="">메세지보내기</a></li>
                        <li><a href="">받은 메세지함</a></li>
                        <li><a href="">보낸 메세지함</a></li>
                    </ul>
                </li><br>
                <li><a href="">1:1 문의</a></li> <br>
                <li><a href="">회원탈퇴</a></li> <br>
    
            </ul>
            </div>
        </div>
    
</body>
</html>