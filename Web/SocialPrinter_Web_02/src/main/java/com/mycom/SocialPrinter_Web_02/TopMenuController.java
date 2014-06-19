package com.mycom.SocialPrinter_Web_02;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TopMenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(TopMenuController.class);
	
	@RequestMapping("/register.do")
	public String registerView(Locale locale, Model model) {
		logger.info("Welcome register! The client locale is {}.", locale);
		
		return "register";
	}
	
	@RequestMapping("/dispatch.do")
	public String dispatchView(Locale locale, Model model) {
		logger.info("Welcome dispatch! The client locale is {}.", locale);
		
		return "dispatch";
	}

}
