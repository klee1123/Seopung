<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.adminPlan.model.vo.Plan, com.kh.Member.model.vo.LoginUser"%>
<%
	Plan p = (Plan)request.getAttribute("p");
	int dayCount = (int)request.getAttribute("dayCount");

	String[] ages = p.getAge().split(",");
	String[] types = p.getPlanType().split(",");
	String[] trans = p.getTransrportations().split(",");
	
	int userNo = 0;
	if(session.getAttribute("loginUser") != null){
		userNo = ((LoginUser)session.getAttribute("loginUser")).getUserNo();
	}
	
	
	int category = 0;
	if(session.getAttribute("loginUser") != null){
		category = ((LoginUser)session.getAttribute("loginUser")).getCategory();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.outer {
	width: 1000px;
	margin: auto;
	margin-top: 120px;
}

#content_1{
	margin-top:15px;
	margin-bottom:15px;
	width:980;
	align:center;
	
}
#content_1_1{
	margin-left:10px;
	float:left;
	width:400px;
	height:80px;
	padding:5px;
	padding-left:10px;
	border: 1px solid rgb(231, 231, 231);
	padding-top:8px;
}
#content_1_2{
	width: 250px;
	float: left;
	margin-left:15px;
	height:80px;
}
#content_1_2 table {
	border: 1px solid rgb(231, 231, 231);
	height: 80px;
	cursor:pointer;
}

#content_1_3 {
	background-color: #f9f9f9;
	border: 1px solid rgb(231, 231, 231);
	width: 300px;
	height: 80px;
	padding: 10px;
	box-sizing: border-box;
	float: left;
	overflow:auto;
	margin-left:15px;
}

#content_1_3>button {
	margin: 3px;
}


.map_wrap {
	width: 580px;
	height: 500px;
	/*border: 1px solid lightgrey;*/
	float: left;
	margin-left: 15px;
	margin-right: 15px;
}

#content_2_2{float:left;}
#content_2_2_1 {
	width: 380px;
	height: 340px;
	/*border: 1px solid lightgrey;*/
}


#content_2_2_2 {
	width: 380px;
	height: 146px;
	margin-top: 15px;
	padding: 10px;
	color: grey;
	border: 1px solid rgb(231, 231, 231);
	background: #f9f9f9;
	float: left;
	overflow:auto;
}

#content_5 table {
	margin-bottom: 20px;
}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid rgb(231, 231, 231);
  background-color:rgb(250, 250, 250);
  width: 25%;
  height: 100%;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 15px;
  height:20px;
  line-height:1px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: rgb(231, 231, 231);
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 12px;
  border: 1px solid rgb(231, 231, 231);
  width: 75%;
  border-left: none;
  height: 100%;
}
</style>
<body>

	<%@include file="../common/menubar.jsp"%>


	<div class="outer">
		<table>
			<tr>
				<td width="720">
					<h2 style="color: rgb(75, 75, 75);">일정 상세조회</h2>				
				</td>
				<td width="270">
					<%if(loginUser != null && loginUser.getUserNo() != p.getUserNo() && loginUser.getCategory()==1){ %>
					<div id="content_3"  align="right">
						<button class="btn btn-outline-secondary btn-sm" onclick="likePlan();">추천</button>
						<%if(p.getScrapYN().equals("Y")){ %>
						<button class="btn btn-outline-secondary btn-sm" onclick="scrapPlan();">스크랩</button>
						<%}else{ %>
						<button class="btn btn-outline-secondary btn-sm" disabled>스크랩</button>
						<%} %>
						<%if(p.getAccompany().equals("Y")){ %>
						<button class="btn btn-outline-secondary btn-sm" onclick="confirmAccom();">동행신청</button>
						<%}else{ %>
						<button class="btn btn-outline-secondary btn-sm" disabled>동행신청</button>
						<%} %>
						<button class="btn btn-outline-secondary btn-sm" id="report" onclick="report(<%=p.getPlanNo()%>, <%=p.getUserNo()%>, 2);">신고하기</button>
					</div>
					<%}%>
					<!--  작성자에게만 보여줄 수정 삭제 버튼 -->
					<%if(loginUser != null && loginUser.getUserNo() == p.getUserNo() || category == 2){ %>
					<div align="right">
						<%if(category == 1){ %>
						<button class="btn btn-outline-secondary btn-sm" onClick="location='views/plan/planPageUpdateForm.jsp'">수정</button>
						<%} %>
						<button class="btn btn-outline-secondary btn-sm" onclick="confirmDeletePlan();">삭제</button>
					</div>
					<%} %>
				</td>
			</tr>
		</table>
		
		<hr style="margin-top:5px;">
		
		
		<div id="content_1">
		
			<div id="content_1_1">
				<table>
					<tr>
						<td width="235px" style="font-size: 15px;"><b
							style="font-size: 20px; color:rgb(75, 75, 75);"><%= p.getPlanTitle() %></b> <br> <%=p.getStartDate() %>
							~ <%=p.getEndDate() %></td>
						<td>추천 : <span id="recommendCount"><%=p.getRecommendCount() %></span> <br> 스크랩 : <span id="scrapCount"><%=p.getScrapCount() %></span>
							<br> 예산금액 : <%=p.getBudget() %>원
						</td>
					</tr>
				</table>
			</div>
			
			<div id="content_1_3">
				<%for(int i=0; i<ages.length; i++){ %>
				<button disabled class="btn btn-secondary btn-sm"><%= ages[i] %>대
				</button>
				<%} %>
				<%for(int i=0; i<types.length; i++){ %>
				<button disabled class="btn btn-secondary btn-sm"><%= types[i] %></button>
				<%} %>
				<%for(int i=0; i<trans.length; i++){ %>
				<button disabled class="btn btn-secondary btn-sm"><%= trans[i] %></button>
				<%} %>
			</div>
			
			<div id="content_1_2">
				<input type="hidden" name="userNo" value="<%=p.getUserNo()%>">
				<table style="width:250px;">
					<tr style="height: 75px;">
						<td width="85" align="center">
							<%if(p.getProfile() == null || p.getProfile().equals("null")){ %>
							<img width="55" height="55" class='rounded-circle'
							src="https://ucanr.edu/sb3/display_2018/images/default-user.png"
							alt=""></td>
							<%}else{ %>
							<img width="55" height"55" class='rounded-circle'
							src="<%=contextPath %>/<%=p.getProfile() %>">
							<%} %>
						<td><b style="font-size: 18px; color:rgb(75, 75, 75);"><%=p.getUserNick()%></b> <br>
							클릭시 프로필 조회 가능</td>
					</tr>
				</table>
			</div>
			<br clear="all">
			
		</div> <!-- content_1 end -->
		
		
		<div id="content_2">
		
			<div class="map_wrap">
		
				<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				<div id="menu_wrap" class="bg_white" style="width:220px;height:115px;">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    <input type="text" value="서울" id="keyword" size="20"> 
			                    <button type="submit" style="background-color:grey;color:white;width:37px;">검색</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
			
			<div id="content_2_2">
				
				<div id="content_2_2_1">
					<div class="tab" style="overflow: auto;">
						<%for(int i=1; i<=dayCount; i++){ %>
							<%if(i==1){ %>
							<button class="tablinks" onclick="openDay(event, '<%=i %>')" id="defaultOpen">day<%=i %></button>
							<%}else{ %>
							<button class="tablinks" onclick="openDay(event, '<%=i %>')">day<%=i %></button>
							<%} %>
						<%} %>
					</div>
		
					<%for(int i=1; i<=dayCount; i++){ %>
					<div id="<%=i %>" class="tabcontent">
						<h4>Day<%=i %></h4>
						<ol id="placeArea<%=i%>">
							
						</ol>
					</div>
					<%} %>
				</div>
				
				<div id="content_2_2_2">
					<%if(p.getMemo()!=null){ %>
					<%=p.getMemo() %>
					<%} %>
				</div>
			
			</div> <!--  content_2_2 end -->
			
			<br clear="all">
			
		</div> <!-- content_2 end -->
		
		<!-- 세부일정스크립트 -->
		<script>

			function openDay(evt, dayName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(" active", "");
				}
				selectPlace(dayName);
				document.getElementById(dayName).style.display = "block";
				evt.currentTarget.className += " active";
			}

			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
			
			$(function(){
				
				selectPlace(1);
				
			});
		
			function selectPlace(day){
				
				$.ajax({
					type:"get",
					url:"<%=contextPath%>/place.pl",
					data:{
						"day":day,
						"pno":<%=p.getPlanNo()%>
					}, success:function(place){
						
						var places = place.split(',');
						
						var str = ""
						for(var i=0; i<places.length; i++){
							str += "<li>" + places[i] + "</li>";
						}
						
						$("#placeArea" + day).html(str);
						
					}, error:function(){
						console.log("ajax 통신 실패");
					}
				});
				
				
			}
		</script>
		
		<br>
		
		<br clear="all">
	
		<div id="content_4" style="padding-left: 15px;"></div>
		<hr>
	
		<!-- 댓글 작성창 -->
		<%if(loginUser!=null && loginUser.getCategory() == 1){ %>
		<div id="content_4" align="center">
			<form action="" method="post">
				<table>
					<tr>
						<td width="70px"></td>
						<td width="800px;"><textarea id="commentContent" name="comment" cols="110"
								rows="3" maxlength="500" style="resize: none;overflow:auto" required></textarea></td>
						<td width="100" align="center">
							<button class="btn btn-secondary" onclick="addComment();">등록</button>
						</td>
					</tr>
				</table>
			</form>
		</div> <!--  content_4 end -->
		<hr>
		<%} %>
		
	
		<!--  댓글 목록 -->
		<div id="content_5" align="center">
		
		</div>
	
		<!--  댓글 페이징 -->
		<div align="center" id="paging"></div>
		
		
		<!--  프로필 모달 -->
		<div class="modal" id="myProfile">
	        <div class="modal-dialog modal-sm">
	            <div class="modal-content" align="center">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h5>프로필</h5>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-profile" style="height:370px;">
					</div>          
	            </div>
	        </div>
	    </div><!-- profile modal end -->
	    

	    <!-- 신고폼 모달 -->
        <div class="modal" id="reportModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4>서풍에 신고하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="" method="post" id="reportForm">
                        	<input type="hidden" name="reportPostNo" id="reportPostNo">
                        	<input type="hidden" name="reportUserNo2" id="reportUserNo2">
                        	<input type="hidden" name="reportPostType" id="reportPostType">
                            <p style="font-size: 13px; padding-left:20px;">
                                * 신고하신 내용은 증거자료를 참고하여 서풍 약관에 의거해 조치됩니다. <br>
                                * 증거 내용이 불충분하거나 타당한 이유가 아니면 무효 처리됩니다. <br>
                                * 허위 신고의 경우 신고자가 제재받을 수 있음을 유념해주세요. <br>
                            </p>
                            <br>
                            <b style="color:black;">신고유형</b>
                            <select name="reportType" class="form-control" required>
                            	<option value="" disabled selected hidden>신고 내용을 선택하세요.</option>
                                <option value="영리목적">영리목적</option>
                                <option value="불법성">불법성</option>
                                <option value="욕설">욕설</option>
                                <option value="도배">도배</option>
                                <option value="개인정보노출">개인정보노출</option>
                                <option value="음란성">음란성</option>
                                <option value="명의도용">명의도용</option>
                                <option value="기타">기타</option>
                            </select>
                            <br>
                            <b style="color:black;">신고내용</b>
                            <textarea name="reportContent" id="reportContent" cols="30" rows="6" style="resize: none;overflow:auto;" class="form-control" maxlength="1000" required></textarea>
                            <br>
                            <div align="center">
                                <input type="checkbox" required id="agreeCheck"> <label for="agreeCheck">개인 정보 수집 및 이용에 동의합니다.</label>
                                <br><br><br>
                                <button type="submit" class="btn btn-primary">제출</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> <!--  report modal end -->
	    
		
	</div> <!-- outer end -->
	
	<!-- 신고폼 모달 ajax 스크립트 -->
	<script>
		var reportModal = document.getElementById("reportModal");
		
		$(function(){
			$(".close").click(function() {
				reportModal.style.display = "none";
			});
		});
		
		function report(postNo, userNo2, reportPostType){
			$("#reportPostNo").val(postNo);
			$("#reportUserNo2").val(userNo2);
			$("#reportPostType").val(reportPostType);
			reportModal.style.display = "block";
		}
		
		$("#reportForm").submit(function(){
			
			var form = $(this);
			
			$.ajax({
				type:form.attr('method'),
				url:"<%=contextPath%>/insert.rp",
				data:form.serialize(),
				success:function(result2){
					
					if(result2>0){
						alert("신고되었습니다.");
						reportModal.style.display = "none";
					}else{
						alert("이미 신고하셨습니다.")
						reportModal.style.display = "none";
					}
					
				}, error:function(){
					console.log("Ajax 통신 실패");
				}
			});
		})
			
	</script>
	
	<!-- 프로필 모달 ajax 스크립트 -->
	<script>
		var modal = document.getElementById("myProfile");
	
		$(function(){
			$("#content_1_2").click(function(){
				
				if(<%=userNo%> != 0){
					modal.style.display = "block";
					selectProfile($("#content_1_2").children().eq(0).val());					
				}else{
					alert("로그인이 필요한 서비스 입니다.");
				}
					
			});
			$(".close").click(function() {
				modal.style.display = "none";
			});
			
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
		
		});
		
		function selectProfile(userNo){
       		$.ajax({
       			url:"<%=contextPath%>/profile.pl",
       			type:"post",
       			data:{
       				"userNo":userNo
       			},
       			success:function(profile){
       				
       				var content = "<br>";
       				
       				if(profile.m.profile == null || profile.m.profile == "null"){
       					content += "<img src='<%=contextPath%>/resources/images/default-user.png' class='rounded-circle' height='120' width='120'>";
       				}else{
	       				content += "<img src='<%=contextPath%>/" + profile.m.profile + "' class='rounded-circle' height='120' width='120'>";
       				}
       					
	                content += "<br><br>" +
	                    "<table>" +
	                        "<tr>" +
	                            "<th  width='80'>닉네임</th>" +
	                            "<td width='120'>" +
	                                profile.m.nickName + 
	                            "</td>" +
	                        "</tr>" +
	                        "<tr>" +
	                            "<th>이메일</th>" +
	                            "<td>" +
	                                profile.m.email + 
	                            "</td>" +
	                        "</tr>" +
	                        "<tr>" +
	                            "<th>가입일</th>" +
	                            "<td>" +
	                                profile.m.enrollDate +
	                            "</td>" +
	                        "</tr>" +
	                    "</table>" +
	                    "<br>" +
	                    "<textarea cols='30' rows='4' readonly style='resize: none; overflow: auto;'>";
	                    
	                if(profile.m.userIntro == null || profile.m.userIntro == "null"){
	                	content +=  "</textarea><br>";
	                }else{
	                	content += profile.m.userIntro + "</textarea>";
	                }
	               
	                $(".modal-profile").html(content);

       			}, error:function(){
       				console.log("프로필 조회용 ajax 통신 실패");
	       		}
	       	});
		}
	</script>
	
	
	<!-- 댓글 관련 ajax 스크립트 -->
	<script>
		$(function(){
			
			selectReplyList(1); // 페이지 로딩된 직후에 이 게시글에 딸려있는 댓글 리스트 조회
			
			$("#deleteBtn").click(function(){
	   			if(confirm("정말 삭제하시겠습니까?")) {
	   				location.href="<%=contextPath%>/adminPage/delete.pl?pno=<%=p.getPlanNo()%>";
	   			}
	   		});
			
		});
	
           
       	// 해당 게시글에 딸려있는 댓글리스트 조회용 ajax
       	function selectReplyList(cPage){
       		$.ajax({
       			url:"<%=contextPath%>/adminPage/rlist.pl",
       			type:"get",
       			data:{
       				"pno":<%=p.getPlanNo()%>,
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
    	       					 
    	       					 comment += "</td>" +
		    							"<td>" + result.list[i].userNick + "<br>" + result.list[i].enrollDate +
		    							"</td>" +
		    							"<td>" +  "</td>" + 
		    						"</tr>" + 
		    						"<tr>" + 
		    							"<td colspan='2' width='900'>" + 
		    								result.list[i].content +
		    							"</td>" +
		    							"<td align='center'width='50'>";
				    		
				    		 if(<%=userNo%>!=0 && <%=userNo%> == result.list[i].userNo || <%=category%>== 2 ) {
				    			 comment += "<button style='border: none; background: none' onclick='confirmDeleteComment(" + result.list[i].commentNo + ");'>삭제</button>";
				    		 }else if(<%=userNo%>!=0){
				    			 comment += "<button style='border: none; background: none; color:red;' onclick='report(" + result.list[i].commentNo + ", " + result.list[i].userNo + ", 3);'>신고</button>";
				    		 }
				    		 comment +=	"</td>" +
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
    	       				$("#content_5").html(comment);
                           
                           $("#paging").html($buttons);
                           
                        }else{
		       				$("#content_4").html("댓글 0");
                           $("#content_5").html('작성된 댓글이 없습니다.');
                        }

       				
	       		},error:function(){
	       				console.log("댓글 리스트 조회용 ajax 통신 실패");
	       		}
	       	});
		}
       	
       	// 댓글 작성용 ajax
       	function addComment(){
       		
       		$.ajax({
       			url:"<%=contextPath%>/rinsert.pl",
       			type:"post",
       			data:{
       				content:$("#commentContent").val(),
       				pno:<%=p.getPlanNo()%>
       			}, success:function(result){
       				
       				if(result>0){
       					selectReplyList(1);
       					$("#commentContent").val("");
       				}
       				
       			}, error:function(){
       				console.log("댓글작성용 ajax 통신 실패");
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
       			url:"<%=contextPath%>/adminPage/delete.rpl",
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
	
	<!-- 삭제, 추천, 스크랩, 동행신청 관련 ajax 스크립트 -->
	<script>
		function confirmDeletePlan(){
			
			if(confirm("일정을 삭제하시겠습니까?")){
				location.href="<%=contextPath%>/delete.pl?pno=<%=p.getPlanNo()%>";
			}
		}
	
		function likePlan(){
			$.ajax({
				url:"<%=contextPath%>/like.pl",
				type:"post",
				data:{
					userNo:<%=userNo%>,
					pNo:<%=p.getPlanNo()%>
				}, success:function(result1){
					
					if(result1>0){
						alert("추천되었습니다");
						$("#recommendCount").html(<%=p.getRecommendCount()%> + 1);
					}else{
						alert("이미 추천하였습니다.");
					}
					
					
				}, error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		function scrapPlan(){
			$.ajax({
				url:"<%=contextPath%>/scrap.pl",
				type:"post",
				data:{
					"userNo":<%=userNo%>,
					"pNo":<%=p.getPlanNo()%>
				}, success:function(result){
					
					if(result>0){
						alert("스크랩 되었습니다");
						$("#scrapCount").html(<%=p.getScrapCount()%> + 1);
					}else{
						alert("이미 스크랩하였습니다.");
					}
					
				}, error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		function confirmAccom(){
			if(confirm("동행 신청하시겠습니까?")){
				accompanyPlan();
			}
		}
		
		function accompanyPlan(){
			$.ajax({
				url:"<%=contextPath%>/accom.pl",
				type:"post",
				data:{
					"userNo":<%=userNo%>,
					"userNo2":<%=p.getUserNo()%>,
					"pNo":<%=p.getPlanNo()%>
				}, success:function(result){
					
					if(result>0){
						alert("동행 신청되었습니다");
					}else{
						alert("이미 동행 신청하셨습니다.");
					}
					
				}, error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
	
	</script>
	
	
	<!--  카카오맵 api 스크립트 -->
	<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === kakao.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr =  '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}

		
	</script>


	<%@include file="../common/footer.jsp"%>

</body>
</html>