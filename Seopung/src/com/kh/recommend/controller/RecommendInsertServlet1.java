package com.kh.recommend.controller;

import java.io.IOException;
import java.net.URLEncoder;

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
 * Servlet implementation class RecommendInsertServlet1
 */
@WebServlet("/insert.re")
public class RecommendInsertServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendInsertServlet1() {
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
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String thumb = multiRequest.getParameter("thumbnail");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			Recommend c = new Recommend();
			
			c.setTitle(title);
			c.setContent(content);
			c.setUserNo(userNo);
			c.setThumb(thumb);
			
			if(multiRequest.getOriginalFileName("thumbnail") != null) {
				String originName = multiRequest.getOriginalFileName("thumbnail");
				String changeName = multiRequest.getFilesystemName("thumbnail");
				String filePath = "resources/re_thumb_upfiles/";
				c.setThumb(filePath + changeName);
				
			}
			int result = new RecommendService().insertRecommend(c);
			String neww = URLEncoder.encode("최신");
			if(result > 0) {
				request.setCharacterEncoding("utf-8");
				request.getSession().setAttribute("alertMsg", "게시글 등록됐습니다");
			

				response.sendRedirect(request.getContextPath() + "/list.re?currentPage=1&array=" + neww);
				
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
