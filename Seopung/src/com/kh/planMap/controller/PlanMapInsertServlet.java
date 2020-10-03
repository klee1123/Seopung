package com.kh.planMap.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.planMap.model.service.PlanMapService;
import com.kh.planMap.model.vo.PlanMap;
import com.kh.planOption.model.service.PlanOptionService;

/**
 * Servlet implementation class PlanMapInsertServlet
 */
@WebServlet("/planMap.pl")
public class PlanMapInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMapInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
				
			String planDay = request.getParameter("planDay");
			String orderNo = request.getParameter("orderNo");
			String placeName = request.getParameter("placeName");
			String planNo = request.getParameter("planNo");
			
			PlanMap p = new PlanMap();
			p.setPlanDay(planDay);
			p.setOrderNo(orderNo);
			p.setPlaceName(placeName);
			p.setPlanNo(planNo);
			
			// 3. 요청 처리 (서비스 메소드 호출 및 결과 받기)
			int result = new PlanMapService().insertPlanMap(p);
			
			// 4. 결과에 따른 사용자가 보게될 응답페이지 지정
			if(result > 0) {	// 옵션 저장 성공
				
				request.getRequestDispatcher("views/plan/plan_page.jsp").forward(request, response);
				
			} else {	// 옵션 저장 실패
				
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
