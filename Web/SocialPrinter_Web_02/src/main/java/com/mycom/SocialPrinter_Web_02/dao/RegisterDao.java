package com.mycom.SocialPrinter_Web_02.dao;

//import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.SocialPrinter_Web_02.model.RegisterVO;

@Repository
public class RegisterDao {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterDao.class);
	
	@Autowired 
	MongoTemplate mongoTemplate;
	
	private static String COLLECTION_NAME = "users";
	
//	@Autowired private SqlSession sqlSession;
	
	public void insertAccount(RegisterVO registerVO){
		logger.info("Start RegisterDao");
		
		mongoTemplate.insert(registerVO, COLLECTION_NAME);
		
//		sqlSession.insert("com.mycom.SocialPrinter_Web_02.mapper.RegisterMapper." + "insertAccount", registerVO);
	}
}
