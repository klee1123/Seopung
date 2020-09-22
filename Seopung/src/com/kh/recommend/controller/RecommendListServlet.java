package com.kh.recommend.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recommend.model.service.RecommendService;
import com.kh.recommend.model.vo.PageInfo;
import com.kh.recommend.model.vo.Recommend;

/**
 * Servlet implementation class RecommendListServlet
 */
@WebServlet("/list.re")
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
		
		// ------------------ 페이징 처리 ------------------------
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대갯수
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수
		
		int maxPage;		// 전체 페이지들 중에서의 가장 마지막 페이지
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작수
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수
		
		// * listCount : 총 게시글 갯수
		listCount = new RecommendService().selectListCount();
		//System.out.println(listCount); -- 프린트문은 서버에 부담이 되어 버벅이는 현상 생길 수 있음.
		
		//  * currentPage : 현재 페이지(요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수 (페이지 목록들 몇개 단위)
		pageLimit = 5;
		
		// * boardLimit : 한 페이지내에 보여질 게시글 최대 갯수
		boardLimit = 10;
		
		// * maxPage : 총 페이지 수 (마지막 페이지)
		/*
		 *  listCount, boardLimit에 영향을 받음
		 *  
		 *   ex) boardLimit : 10이라는 가정 하에
		 *   
		 *   총 갯수		boardLimit				maxPage
		 *    100.0		/		10		=> 10.0			10
		 *    101.0		/		10		=> 10.1			11
		 *    105.0		/		10		=> 10.5			11
		 *    109.0		/		10		=> 10.9			11
		 *    
		 *  총게시글갯수(실수) / boardLimit => 올림처리 => maxPage
		 */
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * startPage : 현재 페이지에 보여질 페이징 바의 시작수
		/*
		 *  pageLimit, currentPage에 영향을 받음
		 *  
		 * ex) pageLimit : 10이라는 가정하에
		 *     startPage : 1, 11, 21, 31, ..... 	=> n * 10 + 1
		 *  
		 *     currentPage = 1		=>	1			=> 0 * 10 + 1	=>	n=0
		 *     currentPage = 5		=>	1			=> 0 * 10 + 1	=>	n=0
		 *     currentPage = 10		=>	1			=> 0 * 10 + 1	=> 	n=0
		 *     
		 *     currentPage = 11		=>	11			=> 1 * 10 + 1	=>	n=1
		 *     currentPage = 15		=> 	11			=> 1 * 10 + 1	=>	n=1
		 *     currentPage = 20		=>	11			=> 1 * 10 + 1	=> 	n=1
		 *     
		 *     currentPage = 1~10	=> 	n=0
		 *     currentPage = 11~20	=>	n=1
		 *     currentPage = 21~20	=>	n=2
		 *     										  0 ~ 9	  /		10			=> 0
		 *     										10 ~ 19   /		10			=> 1
		 *     						=>	n = (currentPage - 1) / pageLimit
		 *     		startPage => n * 10 + 1	 ==	 (currentPage - 1) / pageLimit * 10 + 1
		 *  
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		/*
		 * ex) pageLimit이 10이라는 가정하에
		 * 
		 * startPage : 1	=>	endPage : 10
		 * startPage : 11	=>	endPage : 20
		 * startPage : 21	=>	endPage : 30
		 */
		endPage = startPage + pageLimit - 1;
		
		// 만약 maxPage가 고작 13까지 밖에 안된다면? endPage를 다시 13으로 해줘야됨!!
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 페이징정보들을 하나의 공간에 담아서 보내자!!
		// 1. 페이징바 만들때 필요한 PageInfo 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<Recommend> list = new RecommendService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/manage_post/recommend/recommendListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
