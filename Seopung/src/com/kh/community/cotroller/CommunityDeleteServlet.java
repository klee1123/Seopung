package com.kh.community.cotroller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.CommunityService;

/**
 * Servlet implementation class CommunityDeleteServlet
 */
@WebServlet("/delete.co")
public class CommunityDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new CommunityService().deleteCommunity(cno);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "게시물이 삭제되었습니다");
			String all = URLEncoder.encode("전체");
			String neww = URLEncoder.encode("최신");

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
