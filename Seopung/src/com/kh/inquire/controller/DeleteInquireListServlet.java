package com.kh.inquire.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.inquire.model.service.InquireService;

/**
 * Servlet implementation class DeleteInquireListServlet
 */
@WebServlet("/deleteInquire.in")
public class DeleteInquireListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInquireListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] ino = request.getParameterValues("ino");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int result = new InquireService().deleteInquireList(ino);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "문의 내용 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/list.in?currentPage=1&userNo=" + userNo);
		}else {
//			request.setAttribute("errorMsg", "문의 내용 삭제 실패");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
