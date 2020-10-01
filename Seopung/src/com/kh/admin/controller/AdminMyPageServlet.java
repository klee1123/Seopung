package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Admin;

/**
 * Servlet implementation class AdminMyPageServlet
 */
@WebServlet("/adminPage/myPage.ad")
public class AdminMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int adminNo = Integer.parseInt(request.getParameter("adminNo"));

		if(request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getUserNo() == adminNo) {
		
			
			Admin ad = new AdminService().selectAdmin(adminNo);
			
			if(ad!=null) {
				request.setAttribute("ad", ad);
				request.setAttribute("pageTitle", "개인정보");
				
				request.getRequestDispatcher("../views/admin/manage_member/admin/manageAdminMyPage.jsp").forward(request, response);
			}else {
				request.setAttribute("errorMsg", "프로필 조회 실패");
				request.getRequestDispatcher("../views/admin/common/errorPage.jsp").forward(request, response);
			}
		}else {
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
