package com.kh.adminNotice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.adminNotice.model.service.AdminNoticeService;
import com.kh.adminNotice.model.vo.AdminNotice;

/**
 * Servlet implementation class AdminNoticeInsertServlet
 */
@WebServlet("/adminPage/insert.no")
public class AdminNoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getCategory() == 2) {
		request.setCharacterEncoding("utf-8");
		
		int adminNo = Integer.parseInt(request.getParameter("adminNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		AdminNotice n = new AdminNotice();
		n.setAdminNo(adminNo);
		n.setNoticeTitle(title);
		n.setNoticeContent(content);
		
		int result = new AdminNoticeService().insertAdminNotice(n);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "공지사항 등록 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/list.no?currentPage=1");
			
		}else {
			request.setAttribute("errorMsg", "공지사항 등록 실패");
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
