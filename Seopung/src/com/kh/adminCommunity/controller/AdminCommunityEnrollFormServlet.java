package com.kh.adminCommunity.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;

/**
 * Servlet implementation class AdminCommunityEnrollFormServlet
 */
@WebServlet("/adminPage/enrollForm.co")
public class AdminCommunityEnrollFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommunityEnrollFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginUser") != null && ((LoginUser)request.getSession().getAttribute("loginUser")).getCategory() == 2) {
			request.setAttribute("pageTitle", "커뮤니티 공지사항 등록");
			request.getRequestDispatcher("../views/admin/manage_post/community/manageCommunityEnrollForm.jsp").forward(request, response);
			
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
