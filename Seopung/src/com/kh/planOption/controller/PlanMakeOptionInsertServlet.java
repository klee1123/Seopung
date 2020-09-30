package com.kh.planOption.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
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
@WebServlet("/planOption.pl")
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
		
		// 1. 전달값 utf-8 인코딩(post)
		request.setCharacterEncoding("utf-8");
		
		// 2. 전달값 뽑기서 변수 및 객체에 기록하기
		String planTitle = request.getParameter("planTitle");	
		String planSdate = request.getParameter("planSdate");
		String planEdate = request.getParameter("planEdate");
		
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
		String planHashtag = request.getParameter("planHashtag");	
		String planTemp = request.getParameter("planTemp");	
		
		String[] planTypes = request.getParameterValues("planType");
		// String[] --> String
		// ["운동", "등산" ]  --> "운동,등산"
		String planType = "";
		if(planTypes != null) {
			planType = String.join(",",  planTypes);
		}
		
		String planTrans = request.getParameter("planTrans");	
		
		// 기본생성자생성후 setter메소드 이용해서 담기 / 아사리 매개변수생성자 이용해서 담기
		PlanOption p = new PlanOption(planTitle
									, planSdate
									, planEdate
									, planAge
									, planAcc
									, planBudget
									, planScrapYn
									, planPrivate
									, planMemo
									, planHashtag
									, planTemp
									, planType
									, planTrans
				);
			
		// 3. 요청 처리 (서비스 메소드 호출 및 결과 받기)
		int result = new PlanOptionService().insertPlanOption(p);
		
		// 4. 결과에 따른 사용자가 보게될 응답페이지 지정
		if(result > 0) {	// 회원가입 성공
			
			request.getRequestDispatcher("views/plan/plan_make_map.jsp").forward(request, response);
			
		} else {	// 회원가입 실패
			request.setAttribute("errorMsg",  "회원가입에 실패했습니다.");
		
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
