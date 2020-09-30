package com.kh.planMap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.planMap.model.service.PlanMapService;
import com.kh.planMap.model.vo.PlanMap;

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
			int orderNo = request.getParameter("orderNo");
			String lineMemo = request.getParameter("lineMemo");
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");
			
			PlanMap p = new PlanMap();
			p.setPlanDay(planDay);
			p.setOrderNo(orderNo);
			p.setLineMemo(lineMemo);
			p.setLatitude(latitude);
			p.setLongitude(longitude);
			
			int result = new PlanMapService().insertPlanMap(p);
			
			//request.getSession().setAttribute();
			request.getRequestDispatcher("views/plan/plan_page.jsp").forward(request, response);
			
			
			if(result > 0) {
				
				response.sendRedirect(request.getContextPath());
			}else {
				System.out.println("실패");
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
