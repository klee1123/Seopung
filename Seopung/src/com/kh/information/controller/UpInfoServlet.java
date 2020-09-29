package com.kh.information.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.Member.model.vo.Member;
import com.kh.common.MyFileRenamePolicy;
import com.kh.information.model.service.InfoService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class test
 */
@WebServlet("/updateInfo.in")
public class UpInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 우선 enctype의 multipart/form-data로 잘 전송되었을 때만 전반적인 내용이 수행되게끔
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1_1. 전송되는 파일 용량 제한(int maxSize) => 10mbyte
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 전달된 파일을 저장시킬 서버의 폴더 물리적인 경로 알아내기 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profilePic_upfiles/");
			
		
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			// --> 위의 코드가 실행되는 순간 서버에 파일 업로드 됨
		
			String userNo = multiRequest.getParameter("userNo");
			String userIntro = multiRequest.getParameter("userIntro");
			String profile = multiRequest.getParameter("profile");
			String email = multiRequest.getParameter("email");
			
			Member m = new Member();
			m.setUserId(userNo);
			m.setUserIntro(userIntro);
			m.setProfile(profile);
			m.setEmail(email);
			
			int result = new InfoService().updateInfo(m);
			System.out.println(m);
			// case1:새로운 첨부파일 x		  		=> updateBoard(b, null);				=> Board Update
			// case2:새로운 첨부파일 o, 기존의 첨부파일o => updateBoard(b, fileNo이 담긴at);		=> Board Update, Attachment Update 
			// case3:새로운 첨부파일 o, 기존의 첨부파일x => updateBoard(b, refBoardNo이 담긴 at);	=> Board Update, Attachment Insert
		
			if(result > 0) { // 성공 => 상세조회 재요청(detail.bo?bno=xx)
				
				request.getSession().setAttribute("alertMsg", "게시글 수정 성공했습니다.");
				
			}else { //실패 => 에러페이지
				
				request.setAttribute("errorMsg", "게시글 수정 실패");
				request.getRequestDispatcher("../views/common/errorPage.jsp").forward(request, response);
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
