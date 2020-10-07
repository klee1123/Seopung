package com.kh.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.message.model.service.MessageService;

/**
 * Servlet implementation class MessageSenderDeleteServlet
 */
@WebServlet("/deleteSend.ms")
public class MessageSenderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSenderDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] mno = request.getParameterValues("ino");
		
		int result = new MessageService().messageDelete(mno);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "메세지 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/send.ms?currentPage=1");
			
		}else {
			request.setAttribute("errorMsg", "메세지 삭제 실패");
			response.sendRedirect(request.getContextPath() + "/send.ms?currentPage=1");
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
