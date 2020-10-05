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
 * Servlet implementation class AdminCommunityUpdateServlet
 */
@WebServlet("/adminPage/update.co")
public class AdminCommunityUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommunityUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Community c = new Community();
		c.setCommunityNo(cno);
		c.setTitle(title);
		c.setContent(content);
		
		int result = new CommunityService().updateCommunity(c);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "커뮤니티 수정 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/detail.co?cno=" + cno);
		}else {
			request.setAttribute("errorMsg", "추천코스 수정 실패");
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
