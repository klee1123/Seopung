package com.kh.recommend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.recommend.model.service.RecommendService;
import com.kh.recommend.model.vo.Recommend;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RecommendUpdateServlet1
 */
@WebServlet("/update.re")
public class RecommendUpdateServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendUpdateServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/re_thumb_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			int cno = Integer.parseInt(multiRequest.getParameter("cno"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String thumb = multiRequest.getParameter("thumbnail");
			Recommend nc = new Recommend();
			nc.setReNo(cno);
			nc.setTitle(title);
			nc.setContent(content);
			nc.setThumb(thumb);
			
			if(multiRequest.getOriginalFileName("thumbnail") != null) {
				String originName = multiRequest.getOriginalFileName("thumbnail");
				String changeName = multiRequest.getFilesystemName("thumbnail");
				String filePath = "resources/re_thumb_upfiles/";
				nc.setThumb(filePath + changeName);
				
			}
			int result = new RecommendService().updateRecommend(nc);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 수정됐습니다");

				response.sendRedirect(request.getContextPath() + "/detailList.re?cno=" + cno);
				
			}
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
