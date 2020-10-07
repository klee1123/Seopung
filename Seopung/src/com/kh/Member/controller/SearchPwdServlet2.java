package com.kh.Member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.service.MemberService;

/**
 * Servlet implementation class SearchPwdServlet2
 */
@WebServlet("/searchPwd2.me")
public class SearchPwdServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		String id = new MemberService().searchId2(userId, email);
		
		System.out.println(id);
		if(!id.equals("")) {
		request.setAttribute("id", id);
		
		request.getRequestDispatcher("views/member/searchPwd2.jsp").forward(request, response);
		
		}else {
			request.setAttribute("errorMsg", "아이디와 이메일이 일치하지 않습니다.");
			request.getRequestDispatcher("views/member/searchError.jsp").forward(request, response);
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
