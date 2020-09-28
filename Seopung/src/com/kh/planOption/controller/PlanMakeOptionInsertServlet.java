package com.kh.planOption.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.planOption.model.service.PlanOptionService;
import com.kh.planOption.model.vo.PlanOption;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/planOption.po")
public class PlanMakeOptionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMakeOptionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		
		String planTitle = request.getParameter("planTitle");
		String planSdate = request.getParameter("planSdate");
		String planEdate = request.getParameter("planEdate");
		String planAge = request.getParameter("planAge");
		String planAcc = request.getParameter("planAcc");
		String planBudget = request.getParameter("planBudget");
		String planScrapYn = request.getParameter("planScrapYn");
		String planPrivate = request.getParameter("planPrivate");
		String planMemo = request.getParameter("planMemo");
		String planHashtag = request.getParameter("planHashtag");
		String planTemp = request.getParameter("planTemp");
		String planType = request.getParameter("planType");
		String planTrans = request.getParameter("planTrans");
		
		
		PlanOption p = new PlanOption();
		
		int result = new PlanOptionService().insertPlanOption(p);
		
		request.getSession().setAttribute("alertMsg","성공적으로 회원가입 되었습니다.");
		
		if(result > 0) {
			
			response.sendRedirect(request.getContextPath());
		}else {
			
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
