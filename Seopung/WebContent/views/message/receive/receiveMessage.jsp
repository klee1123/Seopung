<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.*" %>
<%@ page import="com.kh.message.model.vo.* , com.kh.Member.model.vo.*" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	
	
	
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
<html>
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
        .receiveMessage{
      
       			width: 1000px;
                height: 800px;
                margin-top: 30px;
                float: left;
  }

  tbody>tr:hover{
          cursor:pointer;
          opacity:0.7;
      }

  .modal{
      position: absolute;

  }

  

</style>


</head>
<body>
    
    <body>

  

        <%@ include file="../../common/menubar.jsp" %>
        <%@ include file="../../myPage/common/myPageSidebar.jsp" %>
        <div class="myContent">
        
        <class class="receiveMessage">
        
            <div class="messageTitle">

                    
                    <h1>&nbsp;&nbsp;&nbsp;<b style="color:black;">받은 메세지함</b></h1>
                    <hr>
                
                <div class="receive"> <br>
                    
                    <a href="#"  class="btn btn-outline-primary btn-sm" id="btnDelete" style="font-size: 10px; float: right; margin-right: 40px;">선택삭제</a>    
                    <form action="<%= contextPath %>/receiver.ms" method="POST">
                    <br>
                  
                   
                    <br>    
                        <table id="messageList"  align="center" class ="table table-hover" style="table-layout:fixed;">
                            <thead>
                                <tr align="center" class="head">
                                    <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
                                    <th width="150">발신자 아이디</th>
                                    <th width="100">닉네임</th>
                                    <th width="100">수신일</th>
                                    <th width="200">메세지내용</th>
                                    <th width="200"></th>
                                    <th width="70">신고</th>
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
                                    <td><input type="checkbox"id="chk" name="chk1" value="<%= list.get(i).getMassageNo() %>">&nbsp;&nbsp;<%= i+1 %></td>
                                    <td ><%= list.get(i).getUserId() %></td>
                                    <td><%=list.get(i).getUserNick() %></td>
                                    <td><%= list.get(i).getMessageDate() %></td>
                                    <td style="overflow:hidden; white-space: nowrap;text-overflow: ellipsis;"><a href="#" data-toggle="modal" data-target="#messageContent" onclick="messageContent('<%= list.get(i).getUserId() %>', '<%= list.get(i).getMessageContent() %>');" ><%= list.get(i).getMessageContent() %></a></td>
                                    <td><a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#reply" style="font-size: 10px;" onclick = "replyMessage('<%= list.get(i).getUserNick() %>');">답장하기</a>
                                    </td>
                                    <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#reportModal"  style="font-size: 10px;"onclick="report(<%=list.get(i).getMassageNo()%>, <%= list.get(i).getUserNo2()%>, 4);">신고</a></td>
        							<input type="hidden" id="userNo1" value="<%= list.get(i).getUserNo() %>">
        							<input type="hidden" id="userNo2" value="<%= list.get(i).getUserNo2() %>">
        							
                                </tr>
        						<% } %>
                            <% } %>
                            
                            
                            
                            </tbody>
                        </table>
                    
                
                    </form>


                    
	            <br><br>

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
                        	<input type="hidden" name="reportPostNo" id="reportPostNo" >
                        	<input type="hidden" name="reportUserNo2" id="reportUserNo2">
                        	<input type="hidden" name="reportPostType" id="reportPostType" value="4">
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
                
                <!-- 답장하기 function -->
                <script>
                    
                    
                    function replyMessage(userNick){
                	
                	
                	$("#myNo").val($("#userNo2").val());
                	
                	$("#userNick").val(userNick)
                	
                	$("#userNo").val($("#userNo1").val());
                	
                	console.log("#myNo").val();
					
                	console.log("#userNick").val();
                	
                	console.log("#userNo").val();
                	
                	}
                	
                
                
                </script>
                
                <!-- 답장하기 -->

                <div class="modal" id="reply">
                    <div class="modal-dialog" >
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h3 class="modal-title">답장하기</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            
                                <div class="message">
                                    <form action="<%= contextPath %>/message.ac" method="GET">
                                        <input type="hidden" name="flagNo" value="2">
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

				<script>
				function messageContent(userId, messageContent){
					
					console.log(userId);
					
					$("#userId2").val(userId);
					
					console.log($("#userId2").val());
					
					$("#introduction").val(messageContent);
					
					
				}
				
				
				
				
				
				</script>
				
				
				

                <!-- 메세지내용 modal -->
                <div class="modal" id="messageContent">
                    <div class="modal-dialog" >
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h3 class="modal-title">메세지내용</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            
                                <div class="profile">
                                    <form action="" method="POST">
                                        
                                        
                                    
                                        <div class="profilePhoto" style="float: left; margin-left: 50px;" >
                                            <input type="text" id="userId2" readonly>
                                            <a href="#" data-toggle="modal" data-target="#profile">&nbsp;</a>
                                            <a href="#" class="btn btn-outline-warning btn-sm"  style="font-size: 10px;" onclick= >프로필보기</a>
                                            <br><br>
                                           
                                        </div>
                                        
                                        <div>
                                            <textarea name="introduction" id="introduction" cols="50" rows="8"style="resize: none;" readonly></textarea>
                                        </div>
                                        <br><br>

                                        <button class="genric-btn info-border radius">확인</button>

                                    </form>
                                    </div>


                            </div>
                            


                        </div>
                        
                    </div>



                </div>                
                
                <script>
                
                         	// 체크박스 전체선택 및 해제
            $(function(){
                $("#chk_all").click(function(){
                    if($("#chk_all").prop("checked")){
                        $("input[id=chk]").prop("checked",true);

                    }else {
                        $("input[id=chk]").prop("checked",false);
                    }
                });
            });
         	
         	// 삭제시
            $(function(){
            	$("#btnDelete").click(function(){

              		var selected = new Array();
              		$("input[id=chk]:checked").each(function(){
                		selected.push(this.value);
              		});
              		
              		if(selected.length == 0){
                    	alert("체크된 항목이 없습니다.");
                        return;
                    }

	              	var str = "";
	              	for(var i=0;i<selected.length; i++){
	                	if(i == selected.length-1){
	                  		str += "ino=" + selected[i];
	                	}else{
	                  		str += "ino=" + selected[i] + "&";
	                	}
	              	}
	              
	              	if(confirm("정말 삭제하시겠습니까?")) {
	                	location.href="<%=contextPath%>/delete.ms?" + str;
	              	} 
	            });
            });
		</script>
                
                
                
               
               
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