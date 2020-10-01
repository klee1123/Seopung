package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Admin;
import com.kh.Member.model.vo.LoginUser;;

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/adminPage/update.ad")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int adminNo = Integer.parseInt(request.getParameter("adminNo"));
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		String adminName = request.getParameter("adminName");
		
		Admin ad = new Admin(adminNo, adminName, adminId, adminPwd);
		
		int result = new AdminService().updateAdmin(ad);
		
		if(result > 0) {
			
			LoginUser loginUser= (LoginUser)request.getSession().getAttribute("loginUser");
			loginUser.setUserName(adminName);

			request.getSession().setAttribute("loginUser", loginUser);
			request.getSession().setAttribute("alertMsg", "관리자 수정 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/myPage.ad?adminNo=" + adminNo);
			
		}else {
			request.setAttribute("errorMsg", "관리자 수정 실패");
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
