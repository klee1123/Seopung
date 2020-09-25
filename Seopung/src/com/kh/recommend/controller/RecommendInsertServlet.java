package com.kh.recommend.controller;

import java.io.File;
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
 * Servlet implementation class RecommendInsertServlet
 */
@WebServlet("/adminPage/insert.re")
public class RecommendInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024; // 10mb
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/reco_thumb_upfiles");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// DB에 전달할 값 뽑기
			String adminNo = multiRequest.getParameter("adminNo");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			Recommend r = new Recommend();
			r.setRecommendWriter(adminNo);
			r.setRecommendTitle(title);
			r.setRecommendContent(content);

			String changeName = multiRequest.getFilesystemName("thumbnail");
			r.setThumbnailPath("resources/reco_thumb_upfiles/" + changeName);
			
			int result = new RecommendService().insertRecommend(r);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "추천코스 등록 성공");
				response.sendRedirect(request.getContextPath() + "/adminPage/list.re?currentPage=1");
				
			}else {
				// 실패한 파일 삭제
				File failedFile = new File(savePath + changeName); // java.io.File
				failedFile.delete();
				
				request.setAttribute("errorMsg", "추천코스 등록 실패");
				request.getRequestDispatcher("../views/admin/common/errorPage.jsp").forward(request, response);
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
