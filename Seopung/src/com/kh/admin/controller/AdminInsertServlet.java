package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Admin;

/**
 * Servlet implementation class AdminInsertServlet
 */
@WebServlet("/insert.ad")
public class AdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		String adminName = request.getParameter("adminName");
		
		Admin ad = new Admin();
		ad.setAdminId(adminId);
		ad.setAdminPwd(adminPwd);
		ad.setAdminName(adminName);
		
		int result = new AdminService().insertAdmin(ad);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "관리자 등록 성공");
			response.sendRedirect(request.getContextPath() + "/list.ad?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "관리자 등록 실패");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp");
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
