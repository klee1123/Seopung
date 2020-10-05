package com.kh.accompany.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.accompany.model.service.AccompanyService;
import com.kh.adminMember.model.vo.Report;
import com.kh.report.model.service.ReportService;

/**
 * Servlet implementation class AccompanyReportServlet
 */
@WebServlet("/report.ac")
public class AccompanyReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String reportUserNo = request.getParameter("reportUserNo");
		String reportUserNo2 = request.getParameter("reportUserNo2");
		System.out.println(reportUserNo2);
		int reportPostNo = Integer.parseInt(request.getParameter("planNo"));
		System.out.println(reportPostNo);
		String reportType = request.getParameter("reportType");
		String reportContent = request.getParameter("reportContent");
		
		
		
		Report accomReport = new Report(reportUserNo, reportUserNo2, reportPostNo, reportType, reportContent);
		
		int result = new AccompanyService().checkReport(accomReport);
		
		System.out.println(result);
		
		if(result > 0) {
			
			result = 0;
			
			request.getSession().setAttribute("alertMsg", "이미 신고된 회원입니다.");
			
		}else {
			
			result = new AccompanyService().insertReport(accomReport);
			request.getSession().setAttribute("alertMsg", "신고가 성공적으로 접수되었습니다.");
			
			result = new AccompanyService().updateReport(accomReport);
			
			
			
		}

		
		response.sendRedirect(request.getContextPath() + "/list.ac?currentPage=1");
	 
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
