package com.kh.community.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Community;

/**
 * Servlet implementation class CommunityDetailNoticeServlet
 */
@WebServlet("/detailNotice.co")
public class CommunityDetailNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetailNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new CommunityService().increaseCount(cno);
		
		if(result > 0) {
			Community nc = new CommunityService().selectNotice(cno);
			request.setAttribute("nc", nc);
			request.getRequestDispatcher("views/community/communityDetailNoticeView.jsp").forward(request, response);

		}else {
			request.setAttribute("errorMsg", "잘못된 주소입니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
