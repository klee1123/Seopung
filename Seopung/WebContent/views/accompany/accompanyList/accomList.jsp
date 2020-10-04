<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.*" %>
<%@ page import="com.kh.accompany.model.vo.* , com.kh.Member.model.vo.*" %>
<%@ page import="com.kh.Member.model.vo.*" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Accompany> list = (ArrayList<Accompany>)request.getAttribute("list");
	Member profile = (Member)request.getAttribute("profile");
	
	
	
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
	                	<% for(Accompany a : list) { %>
	                    <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox" class="primary-checkbox" id="default-checkbox">&nbsp;&nbsp;<%= a.getAccomNo() %> <input type="hidden" id="accomNo1" value="<%= a.getAccomNo() %>"></td>
	                        <td><%= a.getUserId() %></td>
	                        <td><%= a.getUserNick() %></td>
	                        <td><a href="#" class="genric-btn info-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 10px" data-toggle="modal" data-target="#profile" onclick="accomProfile('<%= a.getUserId() %>');">프로필</a></td>
                            <td><a href="#" class="genric-btn primary-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 15px" data-toggle="modal" data-target="#message" onclick="accomMessage('<%= a.getUserNick() %>')">메세지보내기</a></td>
                            <td><a href="#" class="genric-btn danger-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 10px" data-toggle="modal" data-target="#delete" onclick="deleteAccompany(<%= a.getAccomNo() %>);" >동행삭제</a></td>
                            <td><a href="#" class="genric-btn danger-border radius" style="height: 25px; font-size: 10px; line-height: 25px; padding: 0 5px" data-toggle="modal" data-target="#report">신고</a></td>
							<input type="hidden" name="userId" id="accomProfile" >
							<input type="hidden" name="myNo" id="loginUserNo" value="<%= loginUser.getUserNo() %>">
							<input type="hidden" name="userNo" id="userNo1" value="<%= a.getUserNo1() %>">
							<input type="hidden" name="userNo2" id="userNo2" value="<%= a.getUserNo2() %>">
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

                                
                <!-- 프로필 modal -->
                <div class="modal" id="profile">
                    <div class="modal-dialog" >
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h3 class="modal-title">프로필</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            
                                <div class="profile">
                                    <form action="<%= contextPath %>/profile.ac" method="GET">
                                         <br><br>
                                        
                                    
                                        <div class="profilePhoto"">
                                            <img src="../../../resources/images/회원.jpg" alt="">
                                            <br><br>
                                           
                                        </div>
                                        <div class="profileJoin">
                                            
                                        <table id="join" align="center" style="float: left;">
                                            <tr>
                                                <th align="left" width="100px" ">아이디</th>
                                                <td><span></span></td>
                                            </tr>
                                            
                                            <tr>
                                                <th align="left" width="100px">이름</th>
                                                <td><span> </span></td>
                                                
                                            </tr>
                                            <tr>
                                                <th align="left">닉네임</th>
                                                <td><span></span></td>
                                            
                                            </tr>
                                            <tr>
                                               
                                                </tr>
                                            </tr>
                                            <tr>
                                                <th align="left">이메일</th>
                                                <td><span> </span></td>
                                                
                                            </tr>
                                            <tr>
                                                <th align="left">생년월일</th>
                                                <td><span></span></td>
                                            </tr>
                                            
                                        </table>
                                        <br><br>
                                        </div>
                                        
                                        <textarea name="introduction" cols="50" rows="8"style="resize: none;"></textarea>
                                        
                                        <br><br>

                                        <button class="genric-btn info-border radius">확인</button>

                                    </form>
                                    </div>


                            </div>
                            


                        </div>
                        
                    </div>



                </div>



                
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
                        
                                <form action="" method="post">
            
                                    <table>
                                        <tr>
                                            <th>신고 사유</th>
                                                
                                            <td>
                                                <div class="default-select" id="default-select_2">
                                                    <select>
                                                        <option value="1">영리목적, 홍보성</option>
                                                        <option value="1">불법성</option>
                                                        <option value="1">욕설,인신공격</option>
                                                        <option value="1">도배 및 광고</option>
                                                        <option value="1">개인정보 노출</option>
                                                        <option value="1">음란성, 선정성</option>
                                                        <option value="1">모방 또는 명의 도용</option>
                                                        <option value="1">기타</option>
                                                    </select>
                                                </div>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>신고 제목 &nbsp;</th>
                                            <td><input type="text" name="reportTitle" required></td>
                                        </tr>
                                        <tr>
                                            <th>신고 내용</th>
                                            <td><textarea name="reportContent" cols="30" rows="10" style="resize: none;" required></textarea></td>
                                        </tr>
                                    </table>
                                    <br>
                                    <button type="submit" class="genric-btn info-border radius">작성</button>
                                    <button type="reset" class="genric-btn danger-border radius">취소</button>
                                    
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
                        <button class="btn btn-secondary btn-sm">&lt;&lt;</button>
                    <!-- 이전페이지로 (<) -->    
                        <button class="btn btn-secondary btn-sm">&lt;</button>
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