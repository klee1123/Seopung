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
		
		String inquiryType = request.getParameter("inquiryType");
		String userEmail = request.getParameter("userEmail");
		String userPrivacy = request.getParameter("userPrivacy");
		
		Inquiry iq = new Inquiry();
		iq.setInquiryType(inquiryType);
		iq.setUserEmail(userEmail);
		iq.setUserPrivacy(userPrivacy);
		
		int result = new InquiryService().insertInquiry(iq);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
