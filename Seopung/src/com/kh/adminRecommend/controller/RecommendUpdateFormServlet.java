package com.kh.adminRecommend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.adminRecommend.model.service.RecommendService;
import com.kh.adminRecommend.model.vo.Recommend;

/**
 * Servlet implementation class RecommendUpdateFormServlet
 */
@WebServlet("/adminPage/updateForm.re")
public class RecommendUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getCategory() == 2) {
		
			int rno = Integer.parseInt(request.getParameter("rno"));
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			Recommend r = new RecommendService().selectRecommend(rno);
			
			request.setAttribute("r", r);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageTitle", "추천코스 글 수정");
			
			request.getRequestDispatcher("../views/admin/manage_post/recommend/recommendUpdateForm.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "로그인 후 이용 가능한 서비스 입니다.");
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
