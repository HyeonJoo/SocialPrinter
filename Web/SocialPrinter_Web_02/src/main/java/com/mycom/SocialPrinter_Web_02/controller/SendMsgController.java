package com.mycom.SocialPrinter_Web_02.controller;


import java.io.IOException;
import java.net.UnknownHostException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.SocialPrinter_Web_02.model.MsgVO;
import com.mycom.SocialPrinter_Web_02.service.DispatchService;



@Controller
public class SendMsgController {
	
	private static final Logger logger = LoggerFactory.getLogger(SendMsgController.class);
	
	@Autowired private DispatchService dispatchService;
	
	@RequestMapping("/sendMsgGo.do")
	public String sendMsg(@ModelAttribute MsgVO msgVO, ModelMap model) throws UnknownHostException, IOException{
		logger.info("Start SendMsgController: sendMsg");
		logger.info("msg: " + msgVO.getMsg());
		
		dispatchService.sendMsg(msgVO);
		
		logger.info("End SendMsgController: sendMsg");
		return "index";
		
	}
}
