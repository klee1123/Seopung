<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<style>
		
        .myOuter{
            width:1400px;
            height:800px;
            margin: auto;
            margin-top: 110px;
        }
        .myOuter div{box-sizing: border-box;}
        .myOuter>div{height:100%}
        .menubar{
            width:20%;
            float:left;
            
        }
        .menubar>div{
            width:90%;
            height:80%;
            border:1px solid gray;
            
        }

        .myContent{ width:80%; float:left}
        #sidenavi{
            list-style-type:none;
            font-size: 17px;
            margin-left:30px;
        }
        
        #sidenavi>li a{
            color: black;
            text-decoration: none;
            font-size: 18px;
            font-family: 'Nanum Gothic', sans-serif;
        }
        #sidenavi>li>ul li{
            list-style-type:none;
            font-size:14px;
            padding: 2px;
            margin-left:15px;
        }
        #sidenavi>li>ul a{
            text-decoration:none;
            color:black;
            font-size: 16px;
            font-family: 'Nanum Gothic', sans-serif;
        }
        #sidenavi a:hover{
            color:lightgray;
        }
</style>
</head>
<body>
	<div class="myOuter">
        
        <div class="menubar">
            <div>
            <ul id="sidenavi">
                <br><br>
                <li ><a href="../myInformation/myInfo.jsp">개인정보 조회 및 변경</a></li> <br>
                <li ><a href="../myPlan/myPlanList.jsp">일정관리</a></li><br>
    
                <li>동행인관리
                    <ul>
                        <li><a href="../../accompany/accompanyRequest/accomRequest.jsp" >신청 온 동행인</a></li>
                        <li><a href="">신청 한 동행인</a></li>
                        <li><a href="../../accompany/accompanyList/accomList.jsp">동행목록</a></li>
                    </ul>
                </li> <br>
                
                <li>스크랩
                    <ul>
                        <li><a href="../scrap/scrapPlan.jsp">일정</a></li>
                        <li><a href="../scrap/scrapCommunity.jsp">커뮤니티</a></li>
                    </ul>
                </li> <br>
    
                <li>메시지함
                    <ul>
                        <li><a href="">메세지보내기</a></li>
                        <li><a href="">받은 메세지함</a></li>
                        <li><a href="">보낸 메세지함</a></li>
                    </ul>
                </li><br>
                <li><a href="../myPlan/inquirePage.jsp">1:1 문의</a></li> <br>
                <li><a href="../myPlan/deleteMemberPage.jsp">회원탈퇴</a></li> <br>
    
            </ul>
            </div>
        </div>
    
</body>
</html>