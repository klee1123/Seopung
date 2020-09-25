package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminDeleteServlet
 */
@WebServlet("/adminPage/delete.ad")
public class AdminDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int delAdminNo = Integer.parseInt(request.getParameter("deleteAdminNo"));
		
		//System.out.println(delAdminNo);
		
		int result = new AdminService().deleteAdmin(delAdminNo);
		
		if(result>0) {
			// 탈퇴 페이지 만들면 좋을듯!! 로그아웃 되고, 홈페이지로 이동하는 링크 있는
			request.getSession().setAttribute("alertMsg", "탈퇴 처리 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/adminPage/detail.ad?adminNo=" + delAdminNo);
			
		}else {
			request.setAttribute("errorMsg", "탈퇴 실패");
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
