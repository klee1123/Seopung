package com.kh.community.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Community;

/**
 * Servlet implementation class CommunityListServlet
 */
@WebServlet("/list.co")
public class CommunityListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityListServlet() {
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
		String head = request.getParameter("head");
		String array = request.getParameter("array");
		
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new CommunityService().selectListCount(keyword, head);
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
		
		ArrayList<Community> list = new CommunityService().selectList(pi, keyword, head, array);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.setAttribute("head", head);
		request.setAttribute("array", array);
		
		ArrayList<Community> nList = new CommunityService().selectNoticeList();
		
		request.setAttribute("nList", nList);
		request.getRequestDispatcher("views/community/communityList.jsp").forward(request, response);
		
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
