package com.kh.recommend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recommend.model.service.RecommendService;

/**
 * Servlet implementation class RecommendDeleteServlet
 */
@WebServlet("/adminPage/delete.re")
public class RecommendDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] rno = request.getParameterValues("rno");
		
		int result = new RecommendService().deleteRecommend(rno);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "추천코스 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/list.re?currentPage=1");
			
		}else {
			request.setAttribute("errorMsg", "추천코스 삭제 실패");
			request.getRequestDispatcher("../views/admin/common/errorPage.jsp").forward(request, response);
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
