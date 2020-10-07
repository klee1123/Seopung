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

  

</style>


</head>
<body>
    
    

  

        <%@ include file="../../common/menubar.jsp" %>
        <%@ include file="../../myPage/common/myPageSidebar.jsp" %>
        <div class="myContent">
        
        
        <class class="sendMessage">
        
            <div class="messageTitle">

                    
                    <h1>&nbsp;&nbsp;&nbsp;<b style="color:black;">보낸 메세지함</b></h1>
                    <hr>
                
                <div class="send"> <br>
                    
                    <a href="#"  class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px; float: right; margin-right: 10px;">선택삭제</a>    
                    <form action="<%= contextPath %>/send.ms" method="POST">
                    <br>
                  
                   
                    <br>    
                        <table id="messageList"  align="center" class ="table table-hover">
                            <thead>
                                <tr align="center" class="head">
                                    <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
                                    <th width="150">수신자 아이디</th>
                                    <th width="100">닉네임</th>
                                    <th width="100">발신일</th>
                                    <th width="250">메세지내용</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr align="center" style="line-height: 2;">
                                    <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                                    <td >아이디 넣을칸</td>
                                    <td>닉네임</td>
                                    <td>2020.09.19</td>
                                    <td><a href="#">asdasdasdasd</a></td>

                                </tr>

                            </tbody>
                        </table>
                    
                
                    </form>


                    
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
	</div>

    
    
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