package com.kh.scrapPlan.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.scrapCommunity.model.service.ScrapCommunityService;
import com.kh.scrapPlan.model.service.ScrapPlanService;
import com.kh.scrapPlan.model.vo.ScrapPlan;

/**
 * Servlet implementation class ScrapPlanListServlet
 */
@WebServlet("/list.sp")
public class ScrapPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapPlanListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		//----페이징 처리 ---------
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재페이지
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대갯수
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대 갯수
		
		int maxPage;		// 전체페이지 들 중 가장 마지막 페이지
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작
		int endPage;		// 현재 페이지 하단에 보여질 페이징 바의 끝
		
		
		listCount = new ScrapCommunityService().selectListCount(userNo);
		
		// * currentPage : 현재 요청한 페이지(요청한페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수 (페이지 목록을 몇 개 단위)
		pageLimit = 5;
		
		boardLimit = 10;
		
		if(listCount != 0) {
            maxPage = (int)Math.ceil((double)listCount/boardLimit);
        }else {
            maxPage=1;
        }
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
       
        // 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
        ArrayList<ScrapPlan> list = new ScrapPlanService().selectList(pi,userNo);
        
        request.setAttribute("pi", pi);
        request.setAttribute("list", list);
        request.setAttribute("userNo",userNo);
	
        RequestDispatcher view = request.getRequestDispatcher("views/myPage/scrap/scrapPlan.jsp");
        view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
