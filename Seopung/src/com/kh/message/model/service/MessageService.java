package com.kh.message.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.accompany.model.dao.AccompanyDao;
import com.kh.accompany.model.vo.Accompany;
import com.kh.common.PageInfo;
import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;




public class MessageService {
	
	public int selectReceiverCount(int userNo) {
		
		Connection conn = getConnection();
		
		int listCount = new MessageDao().selectReceiverCount(conn, userNo);
		
		close(conn);
		
		return listCount;
		
		
	}
	
	public ArrayList<Message> selectReceiverList(PageInfo pi, int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectReceiverList(conn, pi, userNo);
		
		close(conn);
		
		return list;
		
		
		
	}
	
	
	
	

}
