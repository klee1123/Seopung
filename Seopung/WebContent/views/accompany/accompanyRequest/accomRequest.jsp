<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.*" %>
<%@ page import = "com.kh.accompany.model.vo.* , com.kh.Member.model.vo.*" %>
<%@ page import = "com.kh.Member.model.vo.*" %>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Accompany> list = (ArrayList<Accompany>)request.getAttribute("list");	


	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();



%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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


    .accomRequest{
      
        margin-top: 30px;
        float: left;

        width: 1000px;
        height: 800px;
    }
  
    tbody>tr:hover{
            cursor:pointer;
            opacity:0.7;
        }

    .modal{
        position: absolute;

    }

    #planTitle_1{

        text-decoration: none;
        color: black;

    }

    



</style>


</head>



<body>

  

    <%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../../myPage/common/myPageSidebar.jsp" %>
	
	
	<class class="accomRequest">
	
		<div class="accomTitle">
	        
	            <h1>&nbsp;&nbsp;&nbsp;<b style="color:black;">신청 온 동행인</b></h1>
	            <hr>
	        
			<div class="request"> <br>
				
						
	            <form action="<%= contextPath %>/request.ac" method="GET">
	            
				<br><br>
				
	            <table id="accomList"  align="center" class ="table table-hover">
	                <thead>
	                    <tr align="center" class="head">
	                        <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
	                        <th width="150">아이디</th>
	                        <th width="100">닉네임</th>
	                        <th width="100">신청날짜</th>
                            <th width="150">일정제목</th>
                            <th width="200">수락여부</th>
                            <th width="70">신고</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <%if(list.isEmpty()){ %>
	                <tr>
	                	<td align="center" colspan="7">조회된 리스트가 없습니다.</td>
	                </tr>
	                <%} else { %>
	                	<% for(int i=0; i<list.size(); i++){ %>
	                    <tr align="center" style="line-height: 2;">
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;<%= i+1 %></td>
	                        <td ><%= list.get(i).getUserId() %></td>
	                        <td><%= list.get(i).getUserNick() %></td>
	                        <td><%= list.get(i).getAccomApply() %></td>
                            <td><a href="<%= contextPath %>/detail.pl?pno=<%= list.get(i).getPlanNo() %>" id="planTitle_1"><%= list.get(i).getPlanTitle() %></a></td>
                            <td><a href="#" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#accept" style="font-size: 10px;" onclick="agree(<%=list.get(i).getAccomNo() %>);">수락</a> /
                                <a href="#" class="btn btn-outline-warning btn-sm"   data-toggle="modal" data-target="#refusal"  style="font-size: 10px;" onclick="cancel(<%=list.get(i).getAccomNo() %>);" >거절</a>
                            </td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px;" onclick="accomReport(<%= list.get(i).getPlanNo() %>);">신고</a></td>
							<input type="hidden" name="myNo" id="loginUserNo" value="<%= loginUser.getUserNo() %>">
							<input type="hidden" name="userNo" id="userNo1" value="<%= list.get(i).getUserNo1() %>">
                        	<input type="hidden" id="accomNo1" value="<%= list.get(i).getAccomNo() %>">
                        
                        </tr>
						<% } %>
                    <% } %>
	                </tbody>
				</table>
				
			
				</form>
               
               <script>
               
				function accomReport(planNo){
					
					$("#reportNo").val($("#loginUserNo").val());
					
					var reportUserNo = $("#reportNo").val();
					console.log(reportUserNo);
                	var userNo1 = $("#userNo1").val();
                	var accomNo = $("#accomNo1").val();
                	
                	
                	$("#reportPlanNo").val(planNo);
                	
               
                	$("#reportNo2").val(userNo1);
					
                	$("#accomNo").val(accomNo);
                	
                	
					
				}
				
				function agree(accomNo){
					
					$("#accomNo").val(accomNo);
					
				}
				
				function cancel(accomNo){
					$("#accomNo2").val(accomNo);
				}
                
               
               
               
               
               
               </script>
               
               
               
               
               
                <!-- 수락 modal -->
                <div class="modal" id="accept">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">수락여부</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body" align="center">
                
                                <h4><b>
                                    동행을 수락하시겠습니까 ? <br>   
                                </b>
                                </h4>
                                <br>
            
                                <form action="<%= contextPath %>/agree.ac" method="GET">
                        			<input type="hidden" name="accomNo" id="accomNo">
                                    <button type="submit" class="genric-btn info-border radius">확인</button>
                                    <button type="reset" class="genric-btn danger-border radius">취소</button>
                                </form>
            
                            </div>


                        </div>
                    </div>
                </div>

                <!-- 거절 모달 -->

                <div class="modal" id="refusal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">수락여부</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body" align="center">
                
                                <h4><b>
                                    동행을 거절하시겠습니까 ? <br>   
                                </b>
                                </h4>
                                <br>
            
                                <form action="<%= contextPath %>/cancel.ac" method="get">
                        			<input type="hidden" name="accomNo" id="accomNo2">
                                    <button type="submit" class="genric-btn info-border radius">확인</button>
                                    <button type="reset" class="genric-btn danger-border radius">취소</button>
                                </form>
            
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
                        
                                <form action="<%= contextPath %>/report.ac" method="get">
                                	<input type="hidden" name="flagNo" value=2>
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
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/request.ac?currentPage=1">&lt;&lt;</button>
                    <!-- 이전페이지로 (<) -->    
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/request.ac?currentPage=<%= currentPage -1 %>">&lt;</button>
					<% } %>
					
				<% for(int p=startPage; p<=endPage; p++){ %>
					<% if(p != currentPage){ %>
                        <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/request.ac?currentPage=<%=p%>';"><%= p %></button>
					<% }else{ %>
						<button class="btn btn-secondary btn-sm" disabled><%= p %></button>
                	<% } %>        
                <% } %>
                
                <% if(currentPage != maxPage){ %>  
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/request.ac?currentPage=<%=currentPage+1%>';">&gt;</button>
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/request.ac?currentPage=<%=maxPage%>';">&gt;&gt;</button>
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