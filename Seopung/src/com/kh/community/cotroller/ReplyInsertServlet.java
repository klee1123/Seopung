package com.kh.community.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Reply;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/rinsert.co")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String replyContent = request.getParameter("content");
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println(cno);
		LoginUser loginUser = ((LoginUser)request.getSession().getAttribute("loginUser"));
		
		int userNo = loginUser.getUserNo();
		
		Reply r = new Reply();
		
		r.setReplyContent(replyContent);
		r.setRefCommunityNo(cno);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new CommunityService().insertReply(r);
		
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
