package com.kh.information.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.information.model.service.InfoService;

/**
 * Servlet implementation class DeleteProfilePicServlet
 */
@WebServlet("/DeleteProfile.in")
public class DeleteProfilePicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProfilePicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new InfoService().deleteProfilePic(userNo);
		
		if(result > 0) {
		
			response.sendRedirect(request.getContextPath()+ "/myPage.me");
		}else {
			request.getSession().setAttribute("errorMsg","프로필 삭제에 실패했습니다");
			response.sendRedirect(request.getContextPath()+ "/views/common/errorPage.jsp");
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
