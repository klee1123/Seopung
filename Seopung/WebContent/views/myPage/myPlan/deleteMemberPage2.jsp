<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #deleteMemImg{float: left;}
        #delete_body{
            margin-left: 90px;
            width: 1000px;
        }
        #tb_1,#tb_2{
            border-top: 1px solid orange;
            border-bottom: 1px solid orange;
            width:500px;
        }
        .deleteMem p{font-size: 16px;}
        .deleteMem b{color:black;font-size:18px;}
       
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	<div class="myContent">
    <hr>
    <div class="deleteMem">
    <div class="delete_header">
        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20110119_243%2Fa_215384_1295400394871daYn1_jpg%2F%25B1%25F8.31_a_215384.jpg&type=sc960_832" alt="" width="50px" height="60px" id="deleteMemImg">
        
            <p style="font-size: 30px;font-weight: 500;" ><label>서풍</label> 탈퇴안내</p>
            <p> &gt; 회원탈퇴를 진행하기 전에 안내사항을 꼭 확인해 주세요.</p>
    </div>
    <br>
    <!-- 삭제되는 글 안내문 -->
    <div id="delete_body">
        <form action="" method="POST">
            <p>
            <b> &gt; 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</b> <br>
            - 회원정보 및 메세지, 일정, 스크랩은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>
            - 삭제되는 내용을 꼭 확인해주시기 바랍니다.</p> <br>
            <!-- 지워지는 이용기록들 -->
            <table id="tb_1">
                <tr>
                    <th>회원정보</th>
                    <th>아이디, 닉네임, 이름, 핸드폰번호, 생년월일 삭제</th>
                </tr>
                <tr>
                    <th>메시지</th>
                    <th>보낸 메시지, 받은 메시지 모두 삭제 </th>
                </tr>
                <tr>
                    <th>일정</th>
                    <th>일정만들기로 만들었던 일정 모두 삭제 </th>
                </tr>
                <tr>
                    <th>스크랩</th>
                    <th>개인적인 스크랩  모두 삭제 </th>
                </tr>
            </table>
            <br>
            <!-- 삭제되지 않는 게시글 안내 -->
            <p>
            <b> &gt; 탈퇴 후 공개 게시글은 삭제되지 않습니다.</b> <br>
            - 커뮤니티 게시판에 등록한 모든 게시물과 댓글은 탈퇴 후에도 유지됩니다. <br>
            - 해당 게시물, 댓글에 대한 삭제를 원하는 경우 반드시 탈퇴 전에 삭제해 주세요.</p> <br>
            <!-- 지워지지않는 게시글 -->
            <table id="tb_2">
                <tr>
                    <th>커뮤니티</th>
                    <th>커뮤니티 내 쓴 게시물, 댓글</th>
                </tr>
            </table>
            <br>
            <div align="right"; style="margin-right: 150px;">
            <button align="center" class="btn btn-secondary btn-sm">탈퇴하기</button>
            </div>
        </form>
    </div>
    </div>
	
	</div>
	</div>
</body>
</html>