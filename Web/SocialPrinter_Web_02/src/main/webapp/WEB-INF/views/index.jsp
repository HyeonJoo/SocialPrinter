<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%  
	/*
		Facebook App Information for Authentication - Key & Secret Number
	*/
    String appKey       = "1470504256518635";  
    String appSecret    = "e66effa789e10373f6cc2a0889424a84";  
      
    String url = "http://www.facebook.com/dialog/oauth?client_id="+  
    		appKey+"&redirect_uri=http://192.168.0.3:8080/SocialPrinter_Web_02/dispatch.do&scope=publish_stream,offline_access,read_friendlists,user_friends,user_photos";  
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
	
	// Authentication Start
	function fb_login() {  
	    window.location.href = '<%=url%>';
	}  
	
	function goTopMenu(menuVal){
		if(menuVal=="register"){
			document.getElementById('topMenuForm').action="http://localhost:8080/SocialPrinter_Web_02/register.do";
			document.getElementById('topMenuForm').submit();
		}
	}
	
	function LedOn(){
		var popup = window.open("http://192.168.0.30/?LED=1", "hiddenframe", "width=0,height=0,top=0,left=0,statusbar=no,scrollbars=no,toolbar=no");
		popup.focus();
	}
	
	function LedOff(){
		var popup = window.open("http://192.168.0.30/?LED=0", "hiddenframe", "width=0,height=0,top=0,left=0,statusbar=no,scrollbars=no,toolbar=no");
		popup.focus();
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
			
			<form id="topMenuForm" method="get" action="">
			<ul>
				<li class="selected">
					<a href="#">home</a>
				</li>
				<li>
					<a href="#">about</a>
				</li>
				<li>
					<a href="#" onclick="goTopMenu('register')">register</a>
				</li>
				<li>
					<a href="#" onclick="javascript:fb_login();">dispatch</a>
				</li>
				<li>
					<a href="#">subscription</a>
				</li>
				<li>
					<a href="#">store</a>
				</li>
			</ul>
			</form>
			
		</div>
	</div>
	<div id="body">
		<div class="header">
			<div>
				<img src="<c:url value="/resources/images/post_01.jpg"/>" alt="">
				<ul>
					<li>
						<a href="#">Feature.1</a>
					</li>
					<li>
						<a href="#">Feature.2</a>
					</li>
					<li>
						<a href="#">Feature.3</a>
					</li>
					<li>
						<a href="#">Feature.4</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="body">
			<div class="section">
				<div class="article">
					<h2>Welcome Social Printer!</h2>
					<img src="<c:url value="/resources/images/love_01.bmp"/>" alt="">
					<p>
						.......
					</p>
				</div>
				<div class="aside">
					<b>Social Printer News.</b>
					<p>
						It is a global product!
					</p>
					<a href="#">- Princess, PMJ</a>
				</div>
			</div>
		</div>
		<div class="footer">
			<div>
				<a href="#"><img src="<c:url value="resources/images/doctors.jpg"/>" alt=""></a>
				<h3>our members..</h3>
				<p>
					FunFun with PMJ, PHJ, LAR, JYB!
				</p>
			</div>
			<div>
				<a href="#"><img src="<c:url value="/resources/images/what-can-we-do.jpg"/>" alt=""></a>
				<h3>what we can do for you</h3>
				<p>
					Everything!
				</p>
			</div>
			<div>
				<a href="#"><img src="<c:url value="/resources/images/where-you-can-find.jpg"/>" alt=""></a>
				<h3>where you can find us</h3>
				<p>
					02)111-1111
				</p>
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
	
	<iframe width=0 height=0 name='hiddenframe' style='display:none;'></iframe>

	
</body>
</html>