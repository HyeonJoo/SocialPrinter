<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>Social Printer - login</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="css/ie7.css" type="text/css">
	<![endif]-->
	
	<script type="text/javascript">
	function goRegister(){
		document.getElementById('register').action="http://localhost:8080/SocialPrinter_Web_02/registerGo.do";
		document.getElementById('register').submit();
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
				<li class="selected">
					<a href="#">register</a>
				</li>
				<li>
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
				<h2>Register</h2>
					<h3>You can register now!</h3>
				<img src="<c:url value="/resources/images/printer_01.jpg"/>" alt="">

				<h3>Registration Info. </h3>
				<form id="register" method="get" action="">
					<input type="text" name="serial" id="serial" value="Social Printer Serial Number Here..." >
					<input type="submit" name="register" onclick="goRegister();">
				</form>
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