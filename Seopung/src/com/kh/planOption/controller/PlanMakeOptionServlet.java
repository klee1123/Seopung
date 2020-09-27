package com.kh.planOption.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.planOption.model.service.PlanOptionService;
import com.kh.planOption.model.vo.PlanOption;

/**
 * Servlet implementation class PlanMakeOption
 */
@WebServlet("/planOption.po")
public class PlanMakeOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMakeOptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String plan_title = request.getParameter("plan_title");
		String plan_sdate = request.getParameter("plan_sdate");
		String plan_edate = request.getParameter("plan_edate");
		String plan_type = request.getParameter("plan_type");
		
		String[] plan_age = request.getParameterValues("plan_age");
		String[] plan_trans = request.getParameterValues("plan_trans");
		
		String plan_acc = request.getParameter("plan_acc");
		String plan_budget = request.getParameter("plan_budget");
		String plan_scrap_yn = request.getParameter("plan_scrap_yn");
		String plan_private = request.getParameter("plan_private");
		String plan_memo = request.getParameter("plan_memo");
		String plan_temp = request.getParameter("plan_temp");
		
		PlanOption po = new PlanOption();
		po.setPlanTitle(plan_title);
		po.setPlanSdate(plan_sdate);
		po.setPlanEdate(plan_edate);
		po.setPlanType(plan_type);
		po.setPlanAge(plan_age);
		po.setPlanTrans(plan_trans);
		po.setPlanBudget(plan_budget);
		po.setPlanScrapYn(plan_scrap_yn);
		po.setPlanPrivate(plan_private);
		po.setPlanMemo(plan_memo);
		po.setPlanTemp(plan_temp);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
