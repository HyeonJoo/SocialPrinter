package com.mycom.SocialPrinter_Web_02.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.SocialPrinter_Web_02.model.RegisterVO;
import com.mycom.SocialPrinter_Web_02.service.RegisterService;



@Controller
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired private RegisterService registerService;

	@RequestMapping("/registerGo.do")
	public String register(@ModelAttribute RegisterVO registerVO, ModelMap model){
		logger.info("Start RegisterController");
		
		registerService.insertAccount(registerVO);
		
		return "home";
		
	}
}
