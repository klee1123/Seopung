package com.kh.planOption.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.planOption.model.vo.PlanOption;

/**
 * Servlet implementation class PlanMakeOption
 */
@WebServlet("/test1.do")
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
		String plan_age = request.getParameter("plan_age");
		String plan_trans = request.getParameter("plan_trans");
		String plan_acc = request.getParameter("plan_acc");
		String plan_budget = request.getParameter("plan_budget");
		String plan_scrap_yn = request.getParameter("plan_scrap_yn");
		String plan_private = request.getParameter("plan_private");
		String plan_memo = request.getParameter("plan_memo");
		String plan_temp = request.getParameter("plan_temp");
		
		PlanOption ad = new PlanOption();
		ad.setPlanTitle(plan_title);
		ad.setPlanSdate(plan_sdate);
		ad.setPlanEdate(plan_edate);
		ad.setPlanType(plan_type);
		ad.setPlanAge(plan_age);
		ad.setPlanTrans(plan_trans);
		ad.setPlanAcc(plan_acc);
		ad.setPlanBudget(plan_budget);
		ad.setPlanScrapYn(plan_scrap_yn);
		ad.setPlanPrivate(plan_private);
		ad.setPlanMemo(plan_memo);
		ad.setPlanTemp(plan_temp);
		

		int result = new AdminService().insertAdmin(ad);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "관리자 등록 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/list.ad?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "관리자 등록 실패");
			request.getRequestDispatcher("../views/admin/common/errorPage.jsp").forward(request, response);;
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
