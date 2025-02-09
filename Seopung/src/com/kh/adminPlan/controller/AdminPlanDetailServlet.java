package com.kh.adminPlan.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.adminPlan.model.service.PlanService;
import com.kh.adminPlan.model.vo.Plan;

/**
 * Servlet implementation class AdminPlanDetailServlet
 */
@WebServlet("/adminPage/detail.pl")
public class AdminPlanDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPlanDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getCategory() == 2) {
			
			int pno = Integer.parseInt(request.getParameter("pno"));
			int result = new PlanService().increaseCount(pno);
			
			if(result>0) {
				
				Plan p = new PlanService().selectPlan(pno);
				int dayCount = new PlanService().selectDayCount(pno);
				
				request.setAttribute("dayCount", dayCount);
				request.setAttribute("p", p);
				request.setAttribute("pageTitle", "일정 상세조회");
				request.getRequestDispatcher("../views/admin/manage_post/plan/managePlanDetailView.jsp").forward(request, response);
	
			}else {
				request.setAttribute("errorMsg", "유효한 게시글이 아닙니다.");
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
