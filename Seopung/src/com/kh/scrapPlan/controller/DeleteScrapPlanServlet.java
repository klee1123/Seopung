package com.kh.scrapPlan.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scrapPlan.model.service.ScrapPlanService;

/**
 * Servlet implementation class DeleteScrapPlanServlet
 */
@WebServlet("/delete.sp")
public class DeleteScrapPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteScrapPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		String[] spno = request.getParameterValues("spno");
		
		int result = new ScrapPlanService().deleteList(spno, userNo);
		
		if(result > 0) {
			
			int result1 = new ScrapPlanService().decreasePlanScrapCount(spno);
			if(result1 > 0) {
				request.getSession().setAttribute("alertMsg", "스크랩 삭제 성공");
				response.sendRedirect(request.getContextPath() + "/list.sp?currentPage=1&userNo=" + userNo);
			}else {
				request.getSession().setAttribute("alertMsg", "스크랩 삭제 실패");
				response.sendRedirect(request.getContextPath() + "/list.sp?currentPage=1&userNo=" + userNo);
			}
			
		}else {
			request.getSession().setAttribute("alertMsg", "스크랩 삭제 실패");
			response.sendRedirect(request.getContextPath() + "/list.sp?currentPage=1&userNo=" + userNo);
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
