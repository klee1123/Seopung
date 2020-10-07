package com.kh.planMake.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.planMake.model.service.PlanMakeService;
import com.kh.planMake.model.vo.PlanMake;

/**
 * Servlet implementation class PlanPageUpdateFormServlet
 */
@WebServlet("/updateForm.pl")
public class PlanPageUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanPageUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		
		PlanMake pm = new PlanMakeService().selectPlanMake(planNo);
		
		request.setAttribute("pm", pm);
		request.getRequestDispatcher("views/plan/planPageUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
