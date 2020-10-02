package com.kh.community.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.community.model.service.CommunityService;

/**
 * Servlet implementation class CommunityScrapServlet
 */
@WebServlet("/scrap.co")
public class CommunityScrapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityScrapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 LoginUser loginUser = (LoginUser)request.getSession().getAttribute("loginUser");
		 
		 	int userNo = loginUser.getUserNo();
			int cno = Integer.parseInt(request.getParameter("cno"));
			
		int result = new CommunityService().increaseScrap(cno, userNo);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "스크랩되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detailList.co?cno=" + cno);
		}else {
			int result1 = new CommunityService().decreaseScrap(cno);
			if(result1 > 0) {
				request.getSession().setAttribute("alertMsg", "이미 스크랩한 글입니다.");
				response.sendRedirect(request.getContextPath() + "/detailList.co?cno=" + cno);
			}
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
