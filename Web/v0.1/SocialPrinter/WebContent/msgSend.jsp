<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*"%>  
<%@ page import="java.net.*"%>  

<%
	// Get the message from requeset object
	String msg = request.getParameter("msg");

	// Social Printer IP Address & Port Number for creating socket
	String ip="192.168.45.181";
	int port=3500; 
	Socket socket= new Socket(ip,port);
	
	
	InputStream is = socket.getInputStream();
	OutputStream os = socket.getOutputStream();
	OutputStreamWriter osw = new OutputStreamWriter(os);
	PrintWriter pw = new PrintWriter(osw);
	
	// Send the message to friend's Social Printer using socket
	pw.println(msg);
	pw.flush();
	pw.close();
	socket.close();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

	<script type="text/javascript">
	window.onload = function(){
		alert("Transmit Completion!");
		window.location.href = "index.jsp";
	}
	</script> 
</head>
<body>

</body>
</html>