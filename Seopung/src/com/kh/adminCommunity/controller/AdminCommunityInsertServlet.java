package com.kh.adminCommunity.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminCommunity.model.service.CommunityService;
import com.kh.adminCommunity.model.vo.Community;

/**
 * Servlet implementation class AdminCommunityInsertServlet
 */
@WebServlet("/adminPage/insert.co")
public class AdminCommunityInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommunityInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminNo = request.getParameter("adminNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Community c = new Community();
		c.setCommunityWriter(adminNo);
		c.setTitle(title);
		c.setContent(content);
		
		int result = new CommunityService().insertCommunity(c);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "커뮤니티 공지사항 등록 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/list.co?currentPage=1");
			
		}else {
			request.setAttribute("errorMsg", "커뮤니티 공지사항 등록 실패");
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
