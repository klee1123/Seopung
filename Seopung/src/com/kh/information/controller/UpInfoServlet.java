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
		
			String userId = multiRequest.getParameter("userId");
			String userIntro = multiRequest.getParameter("userIntro");
			String profile = multiRequest.getParameter("profile");
			
			
			Member updateMem = new InfoService().updateInfo(userId, userIntro, profile);
			
			HttpSession session = request.getSession();
			
			if(updateMem != null) { // 비밀번호 변경 성공
				
				session.setAttribute("alertMsg", "성공적으로 정보를 변경됐습니다.");
				session.setAttribute("loginUser", updateMem);
				
			}else { // 실패
				session.setAttribute("alertMsg", "정보변경에 실패했습니다");
			}
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
