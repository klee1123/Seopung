package com.kh.searchPlan.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminPlan.model.vo.Plan;
import com.kh.common.PageInfo;
import com.kh.searchPlan.model.service.PlanSearchService;
import com.kh.searchPlan.model.vo.SearchPlan;

/**
 * Servlet implementation class SearchPlanListServlet
 */
@WebServlet("/list.pl")
public class SearchPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPlanListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 검색조건 뽑기
		String sDate = "";
		if(request.getParameter("sDate") == null || request.getParameter("sDate").equals("")) {
			sDate = "1900-01-01";
		}else {
			sDate = request.getParameter("sDate");
		}
		
		String eDate = "";
		if(request.getParameter("sDate") == null || request.getParameter("eDate").equals("")) {
			eDate = "2100-12-31";
		}else {
			eDate = request.getParameter("eDate");
		}
		
		String keyword = "";
		if(request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");			
		}
		String type="";
		if(request.getParameter("type") != null) {
			type = request.getParameter("type");
		}
		
		String [] age = request.getParameterValues("age");
		String[] trans = request.getParameterValues("trans");
		
		SearchPlan filter = new SearchPlan(sDate, eDate, age, type, trans, keyword);
	
		// 페이징 조건
		int listCount;	
		int currentPage;
		int pageLimit;	
		int boardLimit;		
		
		int maxPage;		
		int startPage;		
		int endPage;		
		
		listCount = new PlanSearchService().selectListCount(filter);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 5;
		boardLimit = 8;
		
		// 조회된 수가 0일 경우 페이징오류 해결 위해서 (처리안하면 > >>가 보임) 
		if(listCount != 0) {
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
		}else {
			maxPage=1;
		}
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Plan> list = new PlanSearchService().selectList(pi, filter);

		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("filter", filter);
		request.getRequestDispatcher("views/search/searchPlanListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
