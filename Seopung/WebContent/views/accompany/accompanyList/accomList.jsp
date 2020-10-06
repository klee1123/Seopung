<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.*" %>
<%@ page import="com.kh.accompany.model.vo.* , com.kh.Member.model.vo.*" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Accompany> list = (ArrayList<Accompany>)request.getAttribute("list");
	
	
	
	int userNo = 0;
	if(session.getAttribute("loginUser") != null){
		userNo = ((LoginUser)session.getAttribute("loginUser")).getUserNo();
	}
	
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String userNick = (String)request.getAttribute("userNick");
	

%>    


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="../../../resources/css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="../../../resources/css/owl.carousel.min.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="../../../resources/css/all.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="../../../resources/css/flaticon.css">
        <link rel="stylesheet" href="../../../resources/css/themify-icons.css">
        <link rel="stylesheet" href="../../../resources/css/nice-select.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="../../../resources/css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="../../../resources/css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="../../../resources/css/style.css">
        <style>
            .accomList{
                width: 1000px;
                height: 800px;
                margin-top: 30px;
                float: left;
            }
     

            .profilePhoto{
                padding-left: 20px;

                float: left;
            }


           
           
        </style>

</head>
	
<body>
    
    
    

    <%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../../myPage/common/myPageSidebar.jsp" %>
	

    
		<class class="accomList">
	
		<div class="accomTitle">
	        
            <h1>&nbsp;&nbsp;&nbsp;<b style="color:black;">동행목록</b></h1>
            <hr>
	        
			<div class="accompanyList"> <br>
				
                    

                
	            <form action="<%=contextPath %>/list.ac" method="GET">
                    
				<br><br>
				
	            <table id="accomList" align="center" class ="table table-hover" >
	                <thead>
	                    <tr align="center" class="head">
	                        <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
	                        <th width="150">아이디</th>
	                        <th width="100">닉네임</th>
	                        <th width="120"></th>
                            <th width="150"></th>
                            <th width="120"></th>
                            <th width="90"></th>
	                    </tr>
	                </thead>
	               
	                <tbody>
	               	<%if(list.isEmpty()){ %>
	                <tr>
	                	<td align="center" colspan="7">조회된 리스트가 없습니다.</td>
	                </tr>
	                <%} else { %>
	                	<% for(int i=0; i<list.size(); i++) { %>
	                    <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox" class="primary-checkbox" id="default-checkbox">&nbsp;&nbsp;<%= i+1 %> </td>
	                        
	                        
	                        <td><%= list.get(i).getUserId() %></td>
	                        <td><%= list.get(i).getUserNick() %></td>
	                        
	                        <% if( loginUser.getUserNo() == list.get(i).getUserNo1()) {%>
	                        <td><a href="#" class="genric-btn info-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 10px" data-toggle="modal" data-target="#profile" onclick="openProfile(<%= list.get(i).getUserNo2() %>);">프로필</a></td>
                            <% } else { %>
                            <td><a href="#" class="genric-btn info-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 10px" data-toggle="modal" data-target="#profile" onclick="openProfile(<%= list.get(i).getUserNo1() %>);">프로필</a></td>
                            <% } %>
                            
                            <td><a href="#" class="genric-btn primary-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 15px" data-toggle="modal" data-target="#message" onclick="accomMessage('<%=  list.get(i).getUserNick() %>')">메세지보내기</a></td>
                            <td><a href="#" class="genric-btn danger-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 10px" data-toggle="modal" data-target="#delete" onclick="deleteAccompany(<%= list.get(i).getAccomNo()  %>);" >동행삭제</a></td>
                            <td><a href="#" class="genric-btn danger-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 5px" data-toggle="modal" data-target="#report" onclick="accomReport(<%= list.get(i).getPlanNo() %>);">신고</a></td>
							<input type="hidden" name="userId" id="accomProfile" >
							<input type="hidden" name="myNo" id="loginUserNo" value="<%= loginUser.getUserNo() %>">
							<input type="hidden" name="userNo" id="userNo1" value="<%= list.get(i).getUserNo1() %>">
							<input type="hidden" name="userNo2" id="userNo2" value="<%= list.get(i).getUserNo1() %>">
	                   		<input type="hidden" id="accomNo1" value="<%= list.get(i).getAccomNo() %>">
	                   		
	                    </tr>
	                    <% } %>
                    <% } %>
                       
	                </tbody>
				</table>
				
			
                </form>
				 
				 
				<script>
				
				function deleteAccompany(accomNo){
					
					if(confirm("동행을 삭제하시겠습니까 ?")){
						location.href="<%=contextPath%>/delete.ac?accomNo=" + accomNo;
					}
				}

                function accomProfile(userId){
                	<!-- 
                	$("#accomProfile").val(userId);
                	console.log($("#accomProfile").val());
                	-->
                	console.log(userId);
                	location.href="<%=contextPath%>/profile.ac?userId=" + userId;
                	
                	
                	
                }
                
                function accomMessage(userNick){
                	
                	
                	$("#myNo").val($("#loginUserNo").val());
                	
                	
                	$("#userNick").val(userNick)
                	
                	
                	var myNo = $("#myNo").val();
                	var userNo1 = $("#userNo1").val();
                	var userNo2 = $("#userNo2").val();
                	
                	
                	if(myNo == userNo1){
                		$("#userNo").val(userNo2);
                		console.log($("#userNo").val());
                	}else{
                		$("#userNo").val(userNo1);
                		console.log($("#userNo").val());
                	}
                	
                	
                	
                }
				
				function accomReport(planNo){
					
					$("#reportNo").val($("#loginUserNo").val());
					
					var reportUserNo = $("#reportNo").val();
					console.log(reportUserNo);
                	var userNo1 = $("#userNo1").val();
                	var userNo2 = $("#userNo2").val();
                	var accomNo = $("#accomNo1").val();
                	
                	
                	
                	$("#reportPlanNo").val(planNo);
                	console.log($("#reportPlanNo").val());
                	$("#accomNo").val(accomNo);
                	
                	
                	
                	
                	if(reportUserNo == userNo1){
                		$("#reportNo2").val(userNo2);
                		console.log($("#reportNo2").val());
                	}else{
                		$("#reportNo2").val(userNo1);
                		console.log($("#reportNo2").val());
                	}
					
					
					
					
					
				}
                
                
                
                </script>
				
				                
              

                <!-- 메세지 modal -->

                <div class="modal" id="message">
                    <div class="modal-dialog" >
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h3 class="modal-title">메세지 보내기</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            
                                <div class="message">
                                    <form action="message.ac" method="GET">
                                        
                                        <input type="hidden" name="senderNo" id="myNo">
                                        <input type="hidden" name="receiverNo" id="userNo">
                                        
                                    
                                        <div class="profilePhoto" style="float: ">
                                            	닉네임 : <input type="text" id="userNick" readonly>
                                            <br>
                                           
                                        </div>
                                        <div class="profileJoin">
                                            

                                        <br><br>
                                        </div>
                                        
                                        <textarea name="introduction" cols="50" rows="15"style="resize: none;" placeholder="내용을 입력해주세요" style="float: left;"></textarea>
                                        
                                        <br><br>

                                        <button class="genric-btn info-border radius">보내기</button>
                                        <button class="genric-btn danger-border radius">취소</button>


                                    </form>
                                    </div>


                            </div>
                            


                        </div>
                        
                    </div>



                </div>

                                
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

	<!-- 프로필 모달 ajax 스크립트 -->
	<script>
		var modal = document.getElementById("myProfile");
	
		$(function(){
			
			$(".close").click(function() {
				modal.style.display = "none";
			});
			
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
		
		});
		
		function openProfile(userNo){
			
			modal.style.display = "block";
			selectProfile(userNo);	
			
			
			
			
		}
		
		function selectProfile(userNo){
       		$.ajax({
       			url:"<%=contextPath%>/profile.pl",
       			type:"post",
       			data:{
       				"userNo":userNo
       			},
       			success:function(profile){
       				
       				var content = "<br>";
       				
       				if(profile.m.profile != "null"){
	       				content += "<img src='<%=contextPath%>/" + profile.m.profile + "' class='rounded-circle' height='120' width='120'>";
       				}else{
       					content += "<img src='https://ucanr.edu/sb3/display_2018/images/default-user.png' class='rounded-circle' height='120' width='120'>";
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
	                    
	                if(profile.m.userIntro != "null"){
	                	content += profile.m.userIntro + "</textarea>";
	                }else{
	                	content +=  "</textarea><br>";
	                }
	               
	                $(".modal-profile").html(content);

       			}, error:function(){
       				console.log("프로필 조회용 ajax 통신 실패");
	       		}
	       	});
		}
	</script>




                
                <!-- 신고하기 modal -->

                <div class="modal" id="report">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">신고 작성</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                        
                                <form action="<%= contextPath %>/report.ac" method="get">
                                	<input type="hidden" name="flagNo" value=1>
            						<input type="hidden" name="reportUserNo" id="reportNo">
            						<input type="hidden" name="reportUserNo2" id="reportNo2">
            						<input type="hidden" name="planNo" id= "reportPlanNo">
            						<input type="hidden" name="accomNo" id= "accomNo">
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
                </div>


            
	            <br><br>
                <div class="pagingArea" align="center">
                    <div align="center">
					<% if(currentPage != 1){ %>
	            	<!-- 맨 처음으로 (<<) -->
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.ac?currentPage=1">&lt;&lt;</button>
                    <!-- 이전페이지로 (<) -->    
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.ac?currentPage=<%= currentPage -1 %>">&lt;</button>
					<% } %>
					
				<% for(int p=startPage; p<=endPage; p++){ %>
					<% if(p != currentPage){ %>
                        <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.ac?currentPage=<%=p%>';"><%= p %></button>
					<% }else{ %>
						<button class="btn btn-secondary btn-sm" disabled><%= p %></button>
                	<% } %>        
                <% } %>
                
                <% if(currentPage != maxPage){ %>  
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.ac?currentPage=<%=currentPage+1%>';">&gt;</button>
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/list.ac?currentPage=<%=maxPage%>';">&gt;&gt;</button>
                <% } %>    
                    </div>
	            </div>
	        </div>
        </div>
        </class>
	  

    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="../../../resources/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="../../../resources/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="../../../resources/js/jquery.magnific-popup.js"></script>
    
    
    
    
    <!-- particles js -->
    <script src="../../../resources/js/owl.carousel.min.js"></script>
    <script src="../../../resources/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="../../../resources/js/slick.min.js"></script>
    <script src="../../../resources/js/jquery.counterup.min.js"></script>
    <script src="../../../resources/js/waypoints.min.js"></script>
    <script src="../../../resources/js/contact.js"></script>
    <script src="../../../resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="../../../resources/js/jquery.form.js"></script>
    <script src="../../../resources/js/jquery.validate.min.js"></script>
    <script src="../../../resources/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="../../../resources/js/custom.js"></script>

</body>
</html>