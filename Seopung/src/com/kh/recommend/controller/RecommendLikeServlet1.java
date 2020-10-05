package com.kh.recommend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.recommend.model.service.RecommendService;

/**
 * Servlet implementation class RecommendLikeServlet1
 */
@WebServlet("/like.re")
public class RecommendLikeServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendLikeServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LoginUser loginUser = (LoginUser)request.getSession().getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		int cno = Integer.parseInt(request.getParameter("cno"));
		int result = new RecommendService().increaseLike(cno, userNo);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "추천됐습니다");
			response.sendRedirect(request.getContextPath() + "/detailList.re?cno=" + cno);
		}else {
			
			int result1 = new RecommendService().decreaseLike(cno);
			if(result1 > 0) {
				request.getSession().setAttribute("alertMsg", "이미 추천했습니다.");
				response.sendRedirect(request.getContextPath() + "/detailList.re?cno=" + cno);
			}
			
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
