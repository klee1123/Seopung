
package com.kh.information.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.Member.model.vo.Member;
import com.kh.common.MyFileRenamePolicy;
import com.kh.information.model.dao.InfoDao;
import com.kh.information.model.service.InfoService;
import com.oreilly.servlet.MultipartRequest;

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
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profilePic_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String userIntro = multiRequest.getParameter("userIntro");
			String email = multiRequest.getParameter("email");
			
			Member m = new Member();
			m.setUserNo(userNo);
			m.setUserIntro(userIntro);
			m.setEmail(email);
			
			if(multiRequest.getOriginalFileName("profile") != null) {
				String changeName = multiRequest.getFilesystemName("profile");
				m.setProfile("resources/profilePic_upfiles/" + changeName); // 새로운 썸네일 경로 담기
			}else { // 없을 경우
				
				Member mem = new InfoService().selectMember(userNo); //기존 게시글 정보를 담는 객체
				m.setProfile(mem.getProfile()); // 기존 썸네일 경로 담아주기
			}
			
			Member updateMem = new InfoService().updateInfo(m);
					
			if(updateMem != null) { // 정보변경 성공 했을 경우 => 마이페이지 보여주기
				
				HttpSession session = request.getSession();
				
				session.setAttribute("alertMsg", "회원정보 수정 성공");
				response.sendRedirect(request.getContextPath() + "/myPage.me");
				
				
			}else {  // 실패
				
				request.setAttribute("errorMsg", "회원정보 수정 실패");
				RequestDispatcher view = request.getRequestDispatcher("../views/common/errorPage.jsp");
				view.forward(request, response);
				
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
