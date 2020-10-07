<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import = "java.util.ArrayList, com.kh.adminNotice.model.vo.AdminNotice, com.kh.common.PageInfo" %>
<%
    ArrayList<AdminNotice> list = (ArrayList<AdminNotice>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi"); // ()괄호안은 데이터타입 변환
  
    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>	
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<title></title>
<style>

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css); 
.notosanskr * { font-family: 'Noto Sans KR', sans-serif; }

.wrap {
	width: 1200px;
	margin: auto;
	margin-top: 120px;
	font-family: 'Noto Sans KR', sans-serif; 
}

.outer {
	width: 900px;
	margin: auto;
}

</style>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>

<body>
	<%@include file="../../common/menubar.jsp"%>
	<div class="wrap">

		<div class="outer">
        <h2>&nbsp;고객센터</h2><br>

        <h3 style="display:inline;">
        &nbsp;공지사항</h3>
        &emsp;&emsp;&emsp;&emsp;
        <h3 style="display:inline;">
        <a style= "color : black" href="<%=contextPath%>/enrollForm.iq?ino=currentPage=1';">1:1문의</h3>

        <hr>

        <div>
				
                    <br>
                    <% if(list.isEmpty()){ %>
                    	<div>조회된 리스트가 없습니다.</div>
                    <%} else{%>
						<% for(AdminNotice n : list){ %>
	                    <div style="width: 100%; border:1px solid rgb(201, 201, 201); padding: 15px;">
	                        
	                        <br>
	                        <h6>공지사항</h6>
	                        <h4>
	                            <a style= "color : black" href="<%=contextPath%>/detail.no?nno=<%=n.getNoticeNo()%>"><%= n.getNoticeTitle() %></a><br>
	                        </h4>
	                        <h6><%= n.getNoticeEnroll() %></h6>
	                        
	                        </div>
	                        <br>
	                    <%} %>
                    <%} %>
					
                    
					<hr>

				<br><br>

				<div align="center">
                    <table>
                        <tr>
                            <td width="120"><span>총 게시글 수 &nbsp;&nbsp;&nbsp;<b
                                    style="color: black"><%= listCount %></b>개
                            </span></td>
                            <td width="650px;">
                                <div align="center">
                                    <% if(currentPage != 1){ %>
	                                <button onclick="location.href='<%= contextPath %>/list.no?currentPage=1';" class="btn btn-secondary btn-sm">&lt;&lt;</button> <!-- &lt; 이거 반대꺾쇠 -->
	                                <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= currentPage-1 %>';" class="btn btn-secondary btn-sm">&lt;</button>
	                                <% } %>
	
	                                <% for(int p=startPage; p<=endPage; p++){ %>
	                                    <% if(p != currentPage){ %>
	                                    <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= p %>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
	                                    <% }else{ %>
	                                    <button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
	                                    <% } %>
	                                <% } %>
									
	                                <% if(currentPage != maxPage){ %>
	                                <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= currentPage+1 %>%>';" class="btn btn-secondary btn-sm">&gt;</button>
	                                <button onclick="location.href='<%= contextPath %>/list.no?currentPage=<%= maxPage %>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
	                                <% } %>
                                </div>
                            </td>
                           <td width="120px">  	
                          </td>
                        
                        </tr>
                    </table>
                	</div>
             
                <br><br>

            </div>
    
        </div>
        <!-- /.container-fluid -->
    
        <%@ include file="../../common/footer.jsp"%>
    </body>
    </html>