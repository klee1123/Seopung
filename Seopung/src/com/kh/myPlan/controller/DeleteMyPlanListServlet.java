package com.kh.myPlan.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.myPlan.model.service.MyPlanService;

/**
 * Servlet implementation class DeleteMyPlanListServlet
 */
@WebServlet("/delete.mp")
public class DeleteMyPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMyPlanListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] mpno = request.getParameterValues("mpno");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));		
		int result = new MyPlanService().deleteMyPlanList(mpno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "내 일정 삭제 성공");
			String plan = URLEncoder.encode("모든일정");
			
			response.sendRedirect(request.getContextPath() + "/list.mp?currentPage=1&userNo=" + userNo +"&planOp=" + plan);
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
