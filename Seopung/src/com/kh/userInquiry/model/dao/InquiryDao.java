package com.kh.userInquiry.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.kh.admin.model.dao.AdminDao;

	public class InquiryDao {
		
			private Properties prop = new Properties();
			
			public InquiryDao() {
				
				String fileName = AdminDao.class.getResource("/sql/userInquiry/userInquiry-mapper.xml").getPath();
				
				try {
					prop.loadFromXML(new FileInputStream(fileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
	
	public int 
	
	

}
