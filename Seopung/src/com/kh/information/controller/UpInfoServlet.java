
package com.kh.information.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.Member.model.vo.Member;
import com.kh.common.MyFileRenamePolicy;
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
			
			String changeName = multiRequest.getFilesystemName("profile");
			m.setProfile("resources/profilePic_upfiles/" + changeName);
			
			int result = new InfoService().updateInfo(m);
					
			if(result > 0) { 
				
				request.getSession().setAttribute("alertMsg", "게시글 수정 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/myPage.me");
				
			}else { 
				
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
