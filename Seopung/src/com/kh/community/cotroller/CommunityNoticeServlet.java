package com.kh.community.cotroller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Community;

/**
 * Servlet implementation class CommunityNoticeServlet
 */
@WebServlet("/notice.co")
public class CommunityNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userNo");
		String head = request.getParameter("head");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Community c = new Community( );
		c.setUserNo(userId);
		c.setHead(head);
		c.setTitle(title);
		c.setContent(content);
		int result = new CommunityService().insertNotice(c);
	
		String all = URLEncoder.encode("전체");
		String neww = URLEncoder.encode("최신");
		if(result > 0) {
			request.setCharacterEncoding("utf-8");
			request.getSession().setAttribute("alertMsg", "커뮤니티공지가 등록됐습니다");
		
			response.sendRedirect(request.getContextPath() + "/list.co?currentPage=1&head=" + all + "&array=" + neww);
			
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
