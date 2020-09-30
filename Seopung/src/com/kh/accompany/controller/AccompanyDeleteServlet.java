package com.kh.accompany.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.accompany.model.service.AccompanyService;

/**
 * Servlet implementation class AccompanyDelete
 */
@WebServlet("/delete.ac")
public class AccompanyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		System.out.println(request.getParameter("accomNo"));
		
		int accomNo = Integer.parseInt(request.getParameter("accomNo"));
		
		
		System.out.println(accomNo);
		
		int result = new AccompanyService().deleteAccom(accomNo);
		
		if(result > 0) {	// 삭제 성공일시
			
			request.getSession().setAttribute("alertMsg", "삭제 처리 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.ac?accomNo=" + accomNo);
			
		}else {				// 삭제 실패일시
			
			request.setAttribute("errorMsg", "삭제 실패");
			
			
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
