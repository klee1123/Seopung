package com.kh.adminCommunity.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.adminCommunity.model.service.CommunityService;
import com.kh.adminCommunity.model.vo.Community;

/**
 * Servlet implementation class AdminCommunityDetailServlet
 */
@WebServlet("/adminPage/detail.co")
public class AdminCommunityDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommunityDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getCategory() == 2) {
			int cno = Integer.parseInt(request.getParameter("cno"));
			
			int result = new CommunityService().increaseCount(cno);
			
			if(result>0) {
				
				String head = new CommunityService().selectHead(cno);
				
				Community c = new CommunityService().selectCommunity(cno, head);
				
				request.setAttribute("c", c);
				request.setAttribute("pageTitle", "커뮤니티 상세조회");
				request.getRequestDispatcher("../views/admin/manage_post/community/manageCommunityDetailView.jsp").forward(request, response);
				
			}else {
				request.setAttribute("errorMsg", "유효한 게시글이 아닙니다.");
				request.getRequestDispatcher("../views/admin/common/errorPage.jsp").forward(request, response);
			}
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
