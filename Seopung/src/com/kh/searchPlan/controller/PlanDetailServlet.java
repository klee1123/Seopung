package com.kh.searchPlan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminPlan.model.service.PlanService;
import com.kh.adminPlan.model.vo.Plan;

/**
 * Servlet implementation class PlanDetailViewServlet
 */
@WebServlet("/detail.pl")
public class PlanDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int result = new PlanService().increaseCount(pno);
		
		if(result>0) {
			
			Plan p = new PlanService().selectPlan(pno);
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("views/search/planDetailView.jsp").forward(request, response);

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
