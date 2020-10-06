package com.kh.adminReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminMember.model.service.MemberService;
import com.kh.adminReport.model.service.AdminReportService;

/**
 * Servlet implementation class AdminReportBlacklist
 */
@WebServlet("/adminPage/blacklist.rp")
public class AdminReportBlacklist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportBlacklist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] enrollList = request.getParameterValues("rno");
		
		int result = new AdminReportService().enrollBlacklist(enrollList);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "블랙리스트에서 등록 성공");
			response.sendRedirect(request.getContextPath()+"/adminPage/list.rp?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "블랙리스트 등록 실패");
			request.getRequestDispatcher("../views/admin/common/errorPage.jsp");
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
