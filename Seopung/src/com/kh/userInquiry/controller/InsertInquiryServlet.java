package com.kh.userInquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.userInquiry.model.service.InquiryService;
import com.kh.userInquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InsertInquiryServlet
 */
@WebServlet("/insert.iq")
public class InsertInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInquiryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String inquiryType = request.getParameter("inquiryType");
		String userEmail = request.getParameter("userEmail");
		String sep = request.getParameter("sep");
		String content = request.getParameter("content");
		
		int userNo = 0;
		
		if(sep.equals("회원")){
		userNo = Integer.parseInt(request.getParameter("userNo"));
		}
		
		Inquiry iq = new Inquiry();
		
		iq.setTitle(title);
		iq.setInquiryType(inquiryType);
		iq.setUserEmail(userEmail);
		iq.setUserNo(userNo);
		iq.setSep(sep);
		iq.setContent(content);
		
		int result = new InquiryService().insertInquiry(iq);
		
		// 임시(에러페이지 주소 추가 수정해야함)
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "문의 제출 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/enrollForm.iq");
		}else {
			request.setAttribute("errorMsg", "문의 제출 실패하였습니다.");
			request.getRequestDispatcher("").forward(request, response);
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
