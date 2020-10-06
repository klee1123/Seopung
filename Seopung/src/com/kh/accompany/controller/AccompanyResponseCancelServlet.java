package com.kh.accompany.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.accompany.model.service.AccompanyService;

/**
 * Servlet implementation class AccompanyResponseCancelServlet
 */
@WebServlet("/responseCancel.ac")
public class AccompanyResponseCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyResponseCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int accomNo = Integer.parseInt(request.getParameter("accomNo"));
		
		int result = new AccompanyService().responseCancel(accomNo);
		
		
		
		response.sendRedirect(request.getContextPath() + "/response.ac?currentPage=1&accomNo=" + accomNo);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
