package com.kh.Member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailSendServlet
 */
@WebServlet("/send")
public class EmailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Properties props = System.getProperties();
			props.put("mail.smtp.user", "didaos1231");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.soketFatory.fallback", "false");
			
			Authenticator auth = new MyAuthentication();
			
			Session session = Session.getDefaultInstance(props, auth);
			MimeMessage msg = new MimeMessage(session);
			
			try {
				msg.setSentDate(new Date());
				
				InternetAddress from = new InternetAddress("didaos1231@gmail.com");
				
				
				msg.setFrom(from);
				
				String email = request.getParameter("receiver");
				InternetAddress to = new InternetAddress(email);
				msg.setRecipient(Message.RecipientType.TO, to);
				
				msg.setSubject("인증번호", "UTF-8");
				String code = request.getParameter("code_check");
				request.setAttribute("code", code);
				msg.setText(code, "UTF-8");
				
				msg.setHeader("content-Type", "text/html");
				
				javax.mail.Transport.send(msg);
				System.out.println("보냄!");
			}catch (AddressException addr_e) {
				addr_e.printStackTrace();
			}catch(MessagingException msg_e) {
				msg_e.printStackTrace();
				
				
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("views/member/memberEnrollForm.jsp");
			
			rd.forward(request, response);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print("인증번호를 발송했습니다");
	}
	
		class MyAuthentication extends Authenticator{
			
			PasswordAuthentication pa;
			
			public MyAuthentication() {
				String id = "didaos1231";
				String pw = "vkfdhdl462!";
				
				pa = new PasswordAuthentication(id, pw);
			}
			
			public PasswordAuthentication getPasswordAuthentication() {
				
				return pa;
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
