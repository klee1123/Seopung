<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
    <style>
        .outer{
            margin:auto;
        margin-top:100px;
        width:800px;
            background:lightgrey;
        }
        input[type=text]{
            width:700px;
            height:35px;
            border:none;
            border-radius:5px;
            
        }
        #summerForm>button{
            height:40px;
            border:none;
            margin:10px;
            border-radius:5px;
            
        }    
    
    </style>
  </head>
  <body>
	<div class="outer">
	        <br>
	        <div style="margin-left:25px;">
	            제목  <input type="text" name="title" id="title">
	        </div>
	        <br>
	        <form method="post" id="summerForm" >
	            <textarea id="summernote" name="editordata" style="resize:none;"></textarea>
	            <button type="submit">등록하기</button>
	            <button>취소하기</button>
	        </form>
	    </div>
	        
	        <script>
	          $(document).ready(function() {
	              //여기 아래 부분
	              $('#summernote').summernote({
	                    
	                    width: 800,
	                    height: 500,                 // 에디터 높이
	                    minHeight: 500,             // 최소 높이
	                    maxHeight: 500,             // 최대 높이
	                    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	                    lang: "ko-KR",					// 한글 설정
	                    placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	                    
	                    
	                    
	              });
	          });
	          </script>



</body>
</html>