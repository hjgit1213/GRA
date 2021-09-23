<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ڷ�� �۾���</title>
<%@ include file="header.jsp"%>
<style type="text/css">
	#writeTable{
		width: 50%;
		margin: auto;
		margin-top: 100px;
	}
	
	#title_h3, #form_sub, #form_btn {
		font-family: 'GongGothicMedium', sans-serif;
		text-align: center;
	}
	
	#form_sub {
		vertical-align: middle;
	}
</style>
</head>
<body>
<c:if test="${member.id==null}">
	<script type="text/javascript">
		alert("�α����� �ʿ��� �����Դϴ�.");
		location.href="login";
	</script>
</c:if>
<form action="fileWriteForm" method="post" enctype="multipart/form-data">
<table class="table table-bordered" id="writeTable">
	<tr>
		<td colspan="2">
			<h3 id="title_h3">�ڷ�� �� �ۼ��ϱ�</h3>
		</td>		
	</tr>
	<tr>
		<td id="form_sub">����</td>
		<td><input class="form-control" type="text" name="subject" id="subjects" size="50" maxlength="100"></td>
	</tr>
	<tr>
		<td id="form_sub">÷������</td>
		<td><input class="form-control" type="file" name="uploadFile" id="uploadFile" size="50" maxlength="100"></td>
	</tr>
	<tr>
		<td id="form_sub">����</td>
		<td><textarea class="form-control" rows="20" name="content" id="content" maxlength="500" wrap="hard"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input id="form_btn" class="btn btn-danger" style="float: right;" type="submit" value="�۾���"></td>
	</tr>
	
</table>
<input type="hidden" value="${member.name}" name="name">
</form>
</body>
<%@ include file="footer.jsp"%>
</html>