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
 * Servlet implementation class AdminDetailServlet
 */
@WebServlet("/detail.ad")
public class AdminDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int adminNo = Integer.parseInt(request.getParameter("adminNo"));
		
		Admin ad = new AdminService().selectAdmin(adminNo);
		
		request.setAttribute("ad", ad);
		request.setAttribute("pageTitle", "관리자 상세조회");
		
		request.getRequestDispatcher("views/admin/manage_member/admin/manageAdminDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
