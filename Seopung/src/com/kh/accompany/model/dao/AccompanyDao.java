package com.kh.accompany.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;



public class AccompanyDao {

private Properties prop = new Properties();
	
	public AccompanyDao() {
		
		String fileName = AccompanyDao.class.getResource("/sql/accompany/accompany-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
