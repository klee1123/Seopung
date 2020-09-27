package com.kh.adminRecommend.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.adminRecommend.model.service.RecommendService;
import com.kh.adminRecommend.model.vo.Recommend;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RecommendUpdateServlet
 */
@WebServlet("/adminPage/update.re")
public class RecommendUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024; // 10mb
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/reco_thumb_upfiles");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int currentPage = Integer.parseInt(multiRequest.getParameter("currentPage"));
			
			int rno = Integer.parseInt(multiRequest.getParameter("rno"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			Recommend r = new Recommend();
			r.setRecommendNo(rno);
			r.setRecommendTitle(title);
			r.setRecommendContent(content);
			
			// 새로운 썸네일 사진 파일이 있을 경우
			if(multiRequest.getOriginalFileName("thumbnail") != null) {
				String changeName = multiRequest.getFilesystemName("thumbnail");
				r.setThumbnailPath("resources/reco_thumb_upfiles/" + changeName); // 새로운 썸네일 경로 담기
			}else { // 없을 경우
				
				Recommend re = new RecommendService().selectRecommend(rno); //기존 게시글 정보를 담는 객체
				r.setThumbnailPath(re.getThumbnailPath()); // 기존 썸네일 경로 담아주기
			}
			
			int result = new RecommendService().updateRecommend(r);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "추천코스 수정 성공");
				response.sendRedirect(request.getContextPath() + "/adminPage/detail.re?currentPage=" + currentPage + "&rno=" + rno);
				
			}else {
				// 실패한 파일있을 경우 삭제
				if(multiRequest.getOriginalFileName("thumbnail") != null) {
					String changeName = multiRequest.getFilesystemName("thumbnail");
					File failedFile = new File(savePath + changeName);
					failedFile.delete();
				}
				
				request.setAttribute("errorMsg", "추천코스 수정 실패");
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
