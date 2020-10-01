package com.kh.adminReport.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminReport.controller.AdminReportListServlet;
import com.kh.admin.model.vo.Admin;
import com.kh.adminNotice.model.service.AdminNoticeService;
import com.kh.adminNotice.model.vo.AdminNotice;
import com.kh.common.PageInfo;

/**
 * Servlet implementation class AdminListServlet
 */
@WebServlet("/adminPage/list.rp")
public class AdminReportListServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대갯수
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수
		
		int maxPage;		// 전체 페이지들 중에서의 가장 마지막 페이지
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작수
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수
		
		
		// 넘어온 값 뽑기
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// 상태분류와 키워드에 해당하는 데이터 수 조회
		listCount = new AdminReportListServlet().selectListCount();
		
		pageLimit = 5;
		
		boardLimit = 10;
		
		// 조회된 관리자수가 0일 경우 페이징오류 해결 위해서 (처리안하면 > >>가 보임) 
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
		
		ArrayList<AdminReportListServlet> list = new AdminReportListServlet().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("pageTitle", "신고 목록");
		
		request.getRequestDispatcher("../views/admin/manage_report/manageReportListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


