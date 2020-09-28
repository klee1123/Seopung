<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../../resources/css/style.css">
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">

</head>


<body>

    <class class="accomRequest">
	
		<div class="accomTitle">
	        
	            <h1>&nbsp;&nbsp;&nbsp;신청 온 동행인</h1>
	            <hr>
	        
			<div class="request"> <br>
                <table id="accomList" align="center" class = "table table-hover">
                    <thead>
                        <tr align="center" class="head">
                            <th><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
                            <th width="150">아이디</th>
                            <th width="100">이름</th>
                            <th width="100">신청날짜</th>
                            <th width="150">동행내용</th>
                            <th width="200">수락여부</th>
                            <th width="70">신고</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr align="center">
                            <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                            <td>아이디 넣을칸</td>
                            <td>이름</td>
                            <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="btn btn-outline-primary btn-sm" style="font-size: 10px;" data-toggle="modal" data-target="#accept">수락</a> /
                                <a href="#" class="btn btn-outline-warning btn-sm" style="font-size: 10px;"  data-toggle="modal" data-target="#refusal">거절</a>
                            </td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" style="font-size: 10px;" data-target="#report">신고</a></td>

                        </tr>

                        <tr align="center">
                            <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                            <td>아이디 넣을칸</td>
                            <td>이름</td>
                            <td>2020.09.19</td>
                            <td>asdasdasdasd</td>
                            <td><a href="#" class="btn btn-outline-primary btn-sm" style="font-size: 10px;" data-toggle="modal" data-target="#accept">수락</a> /
                                <a href="#" class="btn btn-outline-warning btn-sm" style="font-size: 10px;"  data-toggle="modal" data-target="#refusal">거절</a>
                            </td>
                            <td><a href="#"  class="btn btn-outline-danger btn-sm" style="font-size: 10px;" data-target="#report">신고</a></td>

                        </tr>
                    
                    </tbody>

                </table>

            </div>
        </div>
        
    </class>


    
</body>
</html>