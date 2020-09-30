package com.kh.information.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Member.model.vo.Member;
import com.kh.information.model.service.InfoService;

/**
 * Servlet implementation class UpdateEmailServlet
 */
@WebServlet("/updateEmail.me")
public class UpdateEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String email = request.getParameter("email");
		String updateEmail = request.getParameter("updateEmail");
		
		Member updateMem = new InfoService().updateEmail(userNo, email, updateEmail);
		
		HttpSession session = request.getSession();
		
		if(updateMem != null) { // 비밀번호 변경 성공
			
			session.setAttribute("alertMsg", "성공적으로 닉네임이 변경됐습니다.");
			session.setAttribute("loginUser", updateMem);
			
		}else { // 실패
			session.setAttribute("alertMsg", "닉네임 변경에 실패했습니다");
		}
		response.sendRedirect(request.getContextPath() + "/myPage.me");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
