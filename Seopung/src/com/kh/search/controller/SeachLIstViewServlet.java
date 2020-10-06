package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminCommunity.model.vo.Community;
import com.kh.adminPlan.model.vo.Plan;
import com.kh.adminRecommend.model.vo.Recommend;
import com.kh.search.model.service.SearchService;

/**
 * Servlet implementation class SeachLIstViewServlet
 */
@WebServlet("/search.do")
public class SeachLIstViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeachLIstViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String keyword = request.getParameter("keyword");
		
		int pCount = new SearchService().searchPlanCount(keyword);
		int cCount = new SearchService().searchCommunityCount(keyword);
		int rCount = new SearchService().searchRecommendCount(keyword);
		
		ArrayList<Plan> plist = new SearchService().searchPlan(keyword);
		ArrayList<Community> clist = new SearchService().searchCommunity(keyword);
		ArrayList<Recommend> rlist = new SearchService().searchRecommend(keyword);
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("pCount", pCount);
		request.setAttribute("cCount", cCount);
		request.setAttribute("rCount", rCount);
		request.setAttribute("plist", plist);
		request.setAttribute("clist", clist);
		request.setAttribute("rlist", rlist);
		request.getRequestDispatcher("views/search/searchListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
