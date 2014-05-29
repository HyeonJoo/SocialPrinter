<p>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>  

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
 						+ "&redirect_uri=http://192.168.45.176:8080/SocialPrinter/friendsList.jsp" 
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
	


<!DOCTYPE HTML>
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
	<div id="adbox2">
			<div id="fbFriendsList">
					<h1>Friends List..</h1>
					<br/><br/>
					<% 
						// Print friends list of login user
						for(int i=0;i<friends.getData().size();i++) { 
	    					User user = friends.getData().get(i);
					%>
	    
	    			<a href="msg.jsp?fb_name=<%= user.getName() %>"><img src="./images/fb_picture.jpg" height="30" width="30"/> <%=user.getName() %> </a> <img src="images/printer.gif" alt="Img" height="25" width="25" >
	    			<br/><br/>    
					<%} %>
			</div>
	</div>

	<div id="contents">
		<div id="tagline" class="clearfix">
			<h1></h1>
		</div>
	</div>
	
</body>
</html>