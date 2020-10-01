<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.adminCommunity.model.vo.Community, 
com.kh.adminPlan.model.vo.Plan, com.kh.adminRecommend.model.vo.Recommend" %>
<%
	
	String keyword = (String)request.getAttribute("keyword");

	int pCount = (int)request.getAttribute("pCount");
	int cCount = (int)request.getAttribute("cCount");	
	int rCount = (int)request.getAttribute("rCount");	

	ArrayList<Plan> plist = (ArrayList<Plan>)request.getAttribute("plist");
	ArrayList<Community> clist = (ArrayList<Community>)request.getAttribute("clist");
	ArrayList<Recommend> rlist = (ArrayList<Recommend>)request.getAttribute("rlist");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.outer {
	width: 820px;
	margin: auto;
	margin-top:120px;
}
.searchList {
	width: 820px;
	background: rgb(245, 245, 245);
	padding: 15px;
}
.outer span {
	color: orangered;
}
.outer a{margin:10px;font-size:15px;}
#more1, #more2, #more3 {display: none;}
</style>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<br>
	
    <div class="outer">
    	
        
        <h2 align="center">통합검색결과</h2> <br><br>
        <img width="20px" src="<%=contextPath %>/resources/images/icon_magnifier2.png" alt="">
        <b style="font-size: 20px; color:black;">&nbsp;"<%=keyword %>" 에 대한 검색 결과 입니다.</b>
    
        <br><br>

        <b style="font-size: 17px; color:black;">일정서비스 (<span><%=pCount %></span>건)</b>
        <!-- 검색내역 최대 3개? -->
        <div class="searchList">
        	<%if(pCount > 0){ %>
	            <%for(int i=0; i<plist.size(); i++){ %>
	            	<%if(i==0){ %>
			            <a href=""><%=plist.get(i).getPlanTitle() %></a>
			        <%}else if(i==3 && plist.size()==4){ %> 
			            <hr>
			            <span id="more1">
			            <a href=""><%=plist.get(i).getPlanTitle() %></a>
			            <hr>
			            </span>
	            	<%}else if(i==3){ %>
			            <hr>
		            	<span id="more1">
			            <a href=""><%=plist.get(i).getPlanTitle() %></a>
		            <%}else if(i>2 && i==plist.size()-1){ %>
		            	<hr>
			            <a href=""><%=plist.get(i).getPlanTitle() %></a>
			            <hr>
			            </span>
		            <%}else{ %>
		            	<hr>
		            	<a href=""><%=plist.get(i).getPlanTitle() %></a>
		            <%} %>
	            <%} %>
	            
	            <%if(plist.size()>3){ %>
		        <div align="center">
		            <button type="button" class="btn btn-outline-dark btn-sm" onclick="myFunction1()" id="myBtn1">더보기</button>
		        </div>
		        <%} %>
            <%}else{ %>
            <p align="center" style="font-size:15px;">
                검색 결과가 없습니다. 다른 검색어로 검색해주세요.
            </p>
            <%} %>
        </div>
        <br>

        <br><br>

        <b style="font-size: 17px; color:black;">커뮤니티 (<span><%=cCount %></span>건)</b>
        <!-- 검색내역 최대 3개? -->
        <div class="searchList">
            <%if(cCount > 0){ %>
	            <%for(int i=0; i<clist.size(); i++){ %>
	            	<%if(i==0){ %>
			            <a href=""><%=clist.get(i).getTitle() %></a>
			        <%}else if(i==3 && clist.size()==4){ %> 
			            <hr>
			            <span id="more2">
			            <a href=""><%=clist.get(i).getTitle() %></a>
			            <hr>
			            </span>
	            	<%}else if(i==3){ %>
			            <hr>
		            	<span id="more2">
			            <a href=""><%=clist.get(i).getTitle() %></a>
		            <%}else if(i>2 && i==clist.size()-1){ %>
		            	<hr>
			            <a href=""><%=clist.get(i).getTitle() %></a>
			            <hr>
			            </span>
		            <%}else{ %>
		            	<hr>
		            	<a href=""><%=clist.get(i).getTitle() %></a>
		            <%} %>
	            <%} %>
	            
	            <%if(clist.size()>3){ %>
		        <div align="center">
		            <button type="button" class="btn btn-outline-dark btn-sm" onclick="myFunction2()" id="myBtn2">더보기</button>
		        </div>
		        <%} %>
            <%}else{ %>
            <p align="center" style="font-size:15px;">
                검색 결과가 없습니다. 다른 검색어로 검색해주세요.
            </p>
            <%} %>
        </div>

        <br><br>

        <b style="font-size: 17px; color:black;">추천코스 (<span><%=rCount %></span>건)</b>
        <div class="searchList">
        	<%if(rCount > 0){ %>
	            <%for(int i=0; i<rlist.size(); i++){ %>
	            	<%if(i==0){ %>
			            <a href=""><%=rlist.get(i).getRecommendTitle() %></a>
			        <%}else if(i==3 && rlist.size()==4){ %> 
			            <hr>
			            <span id="more3">
			            <a href=""><%=rlist.get(i).getRecommendTitle() %></a>
			            <hr>
			            </span>
	            	<%}else if(i==3){ %>
			            <hr>
		            	<span id="more3">
			            <a href=""><%=rlist.get(i).getRecommendTitle() %></a>
		            <%}else if(i>2 && i==rlist.size()-1){ %>
		            	<hr>
			            <a href=""><%=rlist.get(i).getRecommendTitle() %></a>
			            <hr>
			            </span>
		            <%}else{ %>
		            	<hr>
		            	<a href=""><%=rlist.get(i).getRecommendTitle() %></a>
		            <%} %>
	            <%} %>
	            
	            <%if(rCount > 3){ %>
		        <div align="center">
		            <button type="button" class="btn btn-outline-dark btn-sm" onclick="myFunction3()" id="myBtn3">더보기</button>
		        </div>
		        <%} %>
            <%}else{ %>
            <p align="center" style="font-size:15px;">
                검색 결과가 없습니다. 다른 검색어로 검색해주세요.
            </p>
            <%} %>
        </div>
        
        

    
    </div>
    
    <script>
		function myFunction1() {
		  	var moreText = document.getElementById("more1");
		  	var btnText = document.getElementById("myBtn1");
		
		  	if (moreText.style.display === "inline") {
		    	btnText.innerHTML = "더보기"; 
		    	moreText.style.display = "none";
		  	} else {
		    	btnText.innerHTML = "닫기"; 
		    	moreText.style.display = "inline";
		  	}
		}
		
		function myFunction2() {
		  	var moreText = document.getElementById("more2");
		  	var btnText = document.getElementById("myBtn2");
		
		  	if (moreText.style.display === "inline") {
		    	btnText.innerHTML = "더보기"; 
		    	moreText.style.display = "none";
		  	} else {
		    	btnText.innerHTML = "닫기"; 
		    	moreText.style.display = "inline";
		  	}
		}
		
		function myFunction3() {
		  	var moreText = document.getElementById("more3");
		  	var btnText = document.getElementById("myBtn3");
		
		  	if (moreText.style.display === "inline") {
		    	btnText.innerHTML = "더보기"; 
		    	moreText.style.display = "none";
		  	} else {
		    	btnText.innerHTML = "닫기"; 
		    	moreText.style.display = "inline";
		  	}
		}
	</script>
	
	<%@include file="../common/footer.jsp" %>

</body>
</html>