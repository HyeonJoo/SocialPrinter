<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page import="java.util.List"%>  
<%@ page import="java.util.StringTokenizer"%>  

<%@ page import="org.apache.commons.lang3.*"%>  
<%@ page import="org.apache.http.impl.client.*"%>  
<%@ page import="org.apache.http.client.methods.*"%>  

<%@ page import="com.restfb.exception.FacebookOAuthException"%>  
<%@ page import="com.restfb.Parameter"%>  
<%@ page import="com.restfb.types.FacebookType"%>  
<%@ page import="com.restfb.DefaultFacebookClient"%>  
<%@ page import="com.restfb.Connection"%>  
<%@ page import="com.restfb.types.User"%> 

<%

	/*
		Facebook App Information - Key & Secret Number
	*/
 	String appKey = "1470504256518635";
 	String appSecret = "e66effa789e10373f6cc2a0889424a84";
 	String code = request.getParameter("code");
 	String errorReason = request.getParameter("error_reason");
 	String error = request.getParameter("error");
 	String errorDescription = request.getParameter("error_description");

 	String accesstoken = "";
 	String result = "";
 	
 	
 	if (StringUtils.isNotEmpty(code)) {
 		// Get the access_token for using login user information	
 		HttpGet get = new HttpGet(
 				"https://graph.facebook.com/oauth/access_token"
 						+ "?client_id="
 						+ appKey
 						+ "&client_secret="
 						+ appSecret
 						+ "&scope=publish_stream,offline_access,read_friendlists,user_friends"
 						+ "&redirect_uri=http://192.168.0.3:8080/SocialPrinter_Web_02/dispatch.do" 
 						+ "&code=" + code);

 		DefaultHttpClient http = new DefaultHttpClient();
 		result = http.execute(get, new BasicResponseHandler());

 		accesstoken = result.substring(result.indexOf("=") + 1);
 		StringTokenizer st = new StringTokenizer(accesstoken, "&");
 		accesstoken = st.nextToken();
 		
 	}
 	
 	DefaultFacebookClient fbClient = new DefaultFacebookClient(accesstoken);  
	User me = fbClient.fetchObject("me", User.class);
	Connection<User> friends = null;
	
 	try{
 		// Get the information of login user
 		friends = fbClient.fetchConnection("me/taggable_friends", User.class, Parameter.with("fields", "id, name, username, birthday"), Parameter.with("limit", 10));
 	}catch(FacebookOAuthException e) {  
 		System.out.println("Facebook Error:" + e.getMessage());
 	}
 	
 %> 

<html>
<head>
	<meta charset="UTF-8">
	<title>Social Printer</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="css/ie7.css" type="text/css">
	<![endif]-->
	
	<script type="text/javascript">
	function goRegister(){
		document.getElementById('register').action="http://localhost:8080/SocialPrinter_Web_02/registerGo.do";
		document.getElementById('register').submit();
	}
	
	function selectFriend(friendName){
		var msgBox = document.getElementById("msgBox");
		msgBox.style.display = "";
		
		var msg = document.getElementById("msg");
		msg.value = "To. " + friendName + " ";
		
	}
	
	function sendMsg(){
		document.getElementById('msgSend').action="http://localhost:8080/SocialPrinter_Web_02/sendMsgGo.do";
		document.getElementById('msgSend').submit();
	}
	
	</script>
</head>
<body>
	<div id="header">
		<div>
			<div>
				<span>Send the letter to your friends ..</span>
				<a href="#" class="logo"> <!-- <img src="/resources/images/logo.png" alt="">  -->
					<img src="<c:url value="/resources/images/logo_01.gif"/>" />
				</a>
				<span class="tagline">Use Social Printer.</span>
			</div>
			<ul>
				<li>
					<a href="#">home</a>
				</li>
				<li>
					<a href="#">about</a>
				</li>
				<li>
					<a href="#">register</a>
				</li>
				<li class="selected">
					<a href="#">dispatch</a>
				</li>
				<li>
					<a href="#">subscription</a>
				</li>
				<li>
					<a href="#">store</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="body">
		<div class="content">
			<div id="section">
				<h2>Dispatch</h2>
				 
				<div id="fbFriendsList">
					<h1>Friends List..</h1>
					
					<br/>
					<select name="fbFriedns" size="5" multiple>
					<% 
						// Print friends list of login user
						for(int i=0;i<friends.getData().size();i++) { 
	    					User user = friends.getData().get(i);
					%>
	    			<option value='<%=user.getName() %>' onclick="javascript:selectFriend('<%=user.getName() %>');">
	    			<%=user.getName() %>
					<%} %>
					
					</select>
					
					<div id="msgBox" style="display: none">
						<br/>
						<form id="msgSend">
							<textarea id="msg" name="msg" style=display:none" cols="30" rows="10"></textarea>
							<input type="submit" value="Send" onclick="javascript:sendMsg();" />
						</form>
					</div>
					
				</div>
			</div>
			
			<div id="sidebar">
			</div>
			
		</div>
	</div>
	<div id="footer">
		<div>
			<p>
				Copyright &copy; <a href="#">Cardio Center</a>
			</p>
			<ul>
				<li>
					<a href="#">home</a>
				</li>
				<li>
					<a href="#">about</a>
				</li>
				<li>
					<a href="#">our members</a>
				</li>
				<li>
					<a href="#">services</a>
				</li>
				<li>
					<a href="#">forms</a>
				</li>
				<li>
					<a href="#">contact</a>
				</li>
				<li>
					<a href="#">blog</a>
				</li>
			</ul>
			<div>
				<span>stay connected:</span>
				<a href="#" id="facebook">facebook</a>
				<a href="#" id="twitter">twitter</a>
				<a href="#" id="googleplus">googleplus</a>
			</div>
		</div>
	</div>
</body>
</html>