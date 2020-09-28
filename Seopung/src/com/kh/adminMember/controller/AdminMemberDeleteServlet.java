package com.kh.adminMember.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminMember.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberDeleteServlet
 */
@WebServlet("/adminPage/delete.me")
public class AdminMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int delUserNo = Integer.parseInt(request.getParameter("deleteUserNo"));
		
		int result = new MemberService().deleteMember(delUserNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "회원 탈퇴 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/list.me?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "회원 탈퇴 실패");
			request.getRequestDispatcher("../views/admin/common/errorPage.jsp").forward(request, response);
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
