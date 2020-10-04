package com.kh.community.cotroller;

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
import com.kh.common.PageInfo;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Reply;

/**
 * Servlet implementation class ReplyListServlet
 */
@WebServlet("/rlist.co")
public class ReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		listCount = new CommunityService().countComment(cno);
		pageLimit = 5;
		boardLimit = 10;
		
		if(listCount != 0) {
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
		}else {
			maxPage = 1;
		}
		
		startPage = (currentPage -1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
	
		ArrayList<Reply> list = new CommunityService().selectReplyList(cno, pi);
			
			
			response.setContentType("application/json; charset=utf-8");
			JSONObject jsonUser = new JSONObject();
			jsonUser.put("pi", pi);
			jsonUser.put("list", list);
			
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
