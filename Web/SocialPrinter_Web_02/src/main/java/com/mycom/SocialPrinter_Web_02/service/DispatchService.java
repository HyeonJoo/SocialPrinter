package com.mycom.SocialPrinter_Web_02.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycom.SocialPrinter_Web_02.model.MsgVO;

@Service
public class DispatchService {
	
	private static final Logger logger = LoggerFactory.getLogger(DispatchService.class);
	
	private static final String serverIp = "192.168.0.116";
//	private static final String serverIp = "127.0.0.1";
	private static final int serverPort = 5000;
	
	public void sendMsg(MsgVO msgVO) throws UnknownHostException, IOException{
		logger.info("Start DispatchService: sendMsg");
		
		Socket socket = null;
		BufferedReader br = null;
		PrintWriter pw = null;
		
		try {
			socket = new Socket(serverIp, serverPort);
			logger.info("Server Connection!");
			
			br = new BufferedReader(new InputStreamReader(System.in));
			pw = new PrintWriter(socket.getOutputStream(), true);
			String msg = msgVO.getMsg();
			
			pw.println(msg);
		}finally{
			if(pw != null)
				pw.close();
			
			if(br != null)
				br.close();
			
			if(socket != null)
				socket.close();
			
			logger.info("Server Connection End!");
		}
		
		logger.info("End DispatchService: sendMsg");
	}

}
