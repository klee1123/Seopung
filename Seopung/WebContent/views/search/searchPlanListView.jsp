<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.adminPlan.model.vo.Plan, com.kh.common.PageInfo, com.kh.searchPlan.model.vo.SearchPlan"%>
<%

	ArrayList<Plan> list = (ArrayList<Plan>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	SearchPlan filter = (SearchPlan)request.getAttribute("filter");
	
	
	// 페이징 조건
	String sDate = filter.getsDate();
	String eDate = filter.geteDate();
	String keyword = filter.getKeyword();
	String type = filter.getType();
	
	String age = "";
	if(filter.getAge()!=null){
		for(int i=0; i<filter.getAge().length; i++){
			age += "&age=" + filter.getAge()[i];
		}
	}

	String trans = "";
	if(filter.getTrans()!=null){
		for(int i=0; i<filter.getTrans().length; i++){
			age += "&trans=" + filter.getTrans()[i];
		}
	}
	
	// 검색내역
	String result = "시작일 : ";
	if(!sDate.equals("1900-01-01")){
		result += sDate;	
	}
	result += "/종료일 : ";
	if(!eDate.equals("2100-12-31")){
		result += eDate;
	}
	result += "/연령대 : ";
	if(filter.getAge()!=null){
		for(int i=0; i<filter.getAge().length; i++){
			if(i==filter.getAge().length-1){
				result += filter.getAge()[i] +"대";
			}else{
				result += filter.getAge()[i] + "대, ";
			}
		}
	}
	result += "/ 여행유형 : " + type + "/ 이동수단 : ";
	if(filter.getTrans()!=null){
		for(int i=0; i<filter.getTrans().length; i++){
			if(i==filter.getTrans().length-1){
				result += filter.getTrans()[i];
			}else{
				result += filter.getTrans()[i] + ", ";
			}
		}
	}
	result += "/ 검색어 : " + keyword;
	
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe8cd32f33f0e2f8b4705bcfad0f7b0"></script>
		
<style>
    .outer{
        width:1000px;
        margin:auto;
        margin-top:120px;
    }

    .seaechbar {
    overflow: hidden;
    background-color: white;
    border:1px solid rgb(218, 218, 218);
    }
    .filterdropdown {
    float: left;
    overflow: hidden;
    }

    .filterdropdown .dropbtn{
    font-size: 16px;  
    border: none;
    outline: none;
    color: rgb(75, 75, 75);
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
    }

    .seaechbar a:hover, .filterdropdown:hover .dropbtn {
    background-color:rgb(230, 230, 230);
    }

    .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    }

    .dropdown-content input {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    text-align: left;
    margin:15px;
    }

    .dropdown-content a:hover {
    background-color: #ddd;
    }

    .filterdropdown:hover .dropdown-content {
    display: block;
    }
 
    .listArea{
         margin-top: 10px;
     }
    .thumbnail{
         width: 227px;
         display:inline-block;
         margin:10px;
         padding:px;
         margin-bottom:50px;
     }
     .thumbnail:hover{
         cursor:pointer;
         opacity:0.7;
     }
</style>

</head>
<body>

	<%@include file="../common/menubar.jsp" %>
	
	<div class="outer">
	
		<h2 style="color: rgb(75, 75, 75);">일정검색</h2>
		<hr>
	
        <form action="<%=contextPath %>/list.pl?currentPage=1" method="get">
        	<input type="hidden" name="currentPage" value="1">
            <div class="seaechbar">

                <div class="filterdropdown" style="width:150px;">
                    <p style="color:rgb(75, 75, 75); font-size:17px; padding:12px; padding-left:20px; font-weight:bold">
                    	상세검색
                    </p>
                </div>

                <div class="filterdropdown">
                    <button type="button" class="dropbtn">시작일
                    <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                    <input type="date" name="sDate" id="sDate">
                    </div>
                </div> 
    
                <div class="filterdropdown">
                    <button type="button" class="dropbtn">종료일
                    <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                    <input type="date" name="eDate" id="eDate">
                    </div>
                </div> 
                <script>
		            document.getElementById("sDate").onchange = function () {
		                var input = document.getElementById("eDate");
		                input.setAttribute("min", this.value);
		            }
		            
		            document.getElementById("eDate").onchange = function () {
		                var input = document.getElementById("sDate");
		                input.setAttribute("max", this.value);
		            }
		
		        </script>
                
                <div class="filterdropdown">
                <button type="button" class="dropbtn">연령대
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <input type="checkbox" name="age" value="10">10대
                    <input type="checkbox" name="age" value="20">20대
                    <input type="checkbox" name="age" value="30">30대&nbsp;&nbsp;&nbsp; <br>
                    <input type="checkbox" name="age" value="40">40대
                    <input type="checkbox" name="age" value="50">50대
                    <input type="checkbox" name="age" value="60">60대&nbsp;&nbsp;&nbsp;
                </div>
                </div> 
    
                <div class="filterdropdown">
                    <button type="button" class="dropbtn">여행유형 
                    <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <table>
                            <tr>
                                <td><input type="radio" name="type" value="가족">가족</td>
                                <td><input type="radio" name="type" value="여자끼리">여자끼리</td>
                                <td><input type="radio" name="type" value="남자끼리">남자끼리&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="type" value="커플">커플</td>
                                <td><input type="radio" name="type" value="여자혼자">여자혼자</td>
                                <td><input type="radio" name="type" value="남자혼자">남자혼자&nbsp;&nbsp;&nbsp;</td>
                            </tr>           
                        </table>
                        
                    </div>
                </div> 
    
                <div class="filterdropdown">
                    <button type="button" class="dropbtn">이동수단
                    <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <table>
                            <tr>
                                <td><input type="checkbox" name="trans" value="도보">도보</td>
                                <td><input type="checkbox" name="trans" value="대중교통">대중교통</td>
                                <td><input type="checkbox" name="trans" value="자전거">자전거&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="trans" value="택시">택시</td>
                                <td><input type="checkbox" name="trans" value="승용차">승용차</td>
                                <td><input type="checkbox" name="trans" value="전동킥보드">전동킥보드&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                        
                    </div>
                </div> 
                <div class="filterdropdown" style="width:30px;">
                    &nbsp;
                </div>
                <div style="margin-top:11px;">
                    <input type="text" style="width:170px;height:30px; border:1px solid rgb(218, 218, 218)" name="keyword">&nbsp;
                    <button type="submit" class="btn btn-outline-secondary btn-sm" >검색</button>
                    <button type="button" onclick="location.href='<%=contextPath %>/list.pl?currentPage=1';" class="btn btn-outline-secondary btn-sm">초기화</button>                    
                </div>

            </div>
        </form>
        <div style="font-size:16px;padding: 10px;margin-bottom:20px;">
        	검색조건 &gt; <%=result %>
        </div>
        
        <div class="listArea">
            <%if(list.isEmpty()){ %>
            <div align="center" style="height:100px; font-size:17px;"><br><br>조회 결과가 없습니다.</div>
            <%}else{ %>
            	<%for(int i=0;i<list.size();i++){ %>
	            <div class="thumbnail" align="center">
	            	<input type="hidden" value="<%= list.get(i).getPlanNo() %>">
	                <div style="margin-bottom:15px;"><img src="<%=contextPath %>/resources/images/map2.jpg" width="227" height="170" style="border-radius:5px;"></div>
	                <div align="left">
	                    <div style="font-size:14px;margin-bottom:5px;"><%= list.get(i).getStartDate() %> ~ <%= list.get(i).getEndDate() %></div>
	                    <div style="margin-bottom:5px;overflow:hidden; white-space: nowrap;text-overflow: ellipsis; width:210px;font-size:18px;"><%= list.get(i).getPlanTitle() %></div>
	                    <div><%= list.get(i).getPlanWriter() %> </div>
	                </div>
	            </div>
	            
	            <%} %>
            <%} %>

        </div>

        <div id="pagingArea" style="margin-top: 30px;" align="center">
			<table>
				<tr>
					<td width="150"><span style="font-size:17px;">총 일정 수 &nbsp;&nbsp;&nbsp;
					<b style="color:grey;"><%=listCount %></b> 개
					</span></td>
					<td width="680px;">
						<div align="center">
							<% if(currentPage != 1){ %>
							<button onclick="location.href='<%= contextPath %>/list.pl?currentPage=1&sDate=<%=sDate %>&eDate=<%=eDate %><%=age %>&type=<%=type %><%=trans %>&keyword=<%=keyword %>';" class="btn btn-secondary btn-sm">&lt;&lt;</button>
							<button onclick="location.href='<%= contextPath %>/list.pl?currentPage=<%= currentPage-1 %>&sDate=<%=sDate %>&eDate=<%=eDate %><%=age %>&type=<%=type %><%=trans %>&keyword=<%=keyword %>';" class="btn btn-secondary btn-sm">&lt;</button>
							<% } %>
	
							<% for(int p=startPage; p<=endPage; p++){ %>
								<% if(p != currentPage){ %>
								<button onclick="location.href='<%= contextPath %>/list.pl?currentPage=<%= p %>&sDate=<%=sDate %>&eDate=<%=eDate %><%=age %>&type=<%=type %><%=trans %>&keyword=<%=keyword %>';" class="btn btn-outline-secondary btn-sm"><%= p %></button>
								<% }else{ %>	
								<button disabled class="btn btn-outline-secondary btn-sm"><%= p %></button>
								<% } %>
							<% } %>
	
							<% if(currentPage != maxPage){ %>
							<button onclick="location.href='<%= contextPath %>/list.pl?currentPage=<%= currentPage+1 %>&sDate=<%=sDate %>&eDate=<%=eDate %><%=age %>&type=<%=type %><%=trans %>&keyword=<%=keyword %>';" class="btn btn-secondary btn-sm">&gt;</button>
							<button onclick="location.href='<%= contextPath %>/list.pl?currentPage=<%= maxPage %>&sDate=<%=sDate %>&eDate=<%=eDate %><%=age %>&type=<%=type %><%=trans %>&keyword=<%=keyword %>';" class="btn btn-secondary btn-sm">&gt;&gt;</button>
							<% } %>
						</div>
					</td>
					<td width="150">
						
					</td>
				</tr>
			</table>
        </div>
     	<script>
        	$(function(){
				$(".thumbnail").click(function(){
					
					location.href="<%=contextPath%>/detail.pl?pno=" + $(this).children().eq(0).val();
				});
        	});
        </script>



       
    </div>
	
	
	<%@include file="../common/footer.jsp" %>

</body>
</html>