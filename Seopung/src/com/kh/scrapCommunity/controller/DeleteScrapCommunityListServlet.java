package com.kh.scrapCommunity.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scrapCommunity.model.service.ScrapCommunityService;

/**
 * Servlet implementation class DeleteScrapCommunityListServlet
 */
@WebServlet("/delete.sc")
public class DeleteScrapCommunityListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteScrapCommunityListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		String[] scno = request.getParameterValues("scno");
		int result = new ScrapCommunityService().deleteScrapCommunityList(scno, userNo);
		
		System.out.println(result);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "스크랩 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/list.sc?currentPage=1&userNo=" + userNo);
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
