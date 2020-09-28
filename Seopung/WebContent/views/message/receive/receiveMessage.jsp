<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

      width: 1100px;
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
    
    <body>

  

        <%@ include file="../../common/menubar.jsp" %>
        <%@ include file="../../myPage/common/myPageSidebar.jsp" %>
        
        
        <class class="receiveMessage">
        
            <div class="messageTitle">

                    
                    <h1>&nbsp;&nbsp;&nbsp;<b style="color:black;">받은 메세지함</b></h1>
                    <hr>
                
                <div class="receive"> <br>
                    
                    <a href="#"  class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px; float: right; margin-right: 10px;">선택삭제</a>    
                    <form action="" method="POST">
                    <br>
                  
                   
                    <br>    
                        <table id="messageList"  align="center" class ="table table-hover">
                            <thead>
                                <tr align="center" class="head">
                                    <th width="70"><input type="checkbox" class="chk" id="chk_all" name="chkAll">&nbsp;&nbsp;번호</th>
                                    <th width="150">발신자 아이디</th>
                                    <th width="100">닉네임</th>
                                    <th width="100">수신일</th>
                                    <th width="300">메세지내용</th>
                                    <th width="200"></th>
                                    <th width="70">신고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr align="center" style="line-height: 2;">
                                    <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                                    <td >아이디 넣을칸</td>
                                    <td>닉네임</td>
                                    <td>2020.09.19</td>
                                    <td><a href="#" data-toggle="modal" data-target="#messageContent">asdasdasdasd</a></td>
                                    <td><a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#reply" style="font-size: 10px;">답장하기</a>
                                    </td>
                                    <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px;">신고</a></td>
        
                                </tr>
        
                                <tr align="center" style="line-height: 2;">
                                    <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                                    <td >아이디 넣을칸</td>
                                    <td>닉네임</td>
                                    <td>2020.09.19</td>
                                    <td><a href="#">asdasdasdasd</a></td>
                                    <td><a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#reply" style="font-size: 10px;">답장하기</a>
                                    </td>
                                    <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px;">신고</a></td>
        
                                </tr>

                                <tr align="center" style="line-height: 2;">
                                    <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                                    <td >아이디 넣을칸</td>
                                    <td>닉네임</td>
                                    <td>2020.09.19</td>
                                    <td><a href="#">asdasdasdasd</a></td>
                                    <td><a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#accept" style="font-size: 10px;">답장하기</a>
                                    </td>
                                    <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px;">신고</a></td>
        
                                </tr>

                                <tr align="center" style="line-height: 2;">
                                    <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                                    <td >아이디 넣을칸</td>
                                    <td>닉네임</td>
                                    <td>2020.09.19</td>
                                    <td><a href="#">asdasdasdasd</a></td>
                                    <td><a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#accept" style="font-size: 10px;">답장하기</a>
                                    </td>
                                    <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px;">신고</a></td>
        
                                </tr>

                                <tr align="center" style="line-height: 2;">
                                    <td><input type="checkbox"id="chk" name="chk1">&nbsp;&nbsp;1</td>
                                    <td >아이디 넣을칸</td>
                                    <td>닉네임</td>
                                    <td>2020.09.19</td>
                                    <td><a href="#">asdasdasdasd</a></td>
                                    <td><a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#accept" style="font-size: 10px;">답장하기</a>
                                    </td>
                                    <td><a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#report"  style="font-size: 10px;">신고</a></td>
        
                                </tr>
                            
                            </tbody>
                        </table>
                    
                
                    </form>


                    
	            <br><br>
	            <div class="pagingArea" align="center">
	
                    <div align="center">
                        <button class="btn btn-secondary btn-sm">&lt;&lt;</button>
                        <button class="btn btn-secondary btn-sm">&lt;</button>

                        <button class="btn btn-outline-secondary btn-sm">1</button>
                        <button class="btn btn-outline-secondary btn-sm">2</button>
                        <button class="btn btn-outline-secondary btn-sm">3</button>
                        <button class="btn btn-outline-secondary btn-sm">4</button>
                        <button class="btn btn-outline-secondary btn-sm">5</button>

                        <button class="btn btn-secondary btn-sm">&gt;</button>
                        <button class="btn btn-secondary btn-sm">&gt;&gt;</button>
                    
                    </div>
                </div>
                
                <!-- 신고하기 modal -->

                <div class="modal" id="report">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">신고 작성</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                        
                                <form action="" method="post">
            
                                    <table>
                                        <tr>
                                            <th>신고 사유</th>
                                                
                                            <td>
                                                <div class="default-select" id="default-select_2">
                                                    <select>
                                                        <option value="1">영리목적, 홍보성</option>
                                                        <option value="1">불법성</option>
                                                        <option value="1">욕설,인신공격</option>
                                                        <option value="1">도배 및 광고</option>
                                                        <option value="1">개인정보 노출</option>
                                                        <option value="1">음란성, 선정성</option>
                                                        <option value="1">모방 또는 명의 도용</option>
                                                        <option value="1">기타</option>
                                                    </select>
                                                </div>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>신고 제목 &nbsp;</th>
                                            <td><input type="text" name="reportTitle" required></td>
                                        </tr>
                                        <tr>
                                            <th>신고 내용</th>
                                            <td><textarea name="reportContent" cols="30" rows="10" style="resize: none;" required></textarea></td>
                                        </tr>
                                    </table>
                                    <br>
                                    <button type="submit" class="genric-btn info-border radius">작성</button>
                                    <button type="reset" class="genric-btn danger-border radius">취소</button>
                                    
                                </form>
            
                            </div>
            
                        </div>
                    </div>
                </div>

                <!-- 답장하기 -->
                <div class="modal" id="reply">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">답장하기</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                        
                        
                                            
                                                

                                                <div class="default-select" id="default-select_2" style="margin-bottom: 20px; margin-left: 45px;">
                                                    <select>
                                                        <option value="1" selected>동행1</option>
                                                        <option value="1">동행2</option>
                                                        <option value="1">동행3</option>
                                                        <option value="1">동행4</option>

                                                    </select>
                                                </div>
                                                
                                   
                                            <div>
                                                <textarea name="reportContent" cols="50" rows="10" style="resize: none; " required placeholder="내용을 입력해주세요"></textarea>
                                            </div>
                                    <br>

                                    <div>
                                        <button type="submit" class="genric-btn info-border radius">보내기</button>
                                        <button type="reset" class="genric-btn danger-border radius">취소</button>
                                     </div>
                                
            
                            </div>
            
                        </div>
                    </div>
                </div>



                <!-- 프로필 modal -->
                <div class="modal" id="profile">
                    <div class="modal-dialog" >
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h3 class="modal-title">프로필</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            
                                <div class="profile">
                                    <form action="" method="POST">
                                        
                                         <br><br>
                                    
                                        <div class="profilePhoto" style="float: left;">
                                            <img src="../../../resources/images/회원.jpg" alt="">
                                            <br><br>
                                           
                                        </div>
                                        <div class="profileJoin">
                                            
                                        <table id="join" style="float: left;">
                                            <tr>
                                                <th align="left" width="100px">아이디</th>
                                                <td><span>USERID01 </span></td>
                                            </tr>
                                            
                                            <tr>
                                                <th align="left" width="100px">이름</th>
                                                <td><span>홍길동 </span></td>
                                                
                                            </tr>
                                            <tr>
                                                <th align="left">닉네임</th>
                                                <td><span>홍길홍길</span></td>
                                            
                                            </tr>
                                            <tr>
                                               
                                                </tr>
                                            </tr>
                                            <tr>
                                                <th align="left">이메일</th>
                                                <td><span>hong@gmail.com </span></td>
                                                
                                            </tr>
                                            <tr>
                                                <th align="left">생년월일</th>
                                                <td><span>2020년 07월 01일</span></td>
                                            </tr>
                                            
                                        </table>
                                        <br><br>
                                        </div>
                                        
                                        <textarea name="introduction" cols="50" rows="8"style="resize: none;">자기소개 : </textarea>
                                        
                                        <br><br>

                                        <button class="genric-btn info-border radius">확인</button>

                                    </form>
                                    </div>


                            </div>
                            


                        </div>
                        
                    </div>



                </div>

                <!-- 메세지내용 modal -->
                <div class="modal" id="messageContent">
                    <div class="modal-dialog" >
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h3 class="modal-title">메세지내용</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            
                                <div class="profile">
                                    <form action="" method="POST">
                                        
                                        
                                    
                                        <div class="profilePhoto" style="float: left; margin-left: 50px;" >
                                            <img src="../../../resources/images/회원.jpg" style="width: 20px; height: 20px;" alt="">
                                            <a href="#" data-toggle="modal" data-target="#profile">  아이디 &nbsp;</a>
                                            <a href="#" class="btn btn-outline-warning btn-sm"  style="font-size: 10px;">답장하기</a>
                                            <br><br>
                                           
                                        </div>
                                        
                                        <div>
                                            <textarea name="introduction" cols="50" rows="8"style="resize: none;">메세지내용 </textarea>
                                        </div>
                                        <br><br>

                                        <button class="genric-btn info-border radius">확인</button>

                                    </form>
                                    </div>


                            </div>
                            


                        </div>
                        
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