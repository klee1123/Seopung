package com.kh.recommend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recommend.model.service.RecommendService;
import com.kh.recommend.model.vo.Recommend;

/**
 * Servlet implementation class RecommendDetailListServlet1
 */
@WebServlet("/detailList.re")
public class RecommendDetailListServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendDetailListServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new RecommendService().increaseCount(cno);
		
		if(result > 0) {
			Recommend nc = new RecommendService().selectRecommend(cno);
			request.setAttribute("nc", nc);
			request.getRequestDispatcher("views/recommend/recommendDetailView.jsp").forward(request, response);
	
		}else {
			request.setAttribute("errorMsg", "잘못된 주소입니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
