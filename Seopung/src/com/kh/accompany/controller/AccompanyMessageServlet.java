package com.kh.accompany.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.accompany.model.service.AccompanyService;

/**
 * Servlet implementation class AccompanyMessageServlet
 */
@WebServlet("/message.ac")
public class AccompanyMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int senderNo = Integer.parseInt(request.getParameter("senderNo"));
		System.out.println(senderNo);
		int receiverNo = Integer.parseInt(request.getParameter("receiverNo"));
		System.out.println(receiverNo);
		
		int flagNo = Integer.parseInt(request.getParameter("flagNo"));
		
		
		
		String introduction = request.getParameter("introduction");
		
		int result = new AccompanyService().sendMessage(senderNo, receiverNo, introduction);
		
		
		if(flagNo == 1) {
		
		
			response.sendRedirect(request.getContextPath() + "/list.ac?currentPage=1");
		}else {
			
			response.sendRedirect(request.getContextPath() + "/receiver.ms?currentPage=1");
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
