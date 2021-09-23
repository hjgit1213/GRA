<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function join() {	
		location.href="join";	
	}
	
	function home() {	
		location.href="index";	
	}
</script>
<meta charset="EUC-KR">
<title>GRA - Game Ranking Analysis</title>
<%@ include file="header.jsp"%>

<style type="text/css">
	#loginForm1{
		width: 500px;
    	margin: auto;
    	margin-top: 300px;
    	margin-bottom: 300px;
    	height: 235px;
	}
	#loginForm2{
		height: 200px;
	}
	#btn{
		text-align: center;
		padding: 5px;
	}
	
	#textForm {
		width: 250px;
	}
	
	#label{
		width: 70px;
		padding: 5px;
	}
	#loginForm td{
		padding:3px;
		
	}
	#formTable {
		margin: auto;
	}
	
	#text_LOGIN {
		text-align: center;
		margin-bottom: 20px;
	}
	
	#login_btn{
		height: 78px;
	}
	
	#line{
		border-top: 5px solid black;
	}
	#input{
		padding: 5px;
	}
</style>
</head>
<body>		
	<div id="loginForm1">
	<hr id="line">
	<c:if test="${member == null }">									
		<form id="loginForm2" name="loginForm" method="post" action="login" class="form-inline">		
			<table id="formTable">
				<tr>
					<td colspan="3"><h1 id="text_LOGIN">LOGIN</h1></td>
				</tr>
				<tr>
					<td id="label">
						<div class="form-group">
							<label for="exampleInputEmail1">���̵�</label>
						</div>
					</td>
					<td id="input">
						<div class="form-group" id="textForm">
							<input type="text" id="textForm" name="id" class="form-control" placeholder="���̵� �Է��ϼ���."><br>
						</div>
					</td>
					<td rowspan="2">
						<div id="btn">
							<button type="submit" class="btn btn-default" id="login_btn">�α���</button>			
						</div>
					</td>
				</tr>
				<tr>
					<td id="label">
						<div class="form-group">
							<label for="exampleInputPassword1">��й�ȣ</label>
						</div>
					</td>
					<td id="input">
						<div class="form-group" id="textForm">
							<input type="password" id="textForm" name="passwd" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���."><br>
						</div>
					</td>
				</tr>
				<c:if test="${msg == false }">
					<tr>
						<td colspan="3">
							<p style="color: red; width: 67%;">���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.</p>
						</td>
					</tr>
				</c:if>
				
			</table>
		</form>
	</c:if>
	<c:if test="${member != null }">
		<%			
			response.sendRedirect("index");
		%>
	</c:if>
	<hr id="line">
	</div> 
	
	
	
</body>
<%@ include file="footer.jsp"%>
</html>