package com.kh.adminPlan.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.adminPlan.model.service.PlanService;
import com.kh.adminPlan.model.vo.PlanComment;
import com.kh.common.PageInfo;

/**
 * Servlet implementation class AdminPlanCommentListServlet
 */
@WebServlet("/adminPage/rlist.pl")
public class AdminPlanCommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPlanCommentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대갯수
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수
		
		int maxPage;		// 전체 페이지들 중에서의 가장 마지막 페이지
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작수
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수
		
		listCount = new PlanService().selectCommentCount(pno);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 5;
		boardLimit = 10;
		
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
		
		ArrayList<PlanComment> commentList = new PlanService().selectCommentList(pi, pno);
		
		// 비동기로 진행
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject jsonUser = new JSONObject();
		jsonUser.put("pi", pi);
		jsonUser.put("list", commentList);

		Gson gson = new GsonBuilder().setDateFormat("yy.MM.dd HH:mm").create();
		gson.toJson(jsonUser, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
