package com.kh.accompany.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.accompany.model.service.AccompanyService;

/**
 * Servlet implementation class AccompanySelectDeleteServlet
 */
@WebServlet("/selectDelete.ac")
public class AccompanySelectDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanySelectDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] accomNo = request.getParameterValues("ino");
		
		int result = new AccompanyService().selectDelete(accomnNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "메세지 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/receiver.ms?currentPage=1");
			
		}else {
			request.setAttribute("errorMsg", "메세지 삭제 실패");
			response.sendRedirect(request.getContextPath() + "/receiver.ms?currentPage=1");
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
