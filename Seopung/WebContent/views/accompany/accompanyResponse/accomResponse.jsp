<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.util.ArrayList, com.kh.common.*" %>
<%@ page import="com.kh.accompany.model.vo.* , com.kh.Member.model.vo.*" %>


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
        .accomResponse{
      
      margin-top: 30px;
      float: left;

      width: 1000px;
      height: 800px;
  }



</style>





</head>
<body>

    <%@ include file="../../common/menubar.jsp" %>
	<%@ include file="../../myPage/common/myPageSidebar.jsp" %>

    <class class="accomResponse">
	
		<div class="accomTitle">
	        
	            <h1>&nbsp;&nbsp;&nbsp;<b style="color:black;">신청 한 동행인</b></h1>
	            <hr>
	        
			<div class="response"> <br>
				
						
	            <form action="<%=contextPath %>/response.ac" method="GET">
	            
				<br><br>
				
	            <table id="accomRp"  align="center" class ="table table-hover">
	                <thead>
	                    <tr align="center" class="head">
	                        <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
	                        <th width="150">아이디</th>
	                        <th width="100"></th>
	                        <th width="100">신청날짜</th>
                            <th width="150">일정제목</th>
                            <th width="200">동행진행과정</th>
                            <th width="70"></th>
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
	                        <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;<%= i+1 %></td>
	                        <td ><%= list.get(i).getUserId() %></td>
	                        <td></td>
	                        <td><%= list.get(i).getAccomApply() %></td>
                            <td><a href="<%= contextPath %>/detail.pl?pno=<%= list.get(i).getPlanNo() %>" ><%= list.get(i).getPlanTitle() %></a></td>
                            <td>
                            
                            <% if(list.get(i).getAccomStatus() == null || list.get(i).getAccomStatus().equals("null")){ %>
                            
                                                 	<span>진행중</span>
                            <% } else if(list.get(i).getAccomStatus().equals("N")) { %>
                            
                                               	<span>거절</span>
                            
                            <% }else{ %>
                            	<span>수락</span>
                            
                            <% } %>
                            
                            </td>
                            <td>
                            <% if(list.get(i).getAccomStatus() == null || list.get(i).getAccomStatus().equals("null")) { %>
                            
                            <a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#cancel"  style="font-size: 10px;" id="accomCancel" onclick="accomCancel('<%= list.get(i).getAccomNo() %>');">동행취소</a></td>
							
							<% } %>
                        </tr>
						<% } %>
                   <% } %>
                       
	                </tbody>
				</table>
				
			
                </form>
                
				<script>
				function accomCancel(accomNo){
					
					$("#accomNo").val(accomNo);
					
					
					
				}
				
				
				
				
				</script>




                
                <div class="modal" id="cancel">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">취소여부</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body" align="center">
                			
                                <h4><b>
                                    동행신청을 취소하시겠습니까 ? <br>   
                                </b>
                                </h4>
                                <br>
            
                                <form action="<%= contextPath %>/responseCancel.ac" method="get">
                        			
                        			<input type="hidden" name="accomNo" id="accomNo">
                                    <button type="submit" class="genric-btn info-border radius">확인</button>
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
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/response.ac?currentPage=1">&lt;&lt;</button>
                    <!-- 이전페이지로 (<) -->    
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/response.ac?currentPage=<%= currentPage -1 %>">&lt;</button>
					<% } %>
					
				<% for(int p=startPage; p<=endPage; p++){ %>
					<% if(p != currentPage){ %>
                        <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/response.ac?currentPage=<%=p%>';"><%= p %></button>
					<% }else{ %>
						<button class="btn btn-secondary btn-sm" disabled><%= p %></button>
                	<% } %>        
                <% } %>
                
                <% if(currentPage != maxPage){ %>  
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/response.ac?currentPage=<%=currentPage+1%>';">&gt;</button>
                        <button class="btn btn-secondary btn-sm" onclick="location.href='<%=contextPath%>/response.ac?currentPage=<%=maxPage%>';">&gt;&gt;</button>
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