package com.kh.recommend.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recommend.model.service.RecommendService;

/**
 * Servlet implementation class RecommendDeleteSerlvet1
 */
@WebServlet("/delete.re")
public class RecommendDeleteSerlvet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendDeleteSerlvet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new RecommendService().deleteRecommend(cno);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "게시물이 삭제되었습니다");
			
			String neww = URLEncoder.encode("최신");
			
			response.sendRedirect(request.getContextPath() + "/list.re?currentPage=1&array=" + neww);
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
