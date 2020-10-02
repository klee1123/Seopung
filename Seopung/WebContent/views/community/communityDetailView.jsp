<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.community.model.vo.*, java.text.SimpleDateFormat" %>

 <%
 	Community c = (Community)request.getAttribute("c");
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #content{
        	margin-top:150px;
            width:900px;
            margin:auto;
        }
        button{
            cursor: pointer;
        }
        #content>div{
            box-sizing: border-box;
            /* border:1px solid black; */
            width: 100%;
        }
        #content_1{height:50px; background:lightgrey;}
        #content_2{height:25px;}
        #content_3{height:600px;} /*임시*/
        #content_4{height:20px; padding-left:10px}
        #content_5{height:75px;}
        #content_7{height:40px;background:lightgrey;}

        #content_1>div{
            display: table-cell;
            height:100%;
            padding: 10px;
            line-height:40px;
        }
        #content_2>div{
            display: table-cell;
            height:100%;
            padding-left: 10px;
            padding-right: 10px;
            line-height: 30px; 
        }
        #content_3{
            padding: 10px;
        }
        #content_7>button{
            width:100%;
            height:100%;
            border:none;
            background:none;
        }
        
    </style>
</head>
<body>
	<%@include file = "../common/menubar.jsp" %>
	 <br>
    
    <div id="content">

        <div id="content_1" style="margin-top:150px;">
            <div style="width:730px; font-size:18px;"><%=c.getTitle() %></div>
            <div style="text-align:right;"><%=c.getEnroll() %></div>
            
        </div>

        <div id="content_2">
            <div style="width:610px;"><%=c.getUserNo() %></div>
            <div>조회수 <%=c.getCount() %></div>
            <div>추천수 <%=c.getRecommend() %></div>
            <div>스크랩수 <%=c.getScrap() %></div>
        </div>

        <hr>

        <div id="content_3">
            <%=c.getContent() %>
        </div>
        <%if(loginUser != null && loginUser.getUserNo() == c.getUserNo1()){  %>
        <div align="center">
				<button  class="btn btn-secondary" onclick="location.href='<%=contextPath%>/updateForm.co?cno=<%=c.getComNo()%>'">수정</button>
				<button class="btn btn-danger" onclick="del();">삭제</button>
			</div>
        <%} %>
          <%if(loginUser != null && loginUser.getUserNo() != c.getUserNo1()){  %>
        <div align="center">
				<button  class="btn btn-secondary" onclick="location.href='<%=contextPath%>/recommend.co?cno=<%=c.getComNo()%>'">추천</button>
				<button class="btn btn-secondary" onclick="del();">스크랩</button>
			</div>
        <%} %>
        <div id="content_4">
            댓글 2
        </div>

        <hr>
        
        <div id="content_5" align="center">
            <table>
                <tr>
                    <td>
                        <img width="60px" src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg" alt="">
                    </td>
                    <td width="700px;">
                        <textarea name="" id="" cols="90" rows="4" style="resize: none;"></textarea>
                    </td>
                    <td>
                        <button>등록</button>
                    </td>
                </tr>
            </table>
        </div>

        <hr>

        <div id="content_6" align="center">
            
            <table>
                <tr>
                    <td>
                        <img width="60px" src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg" alt="">  
                    </td>
                    <td width="700px">
                        닉네임1 - 2020.09.09 22:05<br>닉네임1의 댓글내용
                    </td>
                    <td>
                        <button style="border:none; background:none">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img width="60px" src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg" alt="">  
                    </td>
                    <td>
                        닉네임2 - 2020.09.09 22:10<br>닉네임2의 댓글내용
                    </td>
                    <td>
                        <button style="border:none; background:none">삭제</button>
                    </td>
                </tr>
            </table>            
        </div>

        <div id="content_7" align="center">
            <button>댓글 전체보기</button>
        </div>

    </div>
	<script>
		function del(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="<%=contextPath%>/delete.co?cno=<%=c.getComNo()%>"
			}else{
				
			}
		}
	</script>
    <br>
    <br>
</body>
</html>