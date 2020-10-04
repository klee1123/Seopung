package com.kh.searchPlan.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.adminPlan.model.service.PlanService;
import com.kh.adminPlan.model.vo.PlanComment;

/**
 * Servlet implementation class PlanCommentInsertServlet
 */
@WebServlet("/rinsert.pl")
public class PlanCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content");
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int userNo = ((LoginUser)request.getSession().getAttribute("loginUser")).getUserNo();
		
		PlanComment c = new PlanComment();
		c.setCommentWriter(userNo+"");
		c.setContent(content);
		c.setPlanNo(pno);
		
		int result = new PlanService().insertComment(c);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
