package com.kh.adminMember.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminMember.model.service.MemberService;
import com.kh.adminMember.model.vo.Report;
import com.kh.common.PageInfo;

/**
 * Servlet implementation class BlacklistDetailServlet
 */
@WebServlet("/adminPage/detail.bl")
public class BlacklistDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginUser") != null){
		
			int reportListCount;
			int currentPage;
			int pageLimit;
			int boardLimit;
			
			int maxPage;
			int startPage;
			int endPage;
			
			int userNo = Integer.parseInt(request.getParameter("uno"));
			reportListCount = new MemberService().selectReportListCount(userNo);
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			pageLimit = 5;
			boardLimit = 10;
	
			if(reportListCount != 0) {
				maxPage = (int)Math.ceil((double)reportListCount/boardLimit);
			}else{
				maxPage = 1;
			}
			
			startPage = (currentPage-1)/pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			
			if(maxPage<endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(reportListCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			ArrayList<Report> reportList = new MemberService().selectReportList(pi, userNo);
			
			request.setAttribute("userNo", userNo);
			request.setAttribute("pi", pi);
			request.setAttribute("reportList", reportList);
			request.setAttribute("pageTitle", "블랙리스트 신고내역 조회");
			request.getRequestDispatcher("../views/admin/manage_member/blacklist/manageBlacklistDetailView.jsp").forward(request, response);
		
		}else{
			request.setAttribute("errorMsg", "로그인 후 이용 가능한 서비스 입니다.");
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
