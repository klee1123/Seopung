package com.kh.searchPlan.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.adminMember.model.service.MemberService;
import com.kh.adminMember.model.vo.Member;

/**
 * Servlet implementation class PlanProfileDetailServlet
 */
@WebServlet("/profile.pl")
public class PlanProfileDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanProfileDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Member m = new MemberService().selectMember(userNo);
		
		// 비동기로 진행
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject jsonUser = new JSONObject();
		jsonUser.put("m", m);

		Gson gson = new Gson();
		gson.toJson(jsonUser, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
