<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css); 
.notosanskr * { font-family: 'Noto Sans KR', sans-serif; }
</style>

<body>

<div class="container">
  <h4>신고폼 버튼</h4>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">신고하기</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">서풍 신고폼</h4>
        </div>

        <!--신고폼 내용-->
        <div class="outer">
          <br>
          <h2 align="center">서풍에 신고하기</h2>
          <br>
          <h6 align="center">
              *신고하신 내용은 증거자료를 참고하여 서풍 약관에 의거해 조치됩니다.<br>
              * 증거 내용이 불충분하거나 타당한 이유가 아니면 무효 처리됩니다.<br>
              * 허위 신고의 경우 신고자가 제재받을 수 있음을 유념해주세요.<br></h6>
  
          <form action="" id="insertForm" method="post">
              <!-- 카테고리, 제목, 내용, 첨부파일 -->
  
              <table align="center">
                  <tr>
                      <th width="70">신고유형</th>
                      <td width="500">
                          <select name="category">
                              <option value="10">신고 내용을 선택하세요.</option>
                              <option value="20">영리목적</option>
                              <option value="30">불법성</option>
                              <option value="40">욕설</option>
                              <option value="50">도배</option>
                              <option value="60">개인정보노출</option>
                              <option value="70">음란성</option>
                              <option value="80">명의도용</option>
                              <option value="90">기타</option>
                          </select>
                      </td>
                  </tr><br>
  
                  <tr>
                      <th>신고내용</th>
                      <td>
                          <textarea name="content" cols="50" rows="5" style="resize:none;"></textarea>
                      </td>
                  </tr>
  
                  <tr>
                      <th>약관 동의</th>
                      <td><input type='checkbox' name='check' value=""></td>
                  </tr>
  
              </table>
              <br>
          </form>
      </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-default" data-dismiss="modal">제출</button>
        </div>

      </div>
    </div>
  </div>
</div>

</body>
</html>