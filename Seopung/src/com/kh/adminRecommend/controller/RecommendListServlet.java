package com.kh.adminRecommend.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminRecommend.model.service.RecommendService;
import com.kh.adminRecommend.model.vo.Recommend;
import com.kh.common.PageInfo;

/**
 * Servlet implementation class RecommendListServlet
 */
@WebServlet("/adminPage/list.re")
public class RecommendListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// ------------------ 페이징 처리 ------------------------
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대갯수
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수
		
		int maxPage;		// 전체 페이지들 중에서의 가장 마지막 페이지
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작수
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수
		
		// 넘어온 키워드 값 뽑기
		String keyword;
		if(request.getParameter("keyword")!=null) {
			keyword = request.getParameter("keyword");
		}else {
			keyword = "";
		}
		
		// * listCount : 총 게시글 갯수
		listCount = new RecommendService().selectListCount(keyword);
		
		//  * currentPage : 현재 페이지(요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수 (페이지 목록들 몇개 단위)
		pageLimit = 5;
		
		// * boardLimit : 한 페이지내에 보여질 게시글 최대 갯수
		boardLimit = 10;
		
		// * maxPage : 총 페이지 수 (마지막 페이지)
		// 조회된 관리자수가 0일 경우 페이징오류 해결 위해서 (처리안하면 > >>가 보임) 
		if(listCount != 0) {
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
		}else {
			maxPage=1;
		}

		// * startPage : 현재 페이지에 보여질 페이징 바의 시작수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		endPage = startPage + pageLimit - 1;
		
		// 만약 maxPage가 고작 13까지 밖에 안된다면? endPage를 다시 13으로 해줘야됨!!
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 페이징정보들을 하나의 공간에 담아서 보내자!!
		// 1. 페이징바 만들때 필요한 PageInfo 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<Recommend> list = new RecommendService().selectList(pi, keyword);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageTitle", "추천코스 목록");
		
		request.getRequestDispatcher("../views/admin/manage_post/recommend/recommendListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
