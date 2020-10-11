package com.kh.planMake.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;

/**
 * Servlet implementation class PlanMakeEnrollForm
 */
@WebServlet("/enrollForm.pl")
public class PlanMakeEnrollForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMakeEnrollForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getCategory() == 1) {
			request.getRequestDispatcher("views/plan/planMakePage.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
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
