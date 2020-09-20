<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.outer {
	width: 1000px;
	margin: auto;
}

.searchList {
	width: 1000px;
	background: rgb(236, 235, 235);
	padding: 10px;
}

.searchList>p {
	font-size: 12px;
}

.outer span {
	color: orangered;
}

.outer hr {
	margin-top: 0;
}
</style>
<body>
	<%@include file="../common/menubar.jsp" %>
	
    <div class="outer">
    	
        <br><br><br><br><br>
        <h2 align="center">통합검색결과</h2> <br>
        <img width="18px" src="<%=contextPath %>/resources/images/icon_magnifier2.png" alt="">
        <b style="font-size: 18px;">&nbsp;"키워드"에 대한 검색 결과 입니다.</b>
    
        <br><br>

        <b>일정서비스(<span>9</span>건)</b>
        <!-- 검색내역 최대 3개? -->
        <div class="searchList">
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p style="margin-bottom: 0;">내용입니다.</p>
        </div>
        <!-- 검색내역 3개 초과시 -->
        <div class="searchList collapse" id="showList1">
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
        </div>
        <br>
        <div align="center">
            <button type="button" class="btn btn-primary"  data-toggle="collapse" data-target="#showList1">더보기</button>
        </div>

        <br><br>

        <b>커뮤니티(<span>10</span>건)</b>
        <!-- 검색내역 최대 3개? -->
        <div class="searchList">
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p style="margin-bottom: 0;">내용입니다.</p>
        </div>
        <!-- 검색내역 3개 초과시 -->
        <div class="searchList collapse" id="showList2">
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
        </div>
        <br>
        <div align="center">
            <button type="button" class="btn btn-primary"  data-toggle="collapse" data-target="#showList2">더보기</button>
        </div>

        <br><br>

        <b>추천코스(<span>0</span>건)</b>
        <div class="searchList">
            <!-- 검색내역 0개 일 때 -->
            <p align="center">
                검색 결과가 없습니다. 다른 검색어로 검색해주세요.
            </p>
        </div>
        <!-- 검색내역 3개 초과시 -->
        <!-- <div class="searchList collapse" id="showList3">
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
        </div>
        <br>

        <div align="center">
            <button type="button" class="btn btn-primary"  data-toggle="collapse" data-target="#showList3">더보기</button>
        </div> -->
        
        <br><br>

        고객센터(<span>0</span>건)
        <div class="searchList">
            <!-- 검색내역 0개 일 때 -->
            <p align="center">
                검색 결과가 없습니다. 다른 검색어로 검색해주세요.
            </p>
        </div>
        <!-- 검색내역 3개 초과시 -->
        <!-- <div class="searchList collapse" id="showList3">
            <hr>
            <a href="">키워드를 포함한 제목</a><br>
            <p>내용입니다.</p>
        </div>
        <br>

        <div align="center">
            <button type="button" class="btn btn-primary"  data-toggle="collapse" data-target="#showList3">더보기</button>
        </div> -->
        
        <br><br>
    
    </div>
	
	<%@include file="../common/footer.jsp" %>

</body>
</html>