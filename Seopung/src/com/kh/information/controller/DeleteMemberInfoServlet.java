package com.kh.information.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.information.model.service.InfoService;

/**
 * Servlet implementation class DeleteMemberInfoServlet
 */
@WebServlet("/deleteM.in")
public class DeleteMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userPwd = request.getParameter("userPwd");
		
		int result = new InfoService().deleteMember(userNo,userPwd);
		
		if(result > 0) { // 탈퇴 성공 => 세션에 담겨있는 loginUser지워준 후 -> 메인페이지 재요청
			HttpSession session = request.getSession();
			
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg","성공적으로 회원탈퇴 되었습니다.");
			
			response.sendRedirect(request.getContextPath());
			
		}else { // 실패
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","회원탈퇴 실패! 비밀번호를 확인해주세요");
			
			RequestDispatcher view = request.getRequestDispatcher("views/myPage/deleteMemberPage.jsp");
			view.forward(request,response);
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
