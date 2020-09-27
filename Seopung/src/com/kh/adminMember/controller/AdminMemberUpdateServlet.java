package com.kh.adminMember.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adminMember.model.service.MemberService;
import com.kh.adminMember.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdateServlet
 */
@WebServlet("/adminPage/update.me")
public class AdminMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String profile = request.getParameter("profilePath");
		String nickName = request.getParameter("userNickname");
		String userIntro = request.getParameter("userSelfIntro");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
		// 생일
		String year = request.getParameter("year");
		String month ="";
		String day ="";
		
		int imonth = Integer.parseInt(request.getParameter("month"));
		if(imonth<10) {
			month = "0" + imonth;
		}
		int iday = Integer.parseInt(request.getParameter("day"));
		if(iday<10) {
			day = "0" + iday; 
		}
		
		String birth = year + month + day;
		
		Member m = new Member();
		m.setUserNo(userNo);
		m.setProfile(profile);
		m.setNickName(nickName);
		m.setUserIntro(userIntro);
		m.setUserName(userName);
		m.setBirth(birth);
		m.setEmail(email);

		int result = new MemberService().updateMember(m);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원 수정 성공");
			response.sendRedirect(request.getContextPath() + "/adminPage/detail.me?userNo=" + userNo);
			
		}else {
			request.setAttribute("errorMsg", "회원 수정 실패");
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
