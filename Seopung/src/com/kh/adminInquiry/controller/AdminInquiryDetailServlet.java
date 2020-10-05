package com.kh.adminInquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminInquiry.model.service.AdminInquiryService;
import com.kh.adminInquiry.model.vo.AdminInquiry;
import com.kh.adminNotice.model.vo.AdminNotice;

/**
 * Servlet implementation class AdminNoticeDetailServlet
 */
@WebServlet("/adminPage/detail.iq")
public class AdminInquiryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ino = Integer.parseInt(request.getParameter("ino"));
		
		AdminInquiry i = new AdminInquiryService().selectAdminInquiry(ino);
		
		if(i != null) {
			
			request.setAttribute("i", i);
			request.setAttribute("pageTitle", "1:1 문의 상세조회");
			request.getRequestDispatcher("../views/admin/manage_inquiry/manageInquiryDetailView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "유효한 게시글이 아닙니다.");
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
