<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#header {
	background-color: black;
	font-family: 'GongGothicMedium', sans-serif;
	height: 215px;
}

.hi{	 
	text-align: right; 
	
}

#login li {
	list-style-type: none;
	float: right;
	color: white;
	width: 65px;
	margin-top: 10px;
	margin-right: 10px;
}

ul li a {
	color: white;
}

ul li a:hover {
	color: white;
}

#login {
	margin-top: -10px;
	margin-bottom: 10px;
	margin-right: 50px;
}

#title {
	text-align: center;
	margin-top: 10px;
}

#menu {
	width: 1000px;
	margin: auto;
	text-align: center;
	color: white;
	font-size: 16pt;
}

#menu tr td {
	width: 200px;
}

#menu tr td a {
	color: white;
}

#nav ul li {

}
@font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}



</style>
</head>
<body>
<div id="header">
	<div>
		<ul id="login">
			
			<%
				if (session.getAttribute("member") == null) {
			%>
					<li><a href="join">회원가입</a></li>
					<li><a href="login">로그인</a></li>
			<%
				} else {
			%>
					<li><a href="logout" >로그아웃</a></li>
					<li class="hi" style="width: 200px; margin-right: 30px;"><a>${member.name}님 환영합니다.</a></li>
			<%
				}
			%>
		</ul>
	</div>
	<br>
	<div id="title">
		<a href="index"><img src="resources/image/GTR_logo.PNG"></a>
	</div>
	<br>
	<div id="nav">
		
	</div>
</div>
<%@ include file="nav.jsp"%>
</body>
</html>