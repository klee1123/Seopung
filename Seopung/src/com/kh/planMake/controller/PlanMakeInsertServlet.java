package com.kh.planMake.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.planMake.model.service.PlanMakeService;
import com.kh.planMake.model.vo.PlanMake;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/planMakePage.pl")
public class PlanMakeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMakeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 전달값 utf-8 인코딩(post)
		request.setCharacterEncoding("utf-8");
		
		// 2. 전달값 뽑기서 변수 및 객체에 기록하기
		String planTitle = request.getParameter("planTitle");	
		String planSdate = request.getParameter("planSdate");
		String planEdate = request.getParameter("planSdate");
		
		String[] planAges = request.getParameterValues("planAge");
		// String[] --> String
		// ["운동", "등산" ]  --> "운동,등산"
		String planAge = "";
		if(planAges != null) {
			planAge = String.join(",",  planAges);
		}
		
		String planAcc = request.getParameter("planAcc");
		String planBudget = request.getParameter("planBudget");
		String planScrapYn = request.getParameter("planScrapYn");	
		String planPrivate = request.getParameter("planPrivate");	
		String planMemo = request.getParameter("planMemo");
		
		String[] planTypes = request.getParameterValues("planType");
		
		String planType = "";
		if(planTypes != null) {
			planType = String.join(",",  planTypes);
		}
		
		String planTrans = request.getParameter("planTrans");	
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		
		String planDay = request.getParameter("planDay");
		String planPlace = request.getParameter("planPlace");
		
		
		
		// 기본생성자생성후 setter메소드 이용해서 담기 / 아사리 매개변수생성자 이용해서 담기
		PlanMake p = new PlanMake();
				p.setPlanTitle(planTitle);
				p.setPlanSdate(planSdate);
				p.setPlanEdate(planEdate);
				p.setPlanAge(planAge);
				p.setPlanAcc(planAcc);
				p.setPlanBudget(planBudget);
				p.setPlanScrapYn(planScrapYn);
				p.setPlanPrivate(planPrivate);
				p.setPlanMemo(planMemo);
				p.setPlanType(planType);
				p.setPlanTrans(planTrans);
				p.setUserNo(userNo);
		
		PlanMake pp = new PlanMake();
			p.setPlanDay(planDay);
			p.setPlanDay(planPlace);
			
		// 3. 요청 처리 (서비스 메소드 호출 및 결과 받기)
		int result = new PlanMakeService().insertPlanMake(p);
		
		// 4. 결과에 따른 사용자가 보게될 응답페이지 지정
		if(result > 0) {	//  저장 성공
			
			request.getRequestDispatcher("views/plan/plan_page.jsp").forward(request, response);
			
		} else {	//  저장 실패
			
			RequestDispatcher view = request.getRequestDispatcher("실패");
			view.forward(request,response);
		
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
