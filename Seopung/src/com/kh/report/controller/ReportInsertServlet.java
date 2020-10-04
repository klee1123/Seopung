package com.kh.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Member.model.vo.LoginUser;
import com.kh.report.model.service.ReportService;
import com.kh.report.model.vo.Report;

/**
 * Servlet implementation class ReportInsertServlet
 */
@WebServlet("/insert.rp")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int postNo = Integer.parseInt(request.getParameter("reportPostNo"));
		String userNo2 = request.getParameter("reportUserNo2");
		int reportPostType = Integer.parseInt(request.getParameter("reportPostType"));
		String reportType = request.getParameter("reportType");
		String content = request.getParameter("reportContent");
		
		String userNo = ((LoginUser)request.getSession().getAttribute("loginUser")).getUserNo() + "";
		
		Report r = new Report(content, userNo, userNo2, postNo, reportType, reportPostType);
		
		int result = new ReportService().checkReport(r);
		
		if(result>0) {
			result = 0;
		}else {
			result = new ReportService().insertReport(r);
		}

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
