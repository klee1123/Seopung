<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">관리자페이지 접속을 종료하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃을 통해 서비스 종료를 원하시면 아래 [확인] 버튼을 선택하여 주십시오.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="<%=request.getContextPath()%>/logout.ad">확인</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<%= request.getContextPath() %>/views/admin/adminResources/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/views/admin/adminResources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%= request.getContextPath() %>/views/admin/adminResources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%= request.getContextPath() %>/views/admin/adminResources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%= request.getContextPath() %>/views/admin/adminResources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%= request.getContextPath() %>/views/admin/adminResources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%= request.getContextPath() %>/views/admin/adminResources/js/demo/datatables-demo.js"></script>


</body>
</html>