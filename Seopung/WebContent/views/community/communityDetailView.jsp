<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.community.model.vo.*, java.text.SimpleDateFormat" %>

 <%
 	Community c = (Community)request.getAttribute("c");
 	int count = (int)request.getAttribute("count");
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
        <%if(loginUser != null && loginUser.getUserNo() == c.getUserNo1() && loginUser.getCategory() == 1){  %>
        <div align="center">
				<button  class="btn btn-secondary" onclick="location.href='<%=contextPath%>/updateForm.co?cno=<%=c.getComNo()%>'">수정</button>
				<button class="btn btn-danger" onclick="del();">삭제</button>
			</div>
        <%} %>
          <%if(loginUser != null && loginUser.getUserNo() != c.getUserNo1()&& loginUser.getCategory() == 1){  %>
        <div align="center">
				<button  class="btn btn-secondary" onclick="location.href='<%=contextPath%>/recommend.co?cno=<%=c.getComNo()%>'">추천</button>
				<button class="btn btn-secondary" onclick="location.href='<%=contextPath%>/scrap.co?cno=<%=c.getComNo()%>'">스크랩</button>
				<button class="btn btn-danger" onclick="location.href='<%=contextPath%>/scrap.co?cno=<%=c.getComNo()%>'">신고</button>
			</div>
        <%} %>
        <div id="content_4">
        </div>
          

        <hr>
        
        <div id="content_5" align="center">
            <table>
            	<%if(loginUser == null){ %>
            	<tr>
                    <td>
                        <img width="60px" src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg" alt="">
                    </td>
                    <td width="700px;">
                        <textarea name="" id="" cols="90" rows="4" style="resize: none;" readonly>로그인후 이용 가능한 서비스입니다.</textarea>
                    </td>
             
                </tr>
            	<%}else{ %>
                <tr>
                    <td>
                        <img width="60px" src="https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg" alt="">
                    </td>
                    <td width="700px;">
                        <textarea name="replyContent" id="replyContent" cols="90" rows="4" style="resize: none;"></textarea>
                    </td>
                    <td>
                        <button type="button" class="btn btn-secondary" onclick="addReply();">등록</button>
                    </td>
                </tr>
                <%} %>
            </table>
        </div>

        <hr>

			
			<div id="content_6" align="center">
				<!--  
				<table>
					<tr>
						<td width="60"><img width="45px" class="rounded-circle"
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
						<td>닉네임 <br> 2020.09.09 22:05
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" width="800">것이 이상이 찾아다녀도, 얼음 주음 주는 품으며, 찾아 피가
							것이다. 낙원을 얼마나 무엇을 살 인간이 같지 되려니와, 그와 살았으며, 아니다. 있는 새 천지는 못할 쓸쓸한 밥을
							어디 뿐이다. 없는 인간의 청춘의 못할 같이 청춘의 그들은 피가 우리 것이다. 곳이 너의 새가 불러 보이는 약동하다.
							보이는 약동하다.</td>
						<td align="center">
							<button style="border: none; background: none">삭제</button>
						</td>
					</tr>
				</table>
				-->
				
			</div>

			
			
			<div align="center" id="paging">

			</div>

			<br> <br> <br>

			

			<br> <br>

		</div>
<%if(loginUser != null){ %>		
	<script>
		

		function del(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="<%=contextPath%>/delete.co?cno=<%=c.getComNo()%>"
			}else{
				
			}
		}
		
		$(function(){
			selectReplyList(1);
			
			
		});
		// 해당 게시글에 댓글 작성용 ajax
		function addReply(){
			$.ajax({
				url:"<%=contextPath%>/rinsert.co",
				type:"get",
				data:{
					content:$("#replyContent").val(),
					cno:<%=c.getComNo()%>
					
				},
				success:function(result){
					
					if(result > 0){
						selectReplyList(1);
						$("#replyContent").val("");
					}
				},
				error:function(){
					console.log("댓글작성용ajax 통신 실패");
				}
			});
		}
		
		function selectReplyList(cPage){
			$.ajax({
				url:"<%=contextPath%>/rlist.co",
				type:"get",
				data:{cno:<%=c.getComNo()%>,
				      currentPage:cPage
				      
				},
				success:function(result){
					console.log("통신성공");
					if(result.list.length > 0){
						var comment="";
	       				 for(var i in result.list){
						comment += "<table>" +
	    				"<tr>" +
							"<td width='60'>";
			 
			 if(result.list[i].profile == "null"){
				 comment += "<img width='45px' height='45px' class='rounded-circle' src='https://ucanr.edu/sb3/display_2018/images/default-user.png'>";
			 }else{
				 comment += "<img width='45px' height='45px' class='rounded-circle' src='<%=contextPath%>/" + result.list[i].profile + "'>";
			 }
			 
			 comment +=         "</td>" +
							"<td>" + result.list[i].replyWriter +"<button style=' border: none; color:red; background: none;' >신고</button> <br>" + result.list[i].createDate +
							"</td>" +
							"<td>" +  "</td>" + 
						"</tr>" + 
						"<tr>" + 
							"<td colspan='2' width='800'>" + 
								result.list[i].replyContent +
							"</td>"; 
							if(<%=loginUser.getUserNo()%> == result.list[i].userNo1){
					comment +=			
							"<td align='center'>"+
								"<button style='border: none; background: none;' onclick='confirmDeleteComment(" + result.list[i].replyNo + ");'>삭제</button>" +
							"</td>";
							}else{
					comment +=			
						"<td align='center'>"+
							"<div style='border: none; background: none;' readonly >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;</div>" +
						"</td>";
							}	
						
						comment +=		
						"</tr>" +
					"</table>";
							
				}
	       				var $listCount = result.pi.listCount;     	       					
 	       				var $currentPage = result.pi.currentPage;
                        var $startPage = result.pi.startPage;
                        var $endPage = result.pi.endPage;
                        var $maxPage = result.pi.maxPage;
                        
                        var $btns = "";
                        for(var $p = $startPage; $p <= $endPage; $p++ ){
                           
                           $btns += "<button type='button' onclick='selectReplyList(" + $p + ");' style='border: none; background: none'>" + $p + "</button>";
                        }
                        
                        if(cPage != "1"){
                            var $prevBtn = "<button type='button' onclick='selectReplyList(" + ($currentPage - 1) + ");' class='btn btn-outline-secondary btn-sm'>" + "&lt;" + "</button>";
                        }else{
                        	var $prevBtn = "";
                        }
                        
                        if(cPage != $maxPage){
                            var $nextBtn = "<button type='button' onclick='selectReplyList(" + ($currentPage + 1) + ");' class='btn btn-outline-secondary btn-sm'>" + "&gt;" + "</button>";
                        }else{
                        	var $nextBtn = "";
                        }
                        	
                         
                        var $buttons = $prevBtn + $btns + $nextBtn ;
                        
	       				$("#content_4").html("댓글 " + $listCount);
 	       				$("#content_6").html(comment);
                        
                        $("#paging").html($buttons);
                        
                     }else{
		       				$("#content_4").html("댓글 0");
                        $("#content_6").html('작성된 댓글이 없습니다.');
                     }

       				
	       		},error:function(){
	       				console.log("댓글 리스트 조회용 ajax 통신 실패");
	       		}
			});
		}
		function confirmDeleteComment(commentNo){
       		if(confirm("댓글을 삭제하시겠습니까?")){
       			deleteComment(commentNo);
       		}
       	}
       	
       	// 댓글 삭제용 ajax
       	function deleteComment(commentNo){
       		
       		$.ajax({
       			url:"<%=contextPath%>/adminPage/delete.rco",
       			type:"post",
       			data:{"commentNo":commentNo},
       			success:function(result){
       				
       				if(result>0){
       					selectReplyList(1);
       					
       				}
       				
       			}, error:function(){
       				console.log("ajax 통신 실패");
       			}
       		});
       	}
	</script>
	<%}else{ %>
	<script>
		

		function del(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="<%=contextPath%>/delete.co?cno=<%=c.getComNo()%>"
			}else{
				
			}
		}
		
		$(function(){
			selectReplyList(1);
			
			
		});
		// 해당 게시글에 댓글 작성용 ajax
		function addReply(){
			$.ajax({
				url:"<%=contextPath%>/rinsert.co",
				type:"get",
				data:{
					content:$("#replyContent").val(),
					cno:<%=c.getComNo()%>
					
				},
				success:function(result){
					
					if(result > 0){
						selectReplyList(1);
						$("#replyContent").val("");
					}
				},
				error:function(){
					console.log("댓글작성용ajax 통신 실패");
				}
			});
		}
		
		function selectReplyList(cPage){
			$.ajax({
				url:"<%=contextPath%>/rlist.co",
				type:"get",
				data:{cno:<%=c.getComNo()%>,
				      currentPage:cPage
				      
				},
				success:function(result){
					console.log("통신성공");
					if(result.list.length > 0){
						var comment="";
	       				 for(var i in result.list){
						comment += "<table>" +
	    				"<tr>" +
							"<td width='60'>";
			 
			 if(result.list[i].profile == "null"){
				 comment += "<img width='45px' height='45px' class='rounded-circle' src='https://ucanr.edu/sb3/display_2018/images/default-user.png'>";
			 }else{
				 comment += "<img width='45px' height='45px' class='rounded-circle' src='<%=contextPath%>/" + result.list[i].profile + "'>";
			 }
			 
			 comment +=         "</td>" +
							"<td>" + result.list[i].replyWriter + "<br>" + result.list[i].createDate +
							"</td>" +
							"<td>" +  "</td>" + 
						"</tr>" + 
						"<tr>" + 
							"<td colspan='2' width='800'>" + 
								result.list[i].replyContent +
							"</td>"; 
									
							
			
						comment +=		
						"</tr>" +
					"</table>";
							
				}
	       				var $listCount = result.pi.listCount;     	       					
 	       				var $currentPage = result.pi.currentPage;
                        var $startPage = result.pi.startPage;
                        var $endPage = result.pi.endPage;
                        var $maxPage = result.pi.maxPage;
                        
                        var $btns = "";
                        for(var $p = $startPage; $p <= $endPage; $p++ ){
                           
                           $btns += "<button type='button' onclick='selectReplyList(" + $p + ");' style='border: none; background: none'>" + $p + "</button>";
                        }
                        
                        if(cPage != "1"){
                            var $prevBtn = "<button type='button' onclick='selectReplyList(" + ($currentPage - 1) + ");' class='btn btn-outline-secondary btn-sm'>" + "&lt;" + "</button>";
                        }else{
                        	var $prevBtn = "";
                        }
                        
                        if(cPage != $maxPage){
                            var $nextBtn = "<button type='button' onclick='selectReplyList(" + ($currentPage + 1) + ");' class='btn btn-outline-secondary btn-sm'>" + "&gt;" + "</button>";
                        }else{
                        	var $nextBtn = "";
                        }
                        	
                         
                        var $buttons = $prevBtn + $btns + $nextBtn ;
                        
	       				$("#content_4").html("댓글 " + $listCount);
 	       				$("#content_6").html(comment);
                        
                        $("#paging").html($buttons);
                        
                     }else{
		       				$("#content_4").html("댓글 0");
                        $("#content_6").html('작성된 댓글이 없습니다.');
                     }

       				
	       		},error:function(){
	       				console.log("댓글 리스트 조회용 ajax 통신 실패");
	       		}
			});
		}
		function confirmDeleteComment(commentNo){
       		if(confirm("댓글을 삭제하시겠습니까?")){
       			deleteComment(commentNo);
       		}
       	}
       	
       	// 댓글 삭제용 ajax
       	function deleteComment(commentNo){
       		
       		$.ajax({
       			url:"<%=contextPath%>/adminPage/delete.rco",
       			type:"post",
       			data:{"commentNo":commentNo},
       			success:function(result){
       				
       				if(result>0){
       					selectReplyList(1);
       					
       				}
       				
       			}, error:function(){
       				console.log("ajax 통신 실패");
       			}
       		});
       	}
	</script>
	<%} %>
    <br>
    <br>
</body>
</html>