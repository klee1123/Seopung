package com.kh.adminCommunity.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminCommunity.model.service.CommunityService;

/**
 * Servlet implementation class AdminCommunityDeleteServlet
 */
@WebServlet("/adminPage/delete.co")
public class AdminCommunityDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommunityDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] cno = request.getParameterValues("cno");
		
		int result = new CommunityService().deleteCommunity(cno);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "커뮤니티 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/list.co?currentPage=1");
			
		}else {
			request.setAttribute("errorMsg", "커뮤니티 삭제 실패");
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
