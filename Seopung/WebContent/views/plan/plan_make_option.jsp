<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

<head>

<meta charset="utf-8">
<title>일정 만들기 - 옵션</title>
<style>

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css); 
.notosanskr * { font-family: 'Noto Sans KR', sans-serif; }

div {
	box-sizing: border-box;
}

.wrap {
	width: 1200px;
	height: 1000px;
	margin: auto;
	margin-top: 120px;
	font-family: 'Noto Sans KR', sans-serif; 
}


.so_title {
	font-size: 18px;
	font-weight: bold;
}

.plan_type>div {
	width: 120px;
	float: left;
}

.plan_sec {
	margin-top: 20px;
	height: 60px;
}

.bbtn {
	display: inline-block;
	border: 1px solid #dfdfdf;
	background: #00c0ff;
	color: #fff;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 999;
	cursor: pointer;
}

.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 999;
	cursor: pointer;
}

.box-radio-input input[type="radio"]:checked+span {
	background: #00c0ff;
	color: #fff;
}

.box-check-input input[type="checkbox"] {
	display: none;
}

.box-check-input input[type="checkbox"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 8px;
	text-align: center;
	width: 100px;
	height: 42px;
	line-height: 42px;
	font-weight: 500;
	cursor: pointer;
}

.box-check-input input[type="checkbox"]:checked+span {
	background: #00c0ff;
	color: #fff;
}
</style>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="wrap">

		<form action="<%= contextPath %>/planOption.po"  style ="width: 720px; height: 1000px; margin: auto;" method="GET">
			<div class="plan_sec">
				<div class="so_title">일정만들기 < 1 / 2 ></div>
				<div class="so_title">
					<input type="text" style="width: 700px" name="planTitle" id="plan_title"
						placeholder="일정 제목">
				</div>
			</div>
			<div class="plan_sec" style="margin-top: 0px;">
				<div class="">일정 날짜</div>
				<div class="">
					<table>
						<tr>
							<td style="width: 350px;">
								<div class="">
									<input type="date" name="planSdate" id="plan_sdate" size="12">

								</div>
							</td>
							<td>
								<div class="">
									<input type="date" name="planEdate" id="plan_edate" size="12">

								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>



			<div class="plan_sec" style="margin-top: 0px;">
				<div class="so_title">여행 유형</div>
				<div class="plan_type">
					<div class="">
						<label class="box-radio-input"><input type="radio"
							name="planType" value="남자끼리" checked="checked"><span>남자끼리</span></label>
					</div>
					<div>
						<label class="box-radio-input"><input type="radio"
							name="planType" value="여자끼리"><span>여자끼리</span></label>
					</div>
					<div>
						<label class="box-radio-input"><input type="radio"
							name="planType" value="가족"><span>가족</span></label>
					</div>
					<div>
						<label class="box-radio-input"><input type="radio"
							name="planType" value="커플"><span>커플/신혼</span></label>
					</div>
					<div>
						<label class="box-radio-input"><input type="radio"
							name="planType" value="남자혼자"><span>남자혼자</span></label>
					</div>
					<div>
						<label class="box-radio-input"><input type="radio"
							name="planType" value="여자혼자"><span>여자혼자</span></label>
					</div>
				</div>
			</div>

			<div class="plan_sec">
				<div class="so_title">연령대(복수선택가능)</div>
				<div class="plan_type">
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planAge" value="10" checked="checked"><span>10대</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planAge" value="20"><span>20대</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planAge" value="30"><span>30대</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planAge" value="40"><span>40대</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planAge" value="50"><span>50대</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planAge" value="60"><span>60대</span></label>
					</div>
				</div>
			</div>
			<div class="plan_sec">
				<div class="so_title">이동수단(복수선택가능)</div>
				<div class="plan_type">
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planTrans" value="도보" checked="checked"><span>도보</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planTrans" value="택시"><span>택시</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planTrans" value="대중교통"><span>대중교통</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planTrans" value="전동킥보드"><span>전동킥보드</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planTrans" value="자가용"><span>자가용</span></label>
					</div>
					<div class="">
						<label class="box-check-input"><input type="checkbox"
							name="planTrans" value="자전거"><span>자전거</span></label>
					</div>
				</div>
			</div>

			<div class="plan_sec" style="width: 720px;">
				<div class="so_title">동행 유무</div>
				<div class="plan_type">
					<div class="">
						<label class="box-radio-input"><input type="radio"
							name="planAcc" value="y" checked="checked"><span>동행</span></label>
					</div>
					<div class="">
						<label class="box-radio-input"><input type="radio"
							name="planAcc" value="n"><span>비동행</span></label>
					</div>
				</div>

			</div>

			<div class="plan_sec" style="width: 720px; float: left;">
				<div class="so_title">일정 예산금액</div>
				<div class="plan_budget">
					<div class="">
						<input type="text" style="width: 220px; height: 30px;"
							name="planBudget" placeholder="예산금액">
					</div>
				</div>
			</div>

			<div style="width: 720px; float: left;">
				<table>
					<tr>
						<td style="width: 350px;">
							<div class="plan_sec">
								<div class="so_title">스크랩 허용</div>
								<div class="plan_type">
									<div class="">
										<label class="box-radio-input"><input type="radio"
											name="planScrapYn" value="y" checked="checked"><span>허용</span></label>
									</div>
									<div class="">
										<label class="box-radio-input"><input type="radio"
											name="planScrapYn" value="n"><span>비허용</span></label>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="plan_sec">
								<div class="so_title">일정 공개 여부</div>
								<div class="plan_type">
									<div class="">
										<label class="box-radio-input"><input type="radio"
											name="planPrivate" value="y" checked="checked"><span>공개</span></label>
									</div>
									<div class="">
										<label class="box-radio-input"><input type="radio"
											name="planPrivate" value="n"><span>비공개</span></label>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div class="plan_sec">
				<div>
					<textarea name="planMemo"
						style="margin-top: 10px; resize: none; width: 720px; height: 200px"
						placeholder=" 내용을 입력해주세요"></textarea>
				</div>
				<div style="margin-top: 10px;">
					<input type="text" name="planHashtag" style="width: 720px" placeholder="해시태그">
				</div>
			</div>

			<div class="plan_sec" style="margin-top: 370px;">
				<div style="float: left;">
					<button class="bbtn" type="submit" name="planTemp" value="y">임시
						저장</button>
				</div>

				<div style="text-align: right;">
					<button class="bbtn" type="submit" name="planTemp" value="n">다음 페이지</button>
				</div>
			</div>
		</form>
		<%@include file="../common/footer.jsp"%>
	</div>
	
	
	
		
		
</body>

</html>