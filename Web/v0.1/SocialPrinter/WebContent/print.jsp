<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%

	String serverIP = "192.168.0.30";
	System.out.println("Server Connecting ..");
	
	Socket socket = new Socket(serverIP, 80);
	
	InputStream in = socket.getInputStream();
	DataInputStream dis = new DataInputStream(in);
	
	System.out.println("message: " + dis.readUTF());
	
	dis.close();
	socket.close();
	
	System.out.println("Connect End..");
	


%>