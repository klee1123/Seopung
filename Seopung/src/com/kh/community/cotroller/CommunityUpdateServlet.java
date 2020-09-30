package com.kh.community.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Community;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CommunityUpdateServlet
 */
@WebServlet("/update.co")
public class CommunityUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateServlet() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/com_thumb_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			int cno = Integer.parseInt(multiRequest.getParameter("cno"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String thumb = multiRequest.getParameter("thumbnail");
			String head = multiRequest.getParameter("head");
			
			Community c = new Community();
			
			c.setTitle(title);
			c.setContent(content);
			c.setComNo(cno);
			c.setHead(head);
			c.setThumb(thumb);
			
			if(multiRequest.getOriginalFileName("thumbnail") != null) {
				String originaName = multiRequest.getOriginalFileName("thumbnail");
				String changeName = multiRequest.getFilesystemName("thumbnail");
				String filePath = "resources/com_thumb_upfiles/";
				c.setThumb(filePath + changeName);
			}
			
			int result = new CommunityService().updateCommunity(c);
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "게시물이 수정됐습니다.");
				
				response.sendRedirect(request.getContextPath() + "/detailList.co?cno=" + cno);
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
