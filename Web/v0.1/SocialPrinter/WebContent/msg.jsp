<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*"%>  
<%@ page import="java.net.*"%>  

<%
	// Get the friend name from request object for sending the message
	String fb_name = request.getParameter("fb_name");
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome to Social Printer!</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>

	<div id="header">
		<div>
			<div class="logo">
			</div>
			<ul id="navigation">
				<li class="active">
					<a href="index.jsp">Home</a>
				</li>
				<li>
					<a href="#">About</a>
				</li>
				<li>
					<a href="#">Register</a>
				</li>
				<li>
					<a href="#">Dispatch</a>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="contents">
		<div class="section">
			<h1>Message Writing ... <img src="images/leaf.jpg" alt="Img" height="85" width="85"></h1>
			<p>
				You can send the message to your friends .. Express your mind & Keep the good relationship :)
			</p>
			<b>To. <%=fb_name %></b>
			<form action="msgSend.jsp" method="post" class="message">
				<textarea id="msg" name="msg"></textarea>
				<input type="submit" value="Send" />
			</form>
		</div>
	</div>

</body>
</html>