package com.kh.recommend.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.recommend.model.service.RecommendService;
import com.kh.recommend.model.vo.Recommend;

/**
 * Servlet implementation class RecommendServlet1
 */
@WebServlet("/list.re")
public class RecommendListServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendListServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String keyword;
		if(request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}else {
			keyword = "";
		}
		String array = request.getParameter("array");
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new RecommendService().selectListCount(keyword);
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = currentPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage );
		ArrayList<Recommend> list = new RecommendService().selectList(pi, keyword, array);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.setAttribute("array", array);
		
		request.getRequestDispatcher("views/recommend/recommendList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
