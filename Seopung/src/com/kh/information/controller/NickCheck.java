package com.kh.information.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.information.model.service.InfoService;

/**
 * Servlet implementation class NickCheck
 */
@WebServlet("/nickChk.me")
public class NickCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NickCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nickChk = request.getParameter("nickChk");
		
		int count = new InfoService().nickCheck(nickChk);
		
		if(count == 1) { // 이미 존재하는 닉네임 => 사용불가
			// fail
			response.getWriter().print("fail");
		}else { 		 // 존재하는 닉네임 없음 => 사용가능
			// success
			response.getWriter().print("success");
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
