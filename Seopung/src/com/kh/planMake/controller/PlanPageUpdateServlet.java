package com.kh.planMake.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.planMake.model.service.PlanMakeService;
import com.kh.planMake.model.vo.PlanMake;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/planPageUpdate.pl")
public class PlanPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanPageUpdateServlet() {
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
		String planEdate = request.getParameter("planEdate");
		
		String[] planAges = request.getParameterValues("planAge");
		String planAge = "";
		if(planAges != null) {
			planAge = String.join(",",  planAges);
		}
		
		String planAcc = request.getParameter("planAcc");
		String planBudget = request.getParameter("planBudget");
		String planScrapYn = request.getParameter("planScrapYn");	
		String planPrivate = request.getParameter("planPrivate");	
		String planMemo = request.getParameter("planMemo");
		String planType = request.getParameter("planType");
		
		String[] planTranss = request.getParameterValues("planTrans");	
		String planTrans = "";
		if(planTranss != null) {
			planTrans = String.join(",",  planTranss);
		}
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		
		String planDay = request.getParameter("planDay");
		String[] planPlaces = request.getParameterValues("planPlace");
		String planPlace = "";
		if(planPlaces != null) {
			planPlace = String.join(",",  planPlaces);
		}
		
		
		
		// 기본생성자생성후 setter메소드 이용해서 담기 / 아사리 매개변수생성자 이용해서 담기
		PlanMake pm = new PlanMake();
				pm.setPlanTitle(planTitle);
				pm.setPlanSdate(planSdate);
				pm.setPlanEdate(planEdate);
				pm.setPlanAge(planAge);
				pm.setPlanAcc(planAcc);
				pm.setPlanBudget(planBudget);
				pm.setPlanScrapYn(planScrapYn);
				pm.setPlanPrivate(planPrivate);
				pm.setPlanMemo(planMemo);
				pm.setPlanType(planType);
				pm.setPlanTrans(planTrans);
				pm.setUserNo(userNo);
		
		PlanMake ppm = new PlanMake();
			ppm.setPlanDay(planDay);
			ppm.setPlanPlace(planPlace);
			
			
		// 3. 요청 처리 (서비스 메소드 호출 및 결과 받기)
		int result = new PlanMakeService().updatePlanMake(pm);
		int result2 = new PlanMakeService().updatePlanPlace(ppm);
		
		// 4. 결과에 따른 사용자가 보게될 응답페이지 지정
		if((result+result2 )> 0) {	//  저장 성공
			
			request.getSession().setAttribute("alertMsg", "일정 등록 성공");
			 request.getRequestDispatcher("index.jsp").forward(request, response);
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
