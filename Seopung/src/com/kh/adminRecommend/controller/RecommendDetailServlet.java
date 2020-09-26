package com.kh.adminRecommend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminRecommend.model.service.RecommendService;
import com.kh.adminRecommend.model.vo.Recommend;

/**
 * Servlet implementation class RecommendDetailServlet
 */
@WebServlet("/adminPage/detail.re")
public class RecommendDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int result = new RecommendService().increaseCount(rno);
		
		if(result>0) {
			
			Recommend r = new RecommendService().selectRecommend(rno);
			
			request.setAttribute("r", r);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageTitle", "추천코스 상세조회");
			request.getRequestDispatcher("../views/admin/manage_post/recommend/recommendDetailView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "유효한 게시글이 아닙니다.");
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
