package com.kh.recommend.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class RecommendDao {
	
	private Properties prop = new Properties();
	
	public RecommendDao() {
		
		String fileName = RecommendDao.class.getResource("/sql/recommend/recommend-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
