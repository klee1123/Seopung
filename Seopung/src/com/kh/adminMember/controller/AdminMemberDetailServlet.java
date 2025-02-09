package com.kh.adminMember.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.adminMember.model.service.MemberService;
import com.kh.adminMember.model.vo.Member;

/**
 * Servlet implementation class adminMemberDetailServlet
 */
@WebServlet("/adminPage/detail.me")
public class AdminMemberDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getCategory() == 2){
		
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			
			Member m = new MemberService().selectMember(userNo);
			
			if(m!=null) {
				request.setAttribute("pageTitle", "회원 상세정보");
				request.setAttribute("m", m);
				request.getRequestDispatcher("../views/admin/manage_member/member/manageMemberDetailView.jsp").forward(request, response);
				
			}else {
				request.setAttribute("errorMsg", "회원 상세조회 실패");
				request.getRequestDispatcher("../views/admin/common/errorPage.jsp").forward(request, response);
			}
	
		}else{
			request.setAttribute("errorMsg", "로그인 후 이용 가능한 서비스 입니다.");
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
