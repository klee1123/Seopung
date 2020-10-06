<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.adminCommunity.model.vo.Community"%>
<%
	Community c = (Community)request.getAttribute("c");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.outer {
	width: 900px;
	margin: auto;
}

.outer>div {
	box-sizing: border-box;
	/* border:1px solid black; */
	width: 100%;
}

#content_1 {
	height: 50px;
	background: lightgrey;
}

#content_2 {
	height: 25px;
}

#content_3 {
	height: 500px;
} /*임시*/
#content_4 {
	height: 20px;
	padding-left: 10px
}

#content_5 {
	height: 75px;
}

#content_7 {
	height: 40px;
	background: lightgrey;
}

#content_1>div {
	display: table-cell;
	height: 100%;
	padding: 10px;
	line-height: 40px;
}

#content_2>div {
	display: table-cell;
	height: 100%;
	padding-left: 10px;
	padding-right: 10px;
	line-height: 40px;
}

#content_3 {
	padding: 10px;
}

#content_6 table {
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading 
		<h1 class="h3 mb-4 text-gray-800">커뮤니티 상세조회</h1>
		-->
		<br>

		<div class="outer">

			<div id="content_1">
				<div style="width: 770px; font-size: 18px;">[<%=c.getHead() %>] <%=c.getTitle() %></div>
				<div style="text-align: right;"><%=c.getEnrollDate() %></div>
			</div>

			<div id="content_2">
				<%if(c.getHead().equals("공지")){ %>
				<div style="width: 790px;"><%=c.getCommunityWriter() %></div>
				<div>조회수 <%=c.getCount() %></div>
				<%}else{ %>
				<div style="width: 610px;"><%=c.getCommunityWriter() %></div>
				<div>추천수 <%=c.getRecommendCount() %></div>
				<div>스크랩수 <%=c.getScrapCount() %></div>
				<div>조회수 <%=c.getCount() %></div>
				<%} %>
			</div>

			<hr>

			<div id="content_3" style="overflow:auto;"><%=c.getContent() %></div>

			<%if(c.getHead().equals("공지")){ %>
			<hr>
			<%}else{ %>
			
			<div id="content_4"></div>

			<hr>

			<div id="content_6" align="center">
			</div>
			
			<div align="center" id="paging">
			</div>
			<%} %>
			<br> <br> <br>

			<div align="center">
				<button class="btn btn-secondary" onclick="location.href='<%=contextPath%>/adminPage/list.co?currentPage=1';">취소</button>
				<%if(c.getHead().equals("공지")){ %>
				<button class="btn btn-primary" onclick="location.href='<%=contextPath%>/adminPage/updateForm.co?&cno=<%=c.getCommunityNo()%>&head=<%=c.getHead()%>';">수정</button>
				<%} %>
				<button class="btn btn-danger" id="deleteBtn">삭제</button>
			</div>

			<br> <br>

		</div>
		
		<script>
            
	       	$(function(){
	       		selectReplyList(1); // 페이지 로딩된 직후에 이 게시글에 딸려있는 댓글 리스트 조회
	       		
	       		//setInterval(selectReplyList,1000);
	       		
	       		$("#deleteBtn").click(function(){
	       			if(confirm("정말 삭제하시겠습니까?")) {
	       				location.href="<%=contextPath%>/adminPage/delete.co?cno=<%=c.getCommunityNo()%>";
	       			}
	       		});
	       		
	       		
	       	});	 
	       	
	       	
	       	// 해당 게시글에 딸려있는 댓글리스트 조회용 ajax
	       	function selectReplyList(cPage){
	       		$.ajax({
	       			url:"<%=contextPath%>/adminPage/rlist.co",
	       			type:"get",
	       			data:{
	       				"cno":<%=c.getCommunityNo()%>,
	       				"currentPage":cPage
	       			},
	       			success:function(result){
	       				
                        if(result.list.length > 0){
                             
                             var comment="";
     	       				 for(var i in result.list){
     	       					comment += "<table>" +
					    	    				"<tr>" +
					    							"<td width='60'>";
     	       					 
     	       					 if(result.list[i].profile == null || result.list[i].profile == "null"){
     	       						 comment += "<img width='45px' height='45px' class='rounded-circle' src='<%=contextPath%>/resources/images/default-user.png'>";
     	       					 }else{
     	       						 comment += "<img width='45px' height='45px' class='rounded-circle' src='<%=contextPath%>/" + result.list[i].profile + "'>";
     	       					 }
     	       					 
     	       					 comment +=         "</td>" +
					    							"<td>" + result.list[i].commentWriter + "<br>" + result.list[i].enrollDate +
					    							"</td>" +
					    							"<td>" +  "</td>" + 
					    						"</tr>" + 
					    						"<tr>" + 
					    							"<td colspan='2' width='800'>" + 
					    								result.list[i].content +
					    							"</td>" +
					    							"<td align='center'>" +
					    								"<button style='border: none; background: none' onclick='confirmDeleteComment(" + result.list[i].commentNo + ");'>삭제</button>" +
					    							"</td>" +
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
	       	
	     	// 댓글 삭제 CONFIRM 용
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
	

	</div>
	<!-- /.container-fluid -->

	<%@ include file="../../common/footer.jsp"%>

</body>
</html>