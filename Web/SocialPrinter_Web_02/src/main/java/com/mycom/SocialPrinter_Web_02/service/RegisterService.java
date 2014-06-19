package com.mycom.SocialPrinter_Web_02.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.SocialPrinter_Web_02.controller.RegisterController;
import com.mycom.SocialPrinter_Web_02.dao.RegisterDao;
import com.mycom.SocialPrinter_Web_02.model.RegisterVO;

@Service
public class RegisterService {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterService.class);
	
	@Autowired private RegisterDao registerDao;
	
	public void insertAccount(RegisterVO registerVO){
		logger.info("Start RegisterService");
		
		registerDao.insertAccount(registerVO);
	}
}
