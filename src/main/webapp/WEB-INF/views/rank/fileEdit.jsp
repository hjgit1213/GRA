<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ڷ�� �� �����ϱ�</title>
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
<%-- <form action="freeEdit?current_page=${current_page}" method="post">
	<input type="hidden" value="${fileBean.id_num }" name="id_num">
	����: <input type="text" value="${fileBean.subject }" name="subject" id="subjects" size="50" maxlength="100"> <br>
	����: <textarea rows="5" name="content" id="content" cols="50" maxlength="500">${fileBean.content }</textarea><br>
	<input type="submit" value="�۾���">
</form> --%>

<form action="fileEdit?current_page=${current_page}" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${fileBean.id_num }" name="id_num">
	<input type="hidden" value="${fileBean.fileName }" name="old_fileName">
	<input type="hidden" value="${fileBean.realFileName }" name="old_realFileName">
	<table class="table table-bordered" id="writeTable">
		<tr>
			<td colspan="2">
				<h3 id="title_h3">�����Խ��� �� �����ϱ�</h3>
			</td>		
		</tr>
		<tr>
			<td id="form_sub">����</td>
			<td><input class="form-control" value="${fileBean.subject }" type="text" name="subject" id="subject" size="50" maxlength="100"></td>
		</tr>
		<tr>
			<td id="form_sub">����</td>
			<td><textarea class="form-control" rows="20" name="content" id="content" maxlength="500" wrap="hard">${fileBean.content }</textarea></td>
		</tr>
		<tr>
			<td id="form_sub">÷������</td>
			<td><input class="form-control" type="file" name="uploadFile" id="uploadFile"></td>
		</tr>		
		<tr>
			<td colspan="2"><input id="form_btn" class="btn btn-danger" style="float: right;" type="submit" value="�����ϱ�"></td>		</tr>
		
	</table>
</form>
</body>
<%@ include file="footer.jsp"%>
</html>