package com.kh.Notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Notice.model.service.NoticeService;
import com.kh.Notice.model.vo.Notice;
import com.kh.adminNotice.model.service.AdminNoticeService;
import com.kh.adminNotice.model.vo.AdminNotice;
	
	/**
	 * Servlet implementation class AdminNoticeDetailServlet
	 */
	@WebServlet("/detail.no")
	public class NoticeDetailServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public NoticeDetailServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int nno = Integer.parseInt(request.getParameter("nno"));
			
			int result = new AdminNoticeService().increaseCount(nno);
			
			if(result>0) {
				
				AdminNotice n = new AdminNoticeService().selectAdminNotice(nno);
				
				request.setAttribute("n", n);
				request.setAttribute("pageTitle", "공지사항");
				request.getRequestDispatcher("views/serviceCenter/userNotice/userNoticeDetailView.jsp").forward(request, response);
				
			}else {
				request.setAttribute("errorMsg", "유효한 게시글이 아닙니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
	