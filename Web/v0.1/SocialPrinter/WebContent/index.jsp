<p>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>  

<!-- 
	File Name: index.jsp
	Author: Park Mijeong (mjpark03@gmailcom)
	
	It is Web Server of Social Printer!
	You can send the message to friend's Social Printer using this web site.
	
 -->
<%  
	/*
		Facebook App Information for Authentication - Key & Secret Number
	*/
    String appKey       = "1470504256518635";  
    String appSecret    = "e66effa789e10373f6cc2a0889424a84";  
      
    String url = "http://www.facebook.com/dialog/oauth?client_id="+  
    		appKey+"&redirect_uri=http://192.168.45.176:8080/SocialPrinter/friendsList.jsp&scope=publish_stream,offline_access,read_friendlists,user_friends,user_photos";  
%> 


<!DOCTYPE HTML>
<html>

<head>
	<meta charset="UTF-8">
	<title>Welcome to Social Printer!</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	
	<script type="text/javascript">
		// Authentication Start
		function fb_login() {  
		    window.location.href = '<%=url%>';
		}  
	</script> 
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
	<div id="adbox">
		<div class="clearfix">
			<img src="images/printer.gif" alt="Img" height="342" width="368">
			<div>
				<h1>Letter?</h1>

				<h2>Use Social Printer</h2>
				<p>
					You can send the letter using Social Printer and SNS.. Express your mind and Give your friend wise saying...... :)
					<br/><br/>
					<span><a href="javascript:fb_login();"  class="btn">PRINT NOW!</a></span>
				</p>
			</div>
		</div>
	</div>

</body>
</html>